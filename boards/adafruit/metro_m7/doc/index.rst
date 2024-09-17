.. _metro_m7:

Adafruit Metro M7
#################

Overview
********

The Adafruit Metro M7 with microSD and Adafruit Metro M7 with AirLift are
hobbyist development boards featuring the NXP i.MX RT1011 microcontroller.

.. .. image:: metro_m7.jpg
..    :align: center
..    :alt: Adafruit Metro M7

Hardware
********

- MIMXRT1011DAE5A MCU

- Memory

  - 64 Mbit QSPI Flash

- Connectivity

  - USB Type-C connector
  - Arduino interface
  - StemmaQT/Qwiic port
  - microSD slot (Adafruit Metro M7 with microSD only)
  - AirLift wireless co-processor (Adafruit Metro M7 with AirLift only)

- Debug

  - 10-pin SWD connector

For more information about the MIMXRT1010 SoC and the two board variants, see
the following:

- `i.MX RT1010 Website`_
- `i.MX RT1010 Datasheet`_
- `i.MX RT1010 Reference Manual`_
- `Adafruit Metro M7 with microSD Overview`_
- `Adafruit Metro M7 with AirLift Overview`_

External Memory
===============

This platform has the following external memories:

+--------------------+------------+-------------------------------------+
| Device             | Controller | Status                              |
+====================+============+=====================================+
| W25Q64JVSSIQ       | FLEXSPI    | Enabled via flash configurationn    |
|                    |            | block, which sets up FLEXSPI at     |
|                    |            | boot time.                          |
+--------------------+------------+-------------------------------------+

Supported Features
==================


+-----------+------------+-------------------------------------+
| Interface | Controller | Driver/Component                    |
+===========+============+=====================================+
| NVIC      | on-chip    | nested vector interrupt controller  |
+-----------+------------+-------------------------------------+
| SYSTICK   | on-chip    | systick                             |
+-----------+------------+-------------------------------------+
| GPIO      | on-chip    | gpio                                |
+-----------+------------+-------------------------------------+
| SPI       | on-chip    | spi                                 |
+-----------+------------+-------------------------------------+
| I2C       | on-chip    | i2c                                 |
+-----------+------------+-------------------------------------+
| UART      | on-chip    | serial port-polling;                |
|           |            | serial port-interrupt               |
+-----------+------------+-------------------------------------+
| USB       | on-chip    | USB device                          |
+-----------+------------+-------------------------------------+
| ADC       | on-chip    | adc                                 |
+-----------+------------+-------------------------------------+
| GPT       | on-chip    | gpt                                 |
+-----------+------------+-------------------------------------+
| TRNG      | on-chip    | entropy                             |
+-----------+------------+-------------------------------------+
| PIT       | on-chip    | pit                                 |
+-----------+------------+-------------------------------------+

The default configuration can be found in
:zephyr_file:`boards/nxp/metro_m7/metro_m7_defconfig`

Other hardware features are not currently supported by the port.

Connections and I/Os
====================

The MIMXRT1010 SoC has five pairs of pinmux/gpio controllers.

+---------------+-----------------+---------------------------+
| Name          | Function        | Usage                     |
+===============+=================+===========================+
| GPIO_11       | GPIO            | LED                       |
+---------------+-----------------+---------------------------+
| GPIO_SD_05    | GPIO            | SW4                       |
+---------------+-----------------+---------------------------+
| GPIO_10       | LPUART1_TX      | UART Console              |
+---------------+-----------------+---------------------------+
| GPIO_09       | LPUART1_RX      | UART Console              |
+---------------+-----------------+---------------------------+
| GPIO_01       | LPI2C1_SDA      | I2C SDA                   |
+---------------+-----------------+---------------------------+
| GPIO_02       | LPI2C1_CLK      | I2C SCL                   |
+---------------+-----------------+---------------------------+
| GPIO_AD_03    | LPSPI1_SDI      | SPI                       |
+---------------+-----------------+---------------------------+
| GPIO_AD_04    | LPSPI1_SDO      | SPI                       |
+---------------+-----------------+---------------------------+
| GPIO_AD_05    | LPSPI1_PCS0     | SPI                       |
+---------------+-----------------+---------------------------+
| GPIO_AD_06    | LPSPI1_SCK      | SPI                       |
+---------------+-----------------+---------------------------+
| GPIO_AD_01    | ADC             | ADC1 Channel 1            |
+---------------+-----------------+---------------------------+
| GPIO_AD_02    | ADC             | ADC1 Channel 2            |
+---------------+-----------------+---------------------------+

System Clock
============

The MIMXRT1010 SoC is configured to use SysTick as the system clock source,
running at 500MHz.

When power management is enabled, the 32 KHz low frequency
oscillator on the board will be used as a source for the GPT timer to
generate a system clock. This clock enables lower power states, at the
cost of reduced resolution

Serial Port
===========

The MIMXRT1010 SoC has four UARTs. ``LPUART1`` is configured for the console,
and the remaining are not used.

Programming and Debugging
*************************

This board supports 3 debug host tools. Please install your preferred host
tool, then follow the instructions in `Configuring a Debug Probe`_ to
configure the board appropriately.

* :ref:`linkserver-debug-host-tools` (Default, Supported by NXP)
* :ref:`jlink-debug-host-tools` (Supported by NXP)
* :ref:`pyocd-debug-host-tools` (Not supported by NXP)

Once the host tool and board are configured, build and flash applications
as usual (see :ref:`build_an_application` and :ref:`application_run` for more
details).

Flashing
========

Here is an example for the :zephyr:code-sample:`hello_world` application.

.. zephyr-app-commands::
    :zephyr-app: samples/hello_world
    :board: metro_m7
    :goals: flash

Open a serial terminal, reset the board (press the SW9 button), and you should
see the following message in the terminal:

.. code-block:: console

    Hello World! metro_m7


.. _Adafruit Metro M7 with microSD Overview:
   https://learn.adafruit.com/adafruit-metro-m7-microsd/overview

.. _Adafruit Metro M7 with AirLift Overview:
   https://learn.adafruit.com/adafruit-metro-m7-with-airlift/overview

.. _MIMXRT1010-EVK Design Files:
   https://www.nxp.com/webapp/Download?colCode=IMXRT1010-EVK-DESIGN-FILES

.. _i.MX RT1010 Website:
   https://www.nxp.com/imxrt1010

.. _i.MX RT1010 Datasheet:
   https://www.nxp.com/docs/en/data-sheet/IMXRT1010CEC.pdf

.. _i.MX RT1010 Reference Manual:
   https://www.nxp.com/webapp/Download?colCode=IMXRT1010RM
