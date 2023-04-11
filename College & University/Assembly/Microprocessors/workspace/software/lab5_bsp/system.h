/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'nios_adv'
 * SOPC Builder design path: I:/Microprocessors/workspace/nios_adv.sopcinfo
 *
 * Generated: Thu Oct 06 08:20:05 CDT 2016
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * Async_counter0 configuration
 *
 */

#define ALT_MODULE_CLASS_Async_counter0 avalon_slave_async_counter
#define ASYNC_COUNTER0_BASE 0x10000600
#define ASYNC_COUNTER0_IRQ -1
#define ASYNC_COUNTER0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ASYNC_COUNTER0_NAME "/dev/Async_counter0"
#define ASYNC_COUNTER0_SPAN 16
#define ASYNC_COUNTER0_TYPE "avalon_slave_async_counter"


/*
 * Async_counter1 configuration
 *
 */

#define ALT_MODULE_CLASS_Async_counter1 avalon_slave_async_counter
#define ASYNC_COUNTER1_BASE 0x10000640
#define ASYNC_COUNTER1_IRQ -1
#define ASYNC_COUNTER1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ASYNC_COUNTER1_NAME "/dev/Async_counter1"
#define ASYNC_COUNTER1_SPAN 16
#define ASYNC_COUNTER1_TYPE "avalon_slave_async_counter"


/*
 * Async_counter2 configuration
 *
 */

#define ALT_MODULE_CLASS_Async_counter2 avalon_slave_async_counter
#define ASYNC_COUNTER2_BASE 0x10000680
#define ASYNC_COUNTER2_IRQ -1
#define ASYNC_COUNTER2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ASYNC_COUNTER2_NAME "/dev/Async_counter2"
#define ASYNC_COUNTER2_SPAN 16
#define ASYNC_COUNTER2_TYPE "avalon_slave_async_counter"


/*
 * Async_counter3 configuration
 *
 */

#define ALT_MODULE_CLASS_Async_counter3 avalon_slave_async_counter
#define ASYNC_COUNTER3_BASE 0x100006c0
#define ASYNC_COUNTER3_IRQ -1
#define ASYNC_COUNTER3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ASYNC_COUNTER3_NAME "/dev/Async_counter3"
#define ASYNC_COUNTER3_SPAN 16
#define ASYNC_COUNTER3_TYPE "avalon_slave_async_counter"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x1000820
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "small"
#define ALT_CPU_DATA_ADDR_WIDTH 0x1d
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x20
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 1
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 8192
#define ALT_CPU_INST_ADDR_WIDTH 0x19
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_RESET_ADDR 0x0


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x1000820
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "small"
#define NIOS2_DATA_ADDR_WIDTH 0x1d
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x20
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 1
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 8192
#define NIOS2_INST_ADDR_WIDTH 0x19
#define NIOS2_RESET_ADDR 0x0


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SPI
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_UART
#define __ALTERA_NIOS2_QSYS
#define __ALTERA_UP_AVALON_PARALLEL_PORT
#define __AVALON_SLAVE_ASYNC_COUNTER
#define __AVALON_SLAVE_PWM


/*
 * GPIO0 configuration
 *
 */

#define ALT_MODULE_CLASS_GPIO0 altera_avalon_pio
#define GPIO0_BASE 0x10000500
#define GPIO0_BIT_CLEARING_EDGE_REGISTER 0
#define GPIO0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define GPIO0_CAPTURE 1
#define GPIO0_DATA_WIDTH 10
#define GPIO0_DO_TEST_BENCH_WIRING 1
#define GPIO0_DRIVEN_SIM_VALUE 0x0
#define GPIO0_EDGE_TYPE "ANY"
#define GPIO0_FREQ 50000000u
#define GPIO0_HAS_IN 0
#define GPIO0_HAS_OUT 0
#define GPIO0_HAS_TRI 1
#define GPIO0_IRQ 13
#define GPIO0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define GPIO0_IRQ_TYPE "EDGE"
#define GPIO0_NAME "/dev/GPIO0"
#define GPIO0_RESET_VALUE 0x0
#define GPIO0_SPAN 16
#define GPIO0_TYPE "altera_avalon_pio"


