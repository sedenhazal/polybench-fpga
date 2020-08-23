#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/hazal/Desktop/PhD/hls/polybench_2mm_v4/2mm_prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
