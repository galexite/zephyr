.. zephyr:board:: sparkfun_thing_plus_ra6m5

Overview
********

The SparkFun Thing Plus - RA6M3 is a Thing Plus form-factor board based on the
Renesas RA6M5 microcontroller group, which utilizes the high-performance Arm®
Cortex®-M33 core, along with a DA14531MOD Bluetooth module.

Hardware
********

- Renesas RA6M5 ARM Cortex-M33 processor at 200 MHz
- 24 MHz crystal oscillator
- 32.768 kHz crystal oscillator for RTC
- 2 MB flash memory and 512 KiB of RAM
- 16 MB external QSPI flash (MX25L12833F)
- microSD connector
- Two user LEDs: one RGB LED, one blue status LED
- One reset button
- Bluetooth 5.1 via DA14531MOD with CodeLess™ Datapump
- Single-cell LiPo battery charger (MC73831) and fuel guage (MAX17048)
- Sparkfun Thing Plus (Adafruit Feather compatible) connector exposing standard
  peripherals (UART, SPI, I2C, ADC, PWM)
- One Qwiic (Adafruit STEMMA QT compatible) connector

Supported Features
==================

.. zephyr:board-supported-hw::

Connections and IOs
===================

This board shares the same GPIO connector layout as other Thing Plus boards,
which is also compatible with the Adafruit Feather connector.

Further detailed information about the connectors and I/O can be found both in
the `Sparkfun Thing Plus - RA6M5 Graphical Datasheet`_ and the
`Sparkfun Thing Plus - RA6M5 Schematic`_.

USB Device Port
===============

The RA6M5 MCU has an high speed USB device port that can be used to communicate
with a host PC. See the :zephyr:code-sample-category:`usb` sample applications for
more, such as the :zephyr:code-sample:`usb-cdc-acm` sample which sets up a virtual
serial port that echos characters back to the host PC.

Programming and Debugging
*************************

.. zephyr:board-supported-runners::

The Sparkfun Thing Plus - RA6M5 ships with a DFU compatible bootloader. The
bootloader can be entered by quickly tapping the reset button twice.

Flashing
========

#. Build the Zephyr kernel and the :zephyr:code-sample:`hello_world` sample application:

   .. zephyr-app-commands::
      :zephyr-app: samples/hello_world
      :board: sparkfun_thing_plus_ra6m5
      :goals: build
      :compact:

#. Connect the Thing Plus to your host computer using USB

#. Connect a 3.3 V USB to serial adapter to the board and to the
   host.  See the `Serial Port`_ section above for the board's pin
   connections.

#. Run your favorite terminal program to listen for output. Under Linux the
   terminal should be :code:`/dev/ttyACM0`. For example:

   .. code-block:: console

      $ minicom -D /dev/ttyACM0 -o

   The -o option tells minicom not to send the modem initialization
   string. Connection should be configured as follows:

   - Speed: 115200
   - Data: 8 bits
   - Parity: None
   - Stop bits: 1

#. Tap the reset button twice quickly to enter bootloader mode

#. Flash the image:

   .. zephyr-app-commands::
      :zephyr-app: samples/hello_world
      :board: sparkfun_thing_plus_ra6m5
      :goals: flash
      :compact:

   You should see "Hello World! sparkfun_thing_plus_ra6m5" in your terminal.

References
**********

.. target-notes::

.. _Sparkfun Arduino Core:
    https://github.com/SFE-Brudnerd/ArduinoCore-renesas

.. _Sparkfun Thing Plus - RA6M5 Hookup Guide:
    https://docs.sparkfun.com/SparkFun_Thing_Plus_RA6M5

.. _Sparkfun Thing Plus - RA6M5 Schematic:
    https://docs.sparkfun.com/SparkFun_Thing_Plus_RA6M5/assets/board_files/schematic.pdf

.. _Sparkfun Thing Plus - RA6M5 Graphical Datasheet:
    https://docs.sparkfun.com/SparkFun_Thing_Plus_RA6M5/assets/board_files/graphical_datasheet.pdf
