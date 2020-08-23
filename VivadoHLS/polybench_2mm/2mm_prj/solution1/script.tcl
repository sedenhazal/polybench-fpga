############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project 2mm_prj
set_top kernel2_2mm
add_files 2mm.c
add_files -tb 2mm_tb.c
open_solution "solution1"
set_part {xc7k160tfbg484-2} -tool vivado
create_clock -period 10 -name default
#source "./2mm_prj/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