/*
 * GPIO1 configuration
 *
 */

#define ALT_MODULE_CLASS_GPIO1 altera_avalon_pio
#define GPIO1_BASE 0x10000510
#define GPIO1_BIT_CLEARING_EDGE_REGISTER 0
#define GPIO1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define GPIO1_CAPTURE 1
#define GPIO1_DATA_WIDTH 10
#define GPIO1_DO_TEST_BENCH_WIRING 1
#define GPIO1_DRIVEN_SIM_VALUE 0x0
#define GPIO1_EDGE_TYPE "ANY"
#define GPIO1_FREQ 50000000u
#define GPIO1_HAS_IN 0
#define GPIO1_HAS_OUT 0
#define GPIO1_HAS_TRI 1
#define GPIO1_IRQ 14
#define GPIO1_IRQ_INTERRUPT_CONTROLLER_ID 0
#define GPIO1_IRQ_TYPE "EDGE"
#define GPIO1_NAME "/dev/GPIO1"
#define GPIO1_RESET_VALUE 0x0
#define GPIO1_SPAN 16
#define GPIO1_TYPE "altera_avalon_pio"


/*
 * Green_LEDs configuration
 *
 */

#define ALT_MODULE_CLASS_Green_LEDs altera_up_avalon_parallel_port
#define GREEN_LEDS_BASE 0x10000000
#define GREEN_LEDS_IRQ -1
#define GREEN_LEDS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define GREEN_LEDS_NAME "/dev/Green_LEDs"
#define GREEN_LEDS_SPAN 16
#define GREEN_LEDS_TYPE "altera_up_avalon_parallel_port"


/*
 * HEX3_HEX0 configuration
 *
 */

#define ALT_MODULE_CLASS_HEX3_HEX0 altera_up_avalon_parallel_port
#define HEX3_HEX0_BASE 0x10000040
#define HEX3_HEX0_IRQ -1
#define HEX3_HEX0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define HEX3_HEX0_NAME "/dev/HEX3_HEX0"
#define HEX3_HEX0_SPAN 16
#define HEX3_HEX0_TYPE "altera_up_avalon_parallel_port"


/*
 * Pushbuttons configuration
 *
 */

#define ALT_MODULE_CLASS_Pushbuttons altera_up_avalon_parallel_port
#define PUSHBUTTONS_BASE 0x10000020
#define PUSHBUTTONS_IRQ 11
#define PUSHBUTTONS_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PUSHBUTTONS_NAME "/dev/Pushbuttons"
#define PUSHBUTTONS_SPAN 16
#define PUSHBUTTONS_TYPE "altera_up_avalon_parallel_port"


/*
 * Red_LEDs configuration
 *
 */

#define ALT_MODULE_CLASS_Red_LEDs altera_up_avalon_parallel_port
#define RED_LEDS_BASE 0x10000010
#define RED_LEDS_IRQ -1
#define RED_LEDS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RED_LEDS_NAME "/dev/Red_LEDs"
#define RED_LEDS_SPAN 16
#define RED_LEDS_TYPE "altera_up_avalon_parallel_port"


/*
 * SPI_port0 configuration
 *
 */

#define ALT_MODULE_CLASS_SPI_port0 altera_avalon_spi
#define SPI_PORT0_BASE 0x10000200
#define SPI_PORT0_CLOCKMULT 1
#define SPI_PORT0_CLOCKPHASE 0
#define SPI_PORT0_CLOCKPOLARITY 0
#define SPI_PORT0_CLOCKUNITS "Hz"
#define SPI_PORT0_DATABITS 8
#define SPI_PORT0_DATAWIDTH 16
#define SPI_PORT0_DELAYMULT "1.0E-9"
#define SPI_PORT0_DELAYUNITS "ns"
#define SPI_PORT0_EXTRADELAY 0
#define SPI_PORT0_INSERT_SYNC 0
#define SPI_PORT0_IRQ 7
#define SPI_PORT0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define SPI_PORT0_ISMASTER 1
#define SPI_PORT0_LSBFIRST 0
#define SPI_PORT0_NAME "/dev/SPI_port0"
#define SPI_PORT0_NUMSLAVES 6
#define SPI_PORT0_PREFIX "spi_"
#define SPI_PORT0_SPAN 32
#define SPI_PORT0_SYNC_REG_DEPTH 2
#define SPI_PORT0_TARGETCLOCK 128000u
#define SPI_PORT0_TARGETSSDELAY "0.0"
#define SPI_PORT0_TYPE "altera_avalon_spi"


