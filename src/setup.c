#include <usart.h>
#include <timers.h>
#include <spi.h>

#include "setup.h"
#include "Generic.h"
#include "board.h"
#include "functions.h"

#define BAUDRATE  115200
#define _SPBRG ((FOSC/BAUDRATE)/16)-1

extern BYTE valeur_portA;
extern BYTE valeur_trisA;
extern BYTE valeur_portB;
extern BYTE valeur_trisB;
extern BYTE valeur_portC;
extern BYTE valeur_trisC;
extern BYTE valeur_portD;
extern BYTE valeur_trisD;
extern BYTE valeur_trisE;


extern UINT HvValueTab[4][2];
extern UINT HvInc[4];
extern BYTE HvStatus[4];
extern BYTE enableHVMeas;
extern UINT HvPhysTarget[4];
extern UINT HvPhysCorrect[4];

extern UINT HV_borne_sup_A1; //maximum value to reach for 200V high voltage module (telescope A)
extern UINT HV_borne_sup_A2; //maximum value to reach for 400V high voltage module (telescope A)
extern UINT HV_borne_sup_B1; //maximum value to reach for 200V high voltage module (telescope B)
extern UINT HV_borne_sup_B2; //maximum value to reach for 400V high voltage module (telescope B)

extern BYTE default_DA1; //warning for a problem detected for the A1 detector
extern BYTE default_DA2; //warning for a problem detected for the A2 detector
extern BYTE default_DB1; //warning for a problem detected for the B1 detector
extern BYTE default_DB2; //warning for a problem detected for the B2 detector


extern UINT32 coefA_A1;
extern UINT32 coefA_A2;
extern UINT32 coefA_B1;
extern UINT32 coefA_B2;
extern UINT32 coefB_A1;
extern UINT32 coefB_A2;
extern UINT32 coefB_B1;
extern UINT32 coefB_B2;

extern BYTE cal_preampli_offset;
extern BYTE marge_pa_offset;

extern ram UINT tsensor_1_min;
extern ram UINT tsensor_1_max;
extern ram UINT tsensor_limit;
extern ram BYTE time_reset;
extern ram BYTE time_start;
extern ram BYTE time_bit0;
extern ram BYTE time_bit1;
extern ram BYTE time_wait;

extern ram BYTE CSI_relay;

extern ram UINT32 time_scheduling;
extern ram UINT32 shortInspecTime;
extern ram UINT32 longInspecTime;

extern ram long int HV_read_coefA[4];
extern ram long int HV_read_coefB[4];

extern ram UINT lcA1;
extern ram UINT lcA2;
extern ram UINT lcB1;
extern ram UINT lcB2;

extern ram UINT GeneDacVoltage;

