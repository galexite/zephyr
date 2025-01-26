#
# Copyright (c) 2019, NXP
# Copyright (c) 2024, George White
#
# SPDX-License-Identifier: Apache-2.0
#

board_runner_args(pyocd "--target=mimxrt1010")
board_runner_args(jlink "--device=MIMXRT1011DAE5A")
board_runner_args(linkserver "--device=MIMXRT1011xxxxx:EVK-MIMXRT1010")

if(CONFIG_BUILD_OUTPUT_UF2)
  include(${ZEPHYR_BASE}/boards/common/uf2.board.cmake)
endif()
include(${ZEPHYR_BASE}/boards/common/linkserver.board.cmake)
include(${ZEPHYR_BASE}/boards/common/jlink.board.cmake)
include(${ZEPHYR_BASE}/boards/common/pyocd.board.cmake)
