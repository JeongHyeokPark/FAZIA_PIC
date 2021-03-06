#include "functions.h"

extern BYTE valeur_portC;

//extern ram UINT data_vhva1; // 200V high voltage module for A telescope
//extern ram UINT data_vhva2; // 400V high voltage module for A telescope
//extern ram UINT data_vhvb1; // 200V high voltage module for B telescope
//extern ram UINT data_vhvb2; // 400V high voltage module for B telescope
//extern ram UINT data_vhva1_2; //actual value for 200V high voltage module (telescope A) after the 20.2Mohm resistor
//extern ram UINT data_vhva2_2; //actual value for 400V high voltage module (telescope A) after the 20.2Mohm resistor
//extern ram UINT data_vhvb1_2; //actual value for 200V high voltage module (telescope B) after the 20.2Mohm resistor
//extern ram UINT data_vhvb2_2; //actual value for 400V high voltage module (telescope B) after the 20.2Mohm resistor


extern ram BYTE hv_slop_inc_flag;
extern ram UINT HV_borne_sup_A1; //maximum value to reach for 200V high voltage module (telescope A)
extern ram UINT HV_borne_sup_A2; //maximum value to reach for 400V high voltage module (telescope A)
extern ram UINT HV_borne_sup_B1; //maximum value to reach for 200V high voltage module (telescope B)
extern ram UINT HV_borne_sup_B2; //maximum value to reach for 400V high voltage module (telescope B)


//extern BYTE HV_order;
//extern BYTE cal_HV_order;
//extern BYTE HV_direction;
//extern BYTE dac_hv;
//extern UINT *data_ptr;
//extern UINT *data_ptr_2;
//extern UINT32 value_dec;
//extern UINT32 inc;

extern UINT HvValueTab[4][2];
extern UINT HvInc[4];
extern BYTE HvStatus[4];
extern UINT HvPhysTarget[4];

char dac_init(void) {
    unsigned char mode_sync[] = {0x06, 0, 0, 0xFF};
    unsigned char ref_intern[] = {0x09, 0x0A, 0, 0};

    valeur_portC = valeur_portC | 0b00000001; /*on remet la patte sync du DAC a 1*/
    PORTC = valeur_portC;

    valeur_portC = valeur_portC & 0b11111110; /*on impose la patte sync a  0V pour ecrire une sequence*/
    PORTC = valeur_portC;

    myputsspi(4, mode_sync);

    valeur_portC = valeur_portC | 0b00000001; /*on remet la patte sync du DAC a 1*/
    PORTC = valeur_portC;

    valeur_portC = valeur_portC & 0b11111110; /*on impose la patte sync a  0V pour ecrire une sequence*/
    PORTC = valeur_portC;

    myputsspi(4, ref_intern);

    valeur_portC = valeur_portC | 0b00000001; /*on remet la patte sync du DAC a 1*/
    PORTC = valeur_portC;

    return 0;

}

void dac_sequence(char ad, unsigned int data) {
    unsigned char sequence[4];

    valeur_portC = valeur_portC | 0b00000001; /*on remet la patte sync du DAC a 1*/
    PORTC = valeur_portC;

    sequence[0] = 0x03;
    sequence[1] = ad | ((unsigned char) (((data & 0xF000) >> 12)));
    sequence[2] = (unsigned char) (((data & 0x0FF0) >> 4));
    sequence[3] = (unsigned char) (((data & 0x000F) << 4));

    valeur_portC = valeur_portC & 0b11111110; /*on impose la patte sync a  0V pour ecrire une sequence*/
    PORTC = valeur_portC;

    myputsspi(4, sequence);

    valeur_portC = valeur_portC | 0b00000001; /*on remet la patte sync du DAC a 1*/
    PORTC = valeur_portC;
}

char pulser(UINT data, UINT period, UINT high_time) {
    dac_sequence(0x40, data);
    wrspi(2, 0x100, period);
    wrspi(2, 0x101, high_time);
}

void ask_hv_calibration(char *str) {
    BYTE co, cp;
    BYTE nbmodules; //contains the number of high voltage modules which are calibrated

    nbmodules = 0;
    str[0] = '0';
    cp = 1;
    for (co = 0; co < 4; co++) {
        if (EERead(EEprom_cal_HV_calibrated + co) == SPI_KEY) {
            nbmodules++;
            str[0] = (char) nbmodules + '0';
            str[cp++] = ',';
            str[cp++] = 'A' + (char) ((co & 0b10) >> 1);
            str[cp++] = '1' + (char) (co & 0b01);
        }
    }
    str[cp] = '\0';
}