void ucsetup(void) {

    UINT co,cp,dep;
    UINT sTime,lTime;
    UINT32 *coefA,*coefB;

    // configure PORT A,B,C,D
    /*Port name : function name : I/O    : TRIS value */
    /*RB0: TDI                  : Output : Valeur 0*/
    /*RB1: TDO                  : Input  : Valeur 1*/
    /*RB2: TMS                  : Output : Valeur 0*/
    /*RB3: TCK                  : Output : Valeur 0*/
    /*RB4: capteur T?C          : Input  : Valeur 1*/
    /*RB5: UC_SPI_CS_ADC_N      : Output : Valeur 0*/
    /*RB6: PGC                  : Output : Valeur 0*/
    /*RB7: PGD                  : Output : Valeur 0*/

    /*RA0: GEOA0                : Input  : Valeur 1*/
    /*RA1: GEOA1                : Input  : Valeur 1*/
    /*RA2: GEOA2                : Input  : Valeur 1*/
    /*RA3: A_VERS_PIC           : Input  : Valeur 1*/
    /*RA4: B_VERS_PIC<1>        : Input  : Valeur 1*/
    /*RA5: B_VERS_PIC<2>        : Input  : Valeur 1*/

    /*RC0: UC_SPI_CS_DAC_N      : Output : Valeur 0*/
    /*RC1: UC_SPI_SS_TEL_A_N    : Output : Valeur 0*/
    /*RC2: UC_SPI_SS_TEL_B_N    : Output : Valeur 0*/
    /*RC3: UC_SPI_SCK           : Output : Valeur 0*/
    /*RC4: UC_SPI_SDI           : Input  : Valeur 1*/
    /*RC5: UC_SPI_SDO           : Output : Valeur 0*/
    /*RC6: TX                   : Output : Valeur 0*/
    /*RC7: RX                   : Input  : Valeur 1*/

    /*RD0: NC                   : Output : Valeur 0*/
    /*RD1: NC                   : Output : Valeur 0*/
    /*RD2: CTRL_HVA3            : Output : Valeur 0*/
    /*RD3: CTRL_HVB3            : Output : Valeur 0*/
    /*RD4: LT2308_LIN_CONVST    : Output : Valeur 0*/
    /*RD5: LT2308_SW_CONVST     : Output : Valeur 0*/
    /*RD6: ADS8332_CONVST       : Output : Valeur 0*/
    /*RD7: ADS8332_EOC          : Input  : Valeur 1*/

    /*RE0: VP5REFAM             : Input  : Valeur 1*/
    /*RE1: VP5REFBM             : Input  : Valeur 1*/
    /*RE2: VM27M                : Input  : Valeur 1*/


    
    time_scheduling=0;

    time_bit0=22;
    time_bit1=63;
    time_reset=64;
    time_start=144;
    time_wait=64;
    tsensor_1_min=(UINT)(6);
    tsensor_1_max=(UINT)(800);
    tsensor_limit=(UINT)(800);

    for (cp=0;cp<4;cp++)
    {
        EERead(cp+EEprom_HV_borne_sup_A1);
    }

    HV_borne_sup_A1 = (((UINT)EERead(EEprom_HV_borne_sup_A1+1))<<8)+((UINT)EERead(EEprom_HV_borne_sup_A1));
    HV_borne_sup_A2 = (((UINT)EERead(EEprom_HV_borne_sup_A1+3))<<8)+((UINT)EERead(EEprom_HV_borne_sup_A1+2));
    HV_borne_sup_B1 = (((UINT)EERead(EEprom_HV_borne_sup_A1+5))<<8)+((UINT)EERead(EEprom_HV_borne_sup_A1+4));
    HV_borne_sup_B2 = (((UINT)EERead(EEprom_HV_borne_sup_A1+7))<<8)+((UINT)EERead(EEprom_HV_borne_sup_A1+6));

    if (HV_borne_sup_A1>HVSi1Max)
        apply_hvmax('A','1',HVSi1Max);    

    if (HV_borne_sup_A2>HVSi2Max)
        apply_hvmax('A','2',HVSi2Max);

    if (HV_borne_sup_B1>200)
        apply_hvmax('B','1',HVSi1Max);

    if (HV_borne_sup_B2>350)
        apply_hvmax('B','2',HVSi2Max);

    sTime = (((UINT)EERead(EEprom_HV_short_Inspec_Time+1))<<8)+((UINT)EERead(EEprom_HV_short_Inspec_Time));
    lTime = (((UINT)EERead(EEprom_HV_long_Inspec_Time+1))<<8)+((UINT)EERead(EEprom_HV_long_Inspec_Time));

    if ((lTime<=sTime)||(lTime==0)||(sTime==0))
    {
        shortInspecTime = shortInspecDelay;
        longInspecTime = normalInspecDelay;
        EEWrite(EEprom_HV_short_Inspec_Time + 1, (BYTE) (((shortInspecTime/15000)& 0xFF00) >> 8));
        EEWrite(EEprom_HV_short_Inspec_Time, (BYTE) (((shortInspecTime/15000)&0xFF)));

        EEWrite(EEprom_HV_long_Inspec_Time + 1, (BYTE) (((longInspecTime/15000)& 0xFF00) >> 8));
        EEWrite(EEprom_HV_long_Inspec_Time, (BYTE) (((longInspecTime/15000)&0xFF)));
    }
    else
    {
        shortInspecTime = 15000*((UINT32)sTime);
        longInspecTime = 15000*((UINT32)lTime);
    }
    
    default_DA1=0;
    default_DA2=0;
    default_DB1=0;
    default_DB2=0;

    valeur_portB=0b11100000;
    valeur_trisB=0b00010010;

    valeur_portA=0b00000000;
    valeur_trisA=0b00111111;

    valeur_trisC=0b10010000;
    valeur_portC=0b00000111;

    valeur_trisD=0b10000000;
    valeur_portD=0b01111100;

    valeur_trisE=0b00000111;

    TRISA=valeur_trisA;
    PORTA=valeur_portA;
    TRISB=valeur_trisB;
    PORTB=valeur_portB;
    TRISC=valeur_trisC;
    PORTC=valeur_portC;
    TRISD=valeur_trisD;
    PORTD=valeur_portD;
    TRISE=valeur_trisE;

    //Analog conversion
    ANSEL=0xE0;
    ANSELH=0;
    ADCON2=0b10100100; //ADFM = 1, ACQ time = 100 for 8 TAD and ADCS = 100 for FOSC/4
    ADCON1=0; //bit 5 : VCFG1 = 0 to select VSS and bit 4 : VCFG0 = 0 to select VDD
    

    GeneDacVoltage=0;
    
    // configure USART
    TXSTA = 0; // Reset USART registers to POR state
    RCSTA = 0;
    //TRISCbits.RC6 = 1;
    //TRISCbits.RC7 = 1;
    TXSTAbits.BRGH = 1;
    SPBRG = _SPBRG; // Write baudrate to SPBRG1
    SPBRGH = _SPBRG >> 8; // For 16-bit baud rate generation
    TXSTAbits.SYNC = 0;
    TXSTAbits.TXEN = 1; // Enable transmitter
    RCSTAbits.SPEN = 1; // Enable receiver
    RCSTAbits.CREN = 1;

//    //Timer1 Registers Prescaler= 8 - TMR1 Preset = 0 - Freq = 22.89 Hz - Period = 0.043691 seconds
//    T1CONbits.T1CKPS1 = 1; // bits 5-4  Prescaler Rate Select bits
//    T1CONbits.T1CKPS0 = 1; // bit 4
//    T1CONbits.T1OSCEN = 0; // bit 3 Timer1 Oscillator Enable Control bit 1 = on
//    T1CONbits.T1SYNC = 1; // bit 2 Timer1 External Clock Input Synchronization Control bit...1 = Do not synchronize external clock input
//    T1CONbits.TMR1CS = 0; // bit 1 Timer1 Clock Source Select bit...0 = Internal clock (FOSC/4)
//    T1CONbits.TMR1ON = 1; // bit 0 enables timer
//    TMR1H = 3; // preset for timer1 MSB register
//    TMR1L = 120; // preset for timer1 LSB register
//
//    PIR1bits.TMR1IF = 0; // clear timer1 interupt flag TMR1IF
//    PIE1bits.TMR1IE = 1; // enable Timer1 interrupts

//    RCONbits.IPEN = 1; // enable interrupt priority levels
//    INTCONbits.GIEH = 1; // enable the high priority interrupts
//    INTCONbits.GIEL = 1; // enable the low priority interrupts
//
//    // USART interrupts
//    IPR1bits.RCIP = 1;   // USART interrupt : high priority
//    PIE1bits.RCIE = 1; // Enable Rx interrupts

    //used to execute high priority functions
//    OpenTimer0(TIMER_INT_ON & T0_16BIT & T0_SOURCE_INT & T0_PS_1_8);
//    TMR0H = 3; // preset for timer1 MSB register
//    TMR0L = 120; // preset for timer1 LSB register
//    INTCON2bits.TMR0IP=0;
//    INTCONbits.TMR0IE=1;

//    OpenTimer0(TIMER_INT_ON & T0_16BIT & T0_SOURCE_INT & T0_PS_1_1);
//    TMR0H = 0; // preset for timer1 MSB register
//    TMR0L = 0; // preset for timer1 LSB register
//    INTCON2bits.TMR0IP=1;
//    INTCONbits.TMR0IE=0;

    //The Timer1 device is required for T?C sensor functions
    OpenTimer1(TIMER_INT_OFF & T1_16BIT_RW & T1_SOURCE_INT & T1_PS_1_8 & T1_OSC1EN_OFF & T1_SYNC_EXT_OFF);

    //The Timer 2 device is required to wait for the OK status of the FPGA
//    OpenTimer2(TIMER_INT_ON & T2_PS_1_16 & T2_POST_1_16);
//    IPR1bits.TMR2IP=0; //TMR2-to-PR2 match interrupt : low priority
//    PIE1bits.TMR2IE=1; //enable the TMR2-to-PR2 match interrupt

    //The Timer3 device is required for the High voltage slope
    OpenTimer3(TIMER_INT_OFF & T3_16BIT_RW & T3_SOURCE_INT & T3_PS_1_1 & T3_SYNC_EXT_OFF);
    IPR2bits.TMR3IP=1; // TMR3 overflow interrupt priority bit : low priority
    PIE2bits.TMR3IE=0; // disable the TMR3 overflow interrupt. It will be enabled when the setHTV function will be called
//    PR2=0xFA;

    OpenSPI(SPI_FOSC_16, MODE_10,SMPMID);

    dac_init();
    adc_init();
    dac_sequence(0,0);

    for (cp=0;cp<4;cp++)
    {
        HvValueTab[cp][0]=0;
        HvValueTab[cp][1]=0;
        HvInc[cp]=0;
        HvStatus[cp]=1;
        HvPhysTarget[cp]=0;
        HvPhysCorrect[cp]=0;
    }



    cal_preampli_offset=0;
    marge_pa_offset=101;

    //initialize the high voltage modules
    dac_sequence(0x10,HvValueTab[0][0]);
    dac_sequence(0x20,HvValueTab[1][0]);
    dac_sequence(0x30,HvValueTab[2][0]);
    dac_sequence(0x40,HvValueTab[3][0]);

    coefA_A1=0;
    coefA_A2=0;
    coefA_B1=0;
    coefA_B2=0;
    coefB_A1=0;
    coefB_A2=0;
    coefB_B1=0;
    coefB_B2=0;

    lcA1=0;
    lcA2=0;
    lcB1=0;
    lcB2=0;

    CSI_relay=0;

    
    for (cp=0;cp<4;cp++)
    {
        dep=EEprom_cal_HV_first_adr+cp*EEprom_cal_HV_width;
        
        if (EERead(cp+EEprom_cal_HV_calibrated)==SPI_KEY)
        {
            switch(cp)
            {
                case 0:
                    coefA=&coefA_A1;
                    coefB=&coefB_A1;
                    break;

                case 1:
                    coefA=&coefA_A2;
                    coefB=&coefB_A2;
                    break;

                case 2:
                    coefA=&coefA_B1;
                    coefB=&coefB_B1;
                    break;

                case 3:
                    coefA=&coefA_B2;
                    coefB=&coefB_B2;
                    break;

                default:
                    break;
            }
            
            *coefA=0;
            *coefB=0;
            for(co=dep;co<dep+4;co++)
            {
                /*if (cp==0)
                {
                    printf("EEPROM:%u\r\n",EERead(co));
                    while(BusyUSART());
                    printf("EEPROM decalee:%lu\r\n",(((UINT32)(EERead(co)))<<(8*(co-dep))));
                    while(BusyUSART());
                }*/
                *coefA=*coefA+(((UINT32)(EERead(co)))<<(8*(co-dep)));
            }

            for(co=dep+4;co<dep+8;co++)
                *coefB=*coefB+(((UINT32)(EERead(co)))<<(8*(co-dep-4)));
            
            /*if (cp==0)
            {
                printf("coefa:%lu\r\n",*coefA);
                while(BusyUSART());
                printf("coefb:%lu\r\n",*coefB);
                while(BusyUSART());
            }*/
        }
    }

    for (cp=0;cp<4;cp++)
    {
        HV_read_coefA[cp]=0;
        HV_read_coefB[cp]=0;
        dep=EEprom_coef_HV_reading+6*cp;

        if ((EERead(dep+1)==0xFF)&&(EERead(dep)==0xFF))
        {
            if ((cp==0)||(cp==2))
            {
                HV_read_coefA[cp]=6167;
                HV_read_coefB[cp]=180235;
            }
            else
            {
                HV_read_coefA[cp]=9819;
                HV_read_coefB[cp]=669642;
            }
        }
        else
        {
            HV_read_coefA[cp]=(((long int)(EERead(dep+1)))<<8)+(long int)(EERead(dep));
            
            HV_read_coefB[cp]=0;

            for (co=dep+2;co<dep+5;co++)
                HV_read_coefB[cp]=HV_read_coefB[cp]+(((long int)(EERead(co)))<<(8*(co-dep-2)));
            
            if (EERead(dep+5)==0)
                HV_read_coefB[cp]=0-HV_read_coefB[cp];
        }

//        printf("HV_read_coefA[%u]=%lu\r\n",cp,HV_read_coefA[cp]);
//        while(BusyUSART());
//        printf("HV_read_coefB[%u]=%lu\r\n",cp,HV_read_coefB[cp]);
//        while(BusyUSART());
    }

    enableHVMeas = EERead(49);
}

void memsetup(void) {

}

// EOF
