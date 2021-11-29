#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC_V4_2018.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC_V4_2018.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=src/myfunc/display.c src/myfunc/spi.c src/myfunc/Tsensor.c src/myfunc/wr_eeprom.c src/myfunc/maths.c src/myfunc/dac8568.c src/myfunc/ads8332.c src/myfunc/analog.c src/main.c src/setup.c src/cbuffer.c src/uartbuf.c src/frame.c src/isr.c src/functions.c src/utils.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/myfunc/display.o ${OBJECTDIR}/src/myfunc/spi.o ${OBJECTDIR}/src/myfunc/Tsensor.o ${OBJECTDIR}/src/myfunc/wr_eeprom.o ${OBJECTDIR}/src/myfunc/maths.o ${OBJECTDIR}/src/myfunc/dac8568.o ${OBJECTDIR}/src/myfunc/ads8332.o ${OBJECTDIR}/src/myfunc/analog.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/setup.o ${OBJECTDIR}/src/cbuffer.o ${OBJECTDIR}/src/uartbuf.o ${OBJECTDIR}/src/frame.o ${OBJECTDIR}/src/isr.o ${OBJECTDIR}/src/functions.o ${OBJECTDIR}/src/utils.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/myfunc/display.o.d ${OBJECTDIR}/src/myfunc/spi.o.d ${OBJECTDIR}/src/myfunc/Tsensor.o.d ${OBJECTDIR}/src/myfunc/wr_eeprom.o.d ${OBJECTDIR}/src/myfunc/maths.o.d ${OBJECTDIR}/src/myfunc/dac8568.o.d ${OBJECTDIR}/src/myfunc/ads8332.o.d ${OBJECTDIR}/src/myfunc/analog.o.d ${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/setup.o.d ${OBJECTDIR}/src/cbuffer.o.d ${OBJECTDIR}/src/uartbuf.o.d ${OBJECTDIR}/src/frame.o.d ${OBJECTDIR}/src/isr.o.d ${OBJECTDIR}/src/functions.o.d ${OBJECTDIR}/src/utils.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/myfunc/display.o ${OBJECTDIR}/src/myfunc/spi.o ${OBJECTDIR}/src/myfunc/Tsensor.o ${OBJECTDIR}/src/myfunc/wr_eeprom.o ${OBJECTDIR}/src/myfunc/maths.o ${OBJECTDIR}/src/myfunc/dac8568.o ${OBJECTDIR}/src/myfunc/ads8332.o ${OBJECTDIR}/src/myfunc/analog.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/setup.o ${OBJECTDIR}/src/cbuffer.o ${OBJECTDIR}/src/uartbuf.o ${OBJECTDIR}/src/frame.o ${OBJECTDIR}/src/isr.o ${OBJECTDIR}/src/functions.o ${OBJECTDIR}/src/utils.o

# Source Files
SOURCEFILES=src/myfunc/display.c src/myfunc/spi.c src/myfunc/Tsensor.c src/myfunc/wr_eeprom.c src/myfunc/maths.c src/myfunc/dac8568.c src/myfunc/ads8332.c src/myfunc/analog.c src/main.c src/setup.c src/cbuffer.c src/uartbuf.c src/frame.c src/isr.c src/functions.c src/utils.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PIC_V4_2018.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F46K20
MP_PROCESSOR_OPTION_LD=18f46k20
MP_LINKER_DEBUG_OPTION= -u_DEBUGCODESTART=0xfd30 -u_DEBUGCODELEN=0x2d0 -u_DEBUGDATASTART=0xef4 -u_DEBUGDATALEN=0xb
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/myfunc/display.o: src/myfunc/display.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/display.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/display.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/display.o   src/myfunc/display.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/display.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/display.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/spi.o: src/myfunc/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/spi.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/spi.o   src/myfunc/spi.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/spi.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/Tsensor.o: src/myfunc/Tsensor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/Tsensor.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/Tsensor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/Tsensor.o   src/myfunc/Tsensor.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/Tsensor.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/Tsensor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/wr_eeprom.o: src/myfunc/wr_eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/wr_eeprom.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/wr_eeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/wr_eeprom.o   src/myfunc/wr_eeprom.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/wr_eeprom.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/wr_eeprom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/maths.o: src/myfunc/maths.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/maths.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/maths.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/maths.o   src/myfunc/maths.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/maths.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/maths.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/dac8568.o: src/myfunc/dac8568.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/dac8568.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/dac8568.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/dac8568.o   src/myfunc/dac8568.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/dac8568.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/dac8568.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/ads8332.o: src/myfunc/ads8332.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/ads8332.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/ads8332.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/ads8332.o   src/myfunc/ads8332.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/ads8332.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/ads8332.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/analog.o: src/myfunc/analog.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/analog.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/analog.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/analog.o   src/myfunc/analog.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/analog.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/analog.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/main.o: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/main.o   src/main.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/main.o 
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/setup.o: src/setup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/setup.o.d 
	@${RM} ${OBJECTDIR}/src/setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/setup.o   src/setup.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/setup.o 
	@${FIXDEPS} "${OBJECTDIR}/src/setup.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/cbuffer.o: src/cbuffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/cbuffer.o.d 
	@${RM} ${OBJECTDIR}/src/cbuffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/cbuffer.o   src/cbuffer.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/cbuffer.o 
	@${FIXDEPS} "${OBJECTDIR}/src/cbuffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/uartbuf.o: src/uartbuf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/uartbuf.o.d 
	@${RM} ${OBJECTDIR}/src/uartbuf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/uartbuf.o   src/uartbuf.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/uartbuf.o 
	@${FIXDEPS} "${OBJECTDIR}/src/uartbuf.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/frame.o: src/frame.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/frame.o.d 
	@${RM} ${OBJECTDIR}/src/frame.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/frame.o   src/frame.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/frame.o 
	@${FIXDEPS} "${OBJECTDIR}/src/frame.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/isr.o: src/isr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/isr.o.d 
	@${RM} ${OBJECTDIR}/src/isr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/isr.o   src/isr.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/isr.o 
	@${FIXDEPS} "${OBJECTDIR}/src/isr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/functions.o: src/functions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/functions.o.d 
	@${RM} ${OBJECTDIR}/src/functions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/functions.o   src/functions.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/functions.o 
	@${FIXDEPS} "${OBJECTDIR}/src/functions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/utils.o: src/utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/utils.o.d 
	@${RM} ${OBJECTDIR}/src/utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/utils.o   src/utils.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/utils.o 
	@${FIXDEPS} "${OBJECTDIR}/src/utils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
