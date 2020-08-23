#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/hazal/Desktop/PhD/polybench-fpga/VivadoHLS/polybench_2mm/2mm_prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