/*
 * SPI_port1 configuration
 *
 */

#define ALT_MODULE_CLASS_SPI_port1 altera_avalon_spi
#define SPI_PORT1_BASE 0x10000220
#define SPI_PORT1_CLOCKMULT 1
#define SPI_PORT1_CLOCKPHASE 0
#define SPI_PORT1_CLOCKPOLARITY 0
#define SPI_PORT1_CLOCKUNITS "Hz"
#define SPI_PORT1_DATABITS 8
#define SPI_PORT1_DATAWIDTH 16
#define SPI_PORT1_DELAYMULT "1.0E-9"
#define SPI_PORT1_DELAYUNITS "ns"
#define SPI_PORT1_EXTRADELAY 0
#define SPI_PORT1_INSERT_SYNC 0
#define SPI_PORT1_IRQ 8
#define SPI_PORT1_IRQ_INTERRUPT_CONTROLLER_ID 0
#define SPI_PORT1_ISMASTER 1
#define SPI_PORT1_LSBFIRST 0
#define SPI_PORT1_NAME "/dev/SPI_port1"
#define SPI_PORT1_NUMSLAVES 6
#define SPI_PORT1_PREFIX "spi_"
#define SPI_PORT1_SPAN 32
#define SPI_PORT1_SYNC_REG_DEPTH 2
#define SPI_PORT1_TARGETCLOCK 128000u
#define SPI_PORT1_TARGETSSDELAY "0.0"
#define SPI_PORT1_TYPE "altera_avalon_spi"


/*
 * Serial_port0 configuration
 *
 */

#define ALT_MODULE_CLASS_Serial_port0 altera_avalon_uart
#define SERIAL_PORT0_BASE 0x10000100
#define SERIAL_PORT0_BAUD 9600
#define SERIAL_PORT0_DATA_BITS 8
#define SERIAL_PORT0_FIXED_BAUD 0
#define SERIAL_PORT0_FREQ 50000000u
#define SERIAL_PORT0_IRQ 5
#define SERIAL_PORT0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define SERIAL_PORT0_NAME "/dev/Serial_port0"
#define SERIAL_PORT0_PARITY 'N'
#define SERIAL_PORT0_SIM_CHAR_STREAM ""
#define SERIAL_PORT0_SIM_TRUE_BAUD 0
#define SERIAL_PORT0_SPAN 32
#define SERIAL_PORT0_STOP_BITS 1
#define SERIAL_PORT0_SYNC_REG_DEPTH 2
#define SERIAL_PORT0_TYPE "altera_avalon_uart"
#define SERIAL_PORT0_USE_CTS_RTS 0
#define SERIAL_PORT0_USE_EOP_REGISTER 0


/*
 * Serial_port1 configuration
 *
 */

#define ALT_MODULE_CLASS_Serial_port1 altera_avalon_uart
#define SERIAL_PORT1_BASE 0x10000120
#define SERIAL_PORT1_BAUD 9600
#define SERIAL_PORT1_DATA_BITS 8
#define SERIAL_PORT1_FIXED_BAUD 0
#define SERIAL_PORT1_FREQ 50000000u
#define SERIAL_PORT1_IRQ 6
#define SERIAL_PORT1_IRQ_INTERRUPT_CONTROLLER_ID 0
#define SERIAL_PORT1_NAME "/dev/Serial_port1"
#define SERIAL_PORT1_PARITY 'N'
#define SERIAL_PORT1_SIM_CHAR_STREAM ""
#define SERIAL_PORT1_SIM_TRUE_BAUD 0
#define SERIAL_PORT1_SPAN 32
#define SERIAL_PORT1_STOP_BITS 1
#define SERIAL_PORT1_SYNC_REG_DEPTH 2
#define SERIAL_PORT1_TYPE "altera_avalon_uart"
#define SERIAL_PORT1_USE_CTS_RTS 0
#define SERIAL_PORT1_USE_EOP_REGISTER 0