UINT32 get_value_dec(UINT tension, UINT adrCal) {
	UINT vinf, vsup, unites, dec, adr;
	UINT32 value;
	
	if(tension==0) value=0;
	else {
		vinf = 0; vsup = 0;
		dec=tension/10;
		unites=tension-10*dec;
		if(unites==0) {
			adr=2*dec+adrCal-2;
			value=256*EERead(adr+1)+EERead(adr);
		}
		else {
			if(tension<10) vinf=0;
			else {
				adr=2*dec+adrCal-2;
				vinf=256*EERead(adr+1)+EERead(adr);
			}
			adr=2*dec+adrCal;
			vsup=256*EERead(adr+1)+EERead(adr);
			value=vinf+((vsup-vinf)*unites+5)/10;
		}
	}
	return value;
}

BYTE slop_vhv(char tel, BYTE module, UINT tension, UINT32 slopeVS)
{
    BYTE verdict;
    UINT32 value_dec;
    UINT32 inc;

    verdict = FUNC_EXEC_BAD_ARGS_TYPE;

    if ((module == 1) && (tel == 'A'))
    {
        if (EERead(EEprom_is_cal_HV_discret) == 0)
        {
            value_dec = get_value_dec(tension, EEprom_si1A_cal_Hv_discret);
            
            if (value_dec > (UINT32)(HVSi1Max) * (UINT32)(coefHV_M200) / 1000)
                value_dec = (((UINT32) tension) * coefHV_M200) / 1000;
        }
        else
            value_dec = (((UINT32) tension) * coefHV_M200) / 1000;

        inc = (slopeVS * coefHV_M200) / 1000;
        verdict = FUNC_EXEC_OK;
    }

    if ((module == 1) && (tel == 'B'))
    {
        if (EERead(EEprom_is_cal_HV_discret + 1) == 0)
        {
            value_dec = get_value_dec(tension, EEprom_si1B_cal_Hv_discret);

            if (value_dec > (UINT32)(HVSi1Max) * (UINT32)(coefHV_M200) / 1000)
                value_dec = (((UINT32) tension) * coefHV_M200) / 1000;
        }
        else
            value_dec = (((UINT32) tension) * coefHV_M200) / 1000;
            

        inc = (slopeVS * coefHV_M200) / 1000;
        verdict = FUNC_EXEC_OK;
    }

    if ((module == 2) && (tel == 'A'))
    {
        if ((EERead(EEprom_is_cal_HV_discret + 2) == 0) && (tension <= HVSi2Max))
        {
            value_dec = get_value_dec(tension, EEprom_si2A_cal_Hv_discret);

            if (value_dec > (UINT32)(HVSi2Max) * (UINT32)(coefHV_M400) / 1000)
                value_dec = (((UINT32) tension) * coefHV_M400) / 1000;
        }
        else
            value_dec = (((UINT32) tension) * coefHV_M400) / 1000;
        inc = (slopeVS * coefHV_M400) / 1000;
        verdict = FUNC_EXEC_OK;
    }

    if ((module == 2) && (tel == 'B')) {
        if ((EERead(EEprom_is_cal_HV_discret + 3) == 0) && (tension <= HVSi2Max))
        {
            value_dec = get_value_dec(tension, EEprom_si2B_cal_Hv_discret);

            if (value_dec > (UINT32)(HVSi2Max) * (UINT32)(coefHV_M400) / 1000)
                value_dec = (((UINT32) tension) * coefHV_M400) / 1000;
        } 
        else
            value_dec = (((UINT32) tension) * coefHV_M400) / 1000;
            
        inc = (slopeVS * coefHV_M400) / 1000;
        verdict = FUNC_EXEC_OK;
    }

    if (verdict == FUNC_EXEC_OK)
    {
        HvValueTab[module - 1 + 2 * ((BYTE) (tel - 'A'))][1] = (UINT) value_dec;
        HvInc[module - 1 + 2 * ((BYTE) (tel - 'A'))] = (UINT) inc;
        HvStatus[module - 1 + 2 * ((BYTE) (tel - 'A'))] = 0;
    }

    return verdict;
}



