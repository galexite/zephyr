#
# Copyright 2022 NXP
# Copyright (c) 2024, George White
#
# SPDX-License-Identifier: Apache-2.0
#

if(CONFIG_NXP_IMXRT_BOOT_HEADER)
  if(CONFIG_BOOT_FLEXSPI_NOR)
    zephyr_compile_definitions(XIP_BOOT_HEADER_ENABLE=1)
    zephyr_compile_definitions(BOARD_FLASH_SIZE=CONFIG_FLASH_SIZE*1024)
    set(RT1010_BOARD_DIR
      "${ZEPHYR_HAL_NXP_MODULE_DIR}/mcux/mcux-sdk/boards/evkmimxrt1010")
    zephyr_library()
    zephyr_library_sources(metro_m7_flexspi_nor_config.c)
    zephyr_library_include_directories(${RT1010_BOARD_DIR}/xip)
  endif()
endif()
