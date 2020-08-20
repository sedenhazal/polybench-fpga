############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project polybench_2mm_v2
set_top kernel2_2mm
add_files polybench_2mm_v2/.settings/2mm.c
add_files -tb polybench_2mm_v2/.settings/2mm_tb.c
open_solution "solution1"
set_part {xc7vx485t-ffg1157-1}
create_clock -period 10 -name default
#source "./polybench_2mm_v2/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
