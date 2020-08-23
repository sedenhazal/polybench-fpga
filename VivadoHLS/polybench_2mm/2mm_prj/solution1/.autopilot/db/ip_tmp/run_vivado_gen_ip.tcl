create_project prj -part xc7k160t-fbg484-2 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "/home/hazal/Desktop/PhD/polybench-fpga/VivadoHLS/polybench_2mm/2mm_prj/solution1/syn/verilog/kernel2_2mm_ap_dmul_3_max_dsp_64_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips kernel2_2mm_ap_dmul_3_max_dsp_64]]
}
source "/home/hazal/Desktop/PhD/polybench-fpga/VivadoHLS/polybench_2mm/2mm_prj/solution1/syn/verilog/kernel2_2mm_ap_dadd_3_full_dsp_64_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips kernel2_2mm_ap_dadd_3_full_dsp_64]]
}