/*
 * Slider_switches configuration
 *
 */

#define ALT_MODULE_CLASS_Slider_switches altera_up_avalon_parallel_port
#define SLIDER_SWITCHES_BASE 0x10000030
#define SLIDER_SWITCHES_IRQ 12
#define SLIDER_SWITCHES_IRQ_INTERRUPT_CONTROLLER_ID 0
#define SLIDER_SWITCHES_NAME "/dev/Slider_switches"
#define SLIDER_SWITCHES_SPAN 16
#define SLIDER_SWITCHES_TYPE "altera_up_avalon_parallel_port"


/*
 * Stepper0 configuration
 *
 */

#define ALT_MODULE_CLASS_Stepper0 altera_avalon_pio
#define STEPPER0_BASE 0x10000700
#define STEPPER0_BIT_CLEARING_EDGE_REGISTER 0
#define STEPPER0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define STEPPER0_CAPTURE 0
#define STEPPER0_DATA_WIDTH 4
#define STEPPER0_DO_TEST_BENCH_WIRING 0
#define STEPPER0_DRIVEN_SIM_VALUE 0x0
#define STEPPER0_EDGE_TYPE "NONE"
#define STEPPER0_FREQ 50000000u
#define STEPPER0_HAS_IN 0
#define STEPPER0_HAS_OUT 1
#define STEPPER0_HAS_TRI 0
#define STEPPER0_IRQ -1
#define STEPPER0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define STEPPER0_IRQ_TYPE "NONE"
#define STEPPER0_NAME "/dev/Stepper0"
#define STEPPER0_RESET_VALUE 0x0
#define STEPPER0_SPAN 16
#define STEPPER0_TYPE "altera_avalon_pio"


/*
 * Stepper1 configuration
 *
 */

#define ALT_MODULE_CLASS_Stepper1 altera_avalon_pio
#define STEPPER1_BASE 0x10000710
#define STEPPER1_BIT_CLEARING_EDGE_REGISTER 0
#define STEPPER1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define STEPPER1_CAPTURE 0
#define STEPPER1_DATA_WIDTH 4
#define STEPPER1_DO_TEST_BENCH_WIRING 0
#define STEPPER1_DRIVEN_SIM_VALUE 0x0
#define STEPPER1_EDGE_TYPE "NONE"
#define STEPPER1_FREQ 50000000u
#define STEPPER1_HAS_IN 0
#define STEPPER1_HAS_OUT 1
#define STEPPER1_HAS_TRI 0
#define STEPPER1_IRQ -1
#define STEPPER1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define STEPPER1_IRQ_TYPE "NONE"
#define STEPPER1_NAME "/dev/Stepper1"
#define STEPPER1_RESET_VALUE 0x0
#define STEPPER1_SPAN 16
#define STEPPER1_TYPE "altera_avalon_pio"


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone II"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x10010a0
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x10010a0
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x10010a0
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "nios_adv"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER0
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x10010a0
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * motor_control configuration
 *
 */

#define ALT_MODULE_CLASS_motor_control altera_avalon_pio
#define MOTOR_CONTROL_BASE 0x10000400
#define MOTOR_CONTROL_BIT_CLEARING_EDGE_REGISTER 0
#define MOTOR_CONTROL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define MOTOR_CONTROL_CAPTURE 0
#define MOTOR_CONTROL_DATA_WIDTH 4
#define MOTOR_CONTROL_DO_TEST_BENCH_WIRING 0
#define MOTOR_CONTROL_DRIVEN_SIM_VALUE 0x0
#define MOTOR_CONTROL_EDGE_TYPE "NONE"
#define MOTOR_CONTROL_FREQ 50000000u
#define MOTOR_CONTROL_HAS_IN 0
#define MOTOR_CONTROL_HAS_OUT 1
#define MOTOR_CONTROL_HAS_TRI 0
#define MOTOR_CONTROL_IRQ -1
#define MOTOR_CONTROL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MOTOR_CONTROL_IRQ_TYPE "NONE"
#define MOTOR_CONTROL_NAME "/dev/motor_control"
#define MOTOR_CONTROL_RESET_VALUE 0x0
#define MOTOR_CONTROL_SPAN 16
#define MOTOR_CONTROL_TYPE "altera_avalon_pio"