else
${OBJECTDIR}/src/myfunc/display.o: src/myfunc/display.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/display.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/display.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/display.o   src/myfunc/display.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/display.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/display.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/spi.o: src/myfunc/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/spi.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/spi.o   src/myfunc/spi.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/spi.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/Tsensor.o: src/myfunc/Tsensor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/Tsensor.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/Tsensor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/Tsensor.o   src/myfunc/Tsensor.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/Tsensor.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/Tsensor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/wr_eeprom.o: src/myfunc/wr_eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/wr_eeprom.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/wr_eeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/wr_eeprom.o   src/myfunc/wr_eeprom.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/wr_eeprom.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/wr_eeprom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/maths.o: src/myfunc/maths.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/maths.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/maths.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/maths.o   src/myfunc/maths.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/maths.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/maths.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/dac8568.o: src/myfunc/dac8568.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/dac8568.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/dac8568.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/dac8568.o   src/myfunc/dac8568.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/dac8568.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/dac8568.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/ads8332.o: src/myfunc/ads8332.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/ads8332.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/ads8332.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/ads8332.o   src/myfunc/ads8332.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/ads8332.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/ads8332.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/myfunc/analog.o: src/myfunc/analog.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/myfunc" 
	@${RM} ${OBJECTDIR}/src/myfunc/analog.o.d 
	@${RM} ${OBJECTDIR}/src/myfunc/analog.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/myfunc/analog.o   src/myfunc/analog.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/myfunc/analog.o 
	@${FIXDEPS} "${OBJECTDIR}/src/myfunc/analog.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/main.o: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/main.o   src/main.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/main.o 
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/setup.o: src/setup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/setup.o.d 
	@${RM} ${OBJECTDIR}/src/setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/setup.o   src/setup.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/setup.o 
	@${FIXDEPS} "${OBJECTDIR}/src/setup.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/cbuffer.o: src/cbuffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/cbuffer.o.d 
	@${RM} ${OBJECTDIR}/src/cbuffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/cbuffer.o   src/cbuffer.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/cbuffer.o 
	@${FIXDEPS} "${OBJECTDIR}/src/cbuffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/uartbuf.o: src/uartbuf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/uartbuf.o.d 
	@${RM} ${OBJECTDIR}/src/uartbuf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/uartbuf.o   src/uartbuf.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/uartbuf.o 
	@${FIXDEPS} "${OBJECTDIR}/src/uartbuf.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/frame.o: src/frame.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/frame.o.d 
	@${RM} ${OBJECTDIR}/src/frame.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/frame.o   src/frame.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/frame.o 
	@${FIXDEPS} "${OBJECTDIR}/src/frame.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/isr.o: src/isr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/isr.o.d 
	@${RM} ${OBJECTDIR}/src/isr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/isr.o   src/isr.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/isr.o 
	@${FIXDEPS} "${OBJECTDIR}/src/isr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/functions.o: src/functions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/functions.o.d 
	@${RM} ${OBJECTDIR}/src/functions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/functions.o   src/functions.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/functions.o 
	@${FIXDEPS} "${OBJECTDIR}/src/functions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/src/utils.o: src/utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/utils.o.d 
	@${RM} ${OBJECTDIR}/src/utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"./include" -ms -oa- -Ls -nw=2066  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/src/utils.o   src/utils.c  -nw=2066
	@${DEP_GEN} -d ${OBJECTDIR}/src/utils.o 
	@${FIXDEPS} "${OBJECTDIR}/src/utils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PIC_V4_2018.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION_LD)  -w -x -u_DEBUG -m"toto.txt"  -z__MPLAB_BUILD=1  -u_CRUNTIME -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_PK3=1 $(MP_LINKER_DEBUG_OPTION) -l ${MP_CC_DIR}/../lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC_V4_2018.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
else
dist/${CND_CONF}/${IMAGE_TYPE}/PIC_V4_2018.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION_LD)  -w  -m"toto.txt"  -z__MPLAB_BUILD=1  -u_CRUNTIME -l ${MP_CC_DIR}/../lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC_V4_2018.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