/*
 * motor_direction configuration
 *
 */

#define ALT_MODULE_CLASS_motor_direction altera_avalon_pio
#define MOTOR_DIRECTION_BASE 0x10000410
#define MOTOR_DIRECTION_BIT_CLEARING_EDGE_REGISTER 0
#define MOTOR_DIRECTION_BIT_MODIFYING_OUTPUT_REGISTER 0
#define MOTOR_DIRECTION_CAPTURE 0
#define MOTOR_DIRECTION_DATA_WIDTH 8
#define MOTOR_DIRECTION_DO_TEST_BENCH_WIRING 0
#define MOTOR_DIRECTION_DRIVEN_SIM_VALUE 0x0
#define MOTOR_DIRECTION_EDGE_TYPE "NONE"
#define MOTOR_DIRECTION_FREQ 50000000u
#define MOTOR_DIRECTION_HAS_IN 0
#define MOTOR_DIRECTION_HAS_OUT 1
#define MOTOR_DIRECTION_HAS_TRI 0
#define MOTOR_DIRECTION_IRQ -1
#define MOTOR_DIRECTION_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MOTOR_DIRECTION_IRQ_TYPE "NONE"
#define MOTOR_DIRECTION_NAME "/dev/motor_direction"
#define MOTOR_DIRECTION_RESET_VALUE 0x0
#define MOTOR_DIRECTION_SPAN 16
#define MOTOR_DIRECTION_TYPE "altera_avalon_pio"


/*
 * pwm0 configuration
 *
 */

#define ALT_MODULE_CLASS_pwm0 avalon_slave_pwm
#define PWM0_BASE 0x10000300
#define PWM0_IRQ -1
#define PWM0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PWM0_NAME "/dev/pwm0"
#define PWM0_SPAN 16
#define PWM0_TYPE "avalon_slave_pwm"


/*
 * pwm1 configuration
 *
 */

#define ALT_MODULE_CLASS_pwm1 avalon_slave_pwm
#define PWM1_BASE 0x10000310
#define PWM1_IRQ -1
#define PWM1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PWM1_NAME "/dev/pwm1"
#define PWM1_SPAN 16
#define PWM1_TYPE "avalon_slave_pwm"


/*
 * pwm2 configuration
 *
 */

#define ALT_MODULE_CLASS_pwm2 avalon_slave_pwm
#define PWM2_BASE 0x10000320
#define PWM2_IRQ -1
#define PWM2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PWM2_NAME "/dev/pwm2"
#define PWM2_SPAN 16
#define PWM2_TYPE "avalon_slave_pwm"


/*
 * pwm3 configuration
 *
 */

#define ALT_MODULE_CLASS_pwm3 avalon_slave_pwm
#define PWM3_BASE 0x10000330
#define PWM3_IRQ -1
#define PWM3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PWM3_NAME "/dev/pwm3"
#define PWM3_SPAN 16
#define PWM3_TYPE "avalon_slave_pwm"


/*
 * sdram configuration
 *
 */

#define ALT_MODULE_CLASS_sdram altera_avalon_new_sdram_controller
#define SDRAM_BASE 0x0
#define SDRAM_CAS_LATENCY 3
#define SDRAM_CONTENTS_INFO ""
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_INIT_REFRESH_COMMANDS 2
#define SDRAM_IRQ -1
#define SDRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_IS_INITIALIZED 1
#define SDRAM_NAME "/dev/sdram"
#define SDRAM_POWERUP_DELAY 100.0
#define SDRAM_REFRESH_PERIOD 15.625
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SDRAM_ADDR_WIDTH 0x16
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_SDRAM_COL_WIDTH 8
#define SDRAM_SDRAM_DATA_WIDTH 16
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_ROW_WIDTH 12
#define SDRAM_SHARED_DATA 0
#define SDRAM_SIM_MODEL_BASE 0
#define SDRAM_SPAN 8388608
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_T_AC 5.5
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_RFC 70.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_WR 14.0


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid_qsys
#define SYSID_BASE 0x1001000
#define SYSID_ID 100
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1377564053
#define SYSID_TYPE "altera_avalon_sysid_qsys"


/*
 * timer0 configuration
 *
 */

#define ALT_MODULE_CLASS_timer0 altera_avalon_timer
#define TIMER0_ALWAYS_RUN 0
#define TIMER0_BASE 0x10000080
#define TIMER0_COUNTER_SIZE 32
#define TIMER0_FIXED_PERIOD 0
#define TIMER0_FREQ 50000000u
#define TIMER0_IRQ 1
#define TIMER0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER0_LOAD_VALUE 49999999ull
#define TIMER0_MULT 1.0E-6
#define TIMER0_NAME "/dev/timer0"
#define TIMER0_PERIOD 1000000
#define TIMER0_PERIOD_UNITS "us"
#define TIMER0_RESET_OUTPUT 0
#define TIMER0_SNAPSHOT 1
#define TIMER0_SPAN 32
#define TIMER0_TICKS_PER_SEC 1u
#define TIMER0_TIMEOUT_PULSE_OUTPUT 0
#define TIMER0_TYPE "altera_avalon_timer"


/*
 * timer1 configuration
 *
 */

#define ALT_MODULE_CLASS_timer1 altera_avalon_timer
#define TIMER1_ALWAYS_RUN 0
#define TIMER1_BASE 0x100000a0
#define TIMER1_COUNTER_SIZE 32
#define TIMER1_FIXED_PERIOD 0
#define TIMER1_FREQ 50000000u
#define TIMER1_IRQ 2
#define TIMER1_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER1_LOAD_VALUE 49999999ull
#define TIMER1_MULT 1.0E-6
#define TIMER1_NAME "/dev/timer1"
#define TIMER1_PERIOD 1000000
#define TIMER1_PERIOD_UNITS "us"
#define TIMER1_RESET_OUTPUT 0
#define TIMER1_SNAPSHOT 1
#define TIMER1_SPAN 32
#define TIMER1_TICKS_PER_SEC 1u
#define TIMER1_TIMEOUT_PULSE_OUTPUT 0
#define TIMER1_TYPE "altera_avalon_timer"


/*
 * timer2 configuration
 *
 */

#define ALT_MODULE_CLASS_timer2 altera_avalon_timer
#define TIMER2_ALWAYS_RUN 0
#define TIMER2_BASE 0x100000c0
#define TIMER2_COUNTER_SIZE 32
#define TIMER2_FIXED_PERIOD 0
#define TIMER2_FREQ 50000000u
#define TIMER2_IRQ 3
#define TIMER2_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER2_LOAD_VALUE 49999999ull
#define TIMER2_MULT 1.0E-6
#define TIMER2_NAME "/dev/timer2"
#define TIMER2_PERIOD 1000000
#define TIMER2_PERIOD_UNITS "us"
#define TIMER2_RESET_OUTPUT 0
#define TIMER2_SNAPSHOT 1
#define TIMER2_SPAN 32
#define TIMER2_TICKS_PER_SEC 1u
#define TIMER2_TIMEOUT_PULSE_OUTPUT 0
#define TIMER2_TYPE "altera_avalon_timer"


/*
 * timer3 configuration
 *
 */

#define ALT_MODULE_CLASS_timer3 altera_avalon_timer
#define TIMER3_ALWAYS_RUN 0
#define TIMER3_BASE 0x100000e0
#define TIMER3_COUNTER_SIZE 32
#define TIMER3_FIXED_PERIOD 0
#define TIMER3_FREQ 50000000u
#define TIMER3_IRQ 4
#define TIMER3_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER3_LOAD_VALUE 49999999ull
#define TIMER3_MULT 1.0E-6
#define TIMER3_NAME "/dev/timer3"
#define TIMER3_PERIOD 1000000
#define TIMER3_PERIOD_UNITS "us"
#define TIMER3_RESET_OUTPUT 0
#define TIMER3_SNAPSHOT 1
#define TIMER3_SPAN 32
#define TIMER3_TICKS_PER_SEC 1u
#define TIMER3_TIMEOUT_PULSE_OUTPUT 0
#define TIMER3_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
