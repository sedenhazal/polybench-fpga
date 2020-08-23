set moduleName kernel2_2mm
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {kernel2_2mm}
set C_modelType { void 0 }
set C_modelArgList {
	{ ni int 32 unused  }
	{ nj int 32 unused  }
	{ nk int 32 unused  }
	{ nl int 32 unused  }
	{ alpha double 64 regular  }
	{ beta double 64 regular  }
	{ tmp double 64 regular {array 1024 { 2 3 } 1 1 }  }
	{ A double 64 regular {array 1024 { 1 3 } 1 1 }  }
	{ B double 64 regular {array 1024 { 1 3 } 1 1 }  }
	{ C double 64 regular {array 1024 { 1 3 } 1 1 }  }
	{ D double 64 regular {array 1024 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "ni", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "ni","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "nj", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "nj","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "nk", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "nk","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "nl", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "nl","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "alpha", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "alpha","cData": "double","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "beta", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "beta","cData": "double","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "tmp", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "tmp","cData": "double","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 31,"step" : 1},{"low" : 0,"up" : 31,"step" : 1}]}]}]} , 
 	{ "Name" : "A", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "A","cData": "double","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 31,"step" : 1},{"low" : 0,"up" : 31,"step" : 1}]}]}]} , 
 	{ "Name" : "B", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "B","cData": "double","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 31,"step" : 1},{"low" : 0,"up" : 31,"step" : 1}]}]}]} , 
 	{ "Name" : "C", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "C","cData": "double","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 31,"step" : 1},{"low" : 0,"up" : 31,"step" : 1}]}]}]} , 
 	{ "Name" : "D", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "D","cData": "double","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 31,"step" : 1},{"low" : 0,"up" : 31,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 31
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ni sc_in sc_lv 32 signal 0 } 
	{ nj sc_in sc_lv 32 signal 1 } 
	{ nk sc_in sc_lv 32 signal 2 } 
	{ nl sc_in sc_lv 32 signal 3 } 
	{ alpha sc_in sc_lv 64 signal 4 } 
	{ beta sc_in sc_lv 64 signal 5 } 
	{ tmp_address0 sc_out sc_lv 10 signal 6 } 
	{ tmp_ce0 sc_out sc_logic 1 signal 6 } 
	{ tmp_we0 sc_out sc_logic 1 signal 6 } 
	{ tmp_d0 sc_out sc_lv 64 signal 6 } 
	{ tmp_q0 sc_in sc_lv 64 signal 6 } 
	{ A_address0 sc_out sc_lv 10 signal 7 } 
	{ A_ce0 sc_out sc_logic 1 signal 7 } 
	{ A_q0 sc_in sc_lv 64 signal 7 } 
	{ B_address0 sc_out sc_lv 10 signal 8 } 
	{ B_ce0 sc_out sc_logic 1 signal 8 } 
	{ B_q0 sc_in sc_lv 64 signal 8 } 
	{ C_address0 sc_out sc_lv 10 signal 9 } 
	{ C_ce0 sc_out sc_logic 1 signal 9 } 
	{ C_q0 sc_in sc_lv 64 signal 9 } 
	{ D_address0 sc_out sc_lv 10 signal 10 } 
	{ D_ce0 sc_out sc_logic 1 signal 10 } 
	{ D_we0 sc_out sc_logic 1 signal 10 } 
	{ D_d0 sc_out sc_lv 64 signal 10 } 
	{ D_q0 sc_in sc_lv 64 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ni", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ni", "role": "default" }} , 
 	{ "name": "nj", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "nj", "role": "default" }} , 
 	{ "name": "nk", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "nk", "role": "default" }} , 
 	{ "name": "nl", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "nl", "role": "default" }} , 
 	{ "name": "alpha", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "alpha", "role": "default" }} , 
 	{ "name": "beta", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "beta", "role": "default" }} , 
 	{ "name": "tmp_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "tmp", "role": "address0" }} , 
 	{ "name": "tmp_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tmp", "role": "ce0" }} , 
 	{ "name": "tmp_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tmp", "role": "we0" }} , 
 	{ "name": "tmp_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tmp", "role": "d0" }} , 
 	{ "name": "tmp_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tmp", "role": "q0" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A", "role": "q0" }} , 
 	{ "name": "B_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B", "role": "address0" }} , 
 	{ "name": "B_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "ce0" }} , 
 	{ "name": "B_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "B", "role": "q0" }} , 
 	{ "name": "C_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "C", "role": "address0" }} , 
 	{ "name": "C_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "ce0" }} , 
 	{ "name": "C_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "C", "role": "q0" }} , 
 	{ "name": "D_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "D", "role": "address0" }} , 
 	{ "name": "D_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D", "role": "ce0" }} , 
 	{ "name": "D_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D", "role": "we0" }} , 
 	{ "name": "D_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "D", "role": "d0" }} , 
 	{ "name": "D_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "D", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "kernel2_2mm",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "960642", "EstimateLatencyMax" : "960642",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "ni", "Type" : "None", "Direction" : "I"},
			{"Name" : "nj", "Type" : "None", "Direction" : "I"},
			{"Name" : "nk", "Type" : "None", "Direction" : "I"},
			{"Name" : "nl", "Type" : "None", "Direction" : "I"},
			{"Name" : "alpha", "Type" : "None", "Direction" : "I"},
			{"Name" : "beta", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "C", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "D", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel2_2mm_dadd_64ns_64ns_64_5_full_dsp_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel2_2mm_dmul_64ns_64ns_64_5_max_dsp_1_U2", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	kernel2_2mm {
		ni {Type I LastRead -1 FirstWrite -1}
		nj {Type I LastRead -1 FirstWrite -1}
		nk {Type I LastRead -1 FirstWrite -1}
		nl {Type I LastRead -1 FirstWrite -1}
		alpha {Type I LastRead 0 FirstWrite -1}
		beta {Type I LastRead 0 FirstWrite -1}
		tmp {Type IO LastRead 10 FirstWrite 3}
		A {Type I LastRead 3 FirstWrite -1}
		B {Type I LastRead 8 FirstWrite -1}
		C {Type I LastRead 10 FirstWrite -1}
		D {Type IO LastRead 3 FirstWrite 10}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "960642", "Max" : "960642"}
	, {"Name" : "Interval", "Min" : "960643", "Max" : "960643"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	ni { ap_none {  { ni in_data 0 32 } } }
	nj { ap_none {  { nj in_data 0 32 } } }
	nk { ap_none {  { nk in_data 0 32 } } }
	nl { ap_none {  { nl in_data 0 32 } } }
	alpha { ap_none {  { alpha in_data 0 64 } } }
	beta { ap_none {  { beta in_data 0 64 } } }
	tmp { ap_memory {  { tmp_address0 mem_address 1 10 }  { tmp_ce0 mem_ce 1 1 }  { tmp_we0 mem_we 1 1 }  { tmp_d0 mem_din 1 64 }  { tmp_q0 mem_dout 0 64 } } }
	A { ap_memory {  { A_address0 mem_address 1 10 }  { A_ce0 mem_ce 1 1 }  { A_q0 mem_dout 0 64 } } }
	B { ap_memory {  { B_address0 mem_address 1 10 }  { B_ce0 mem_ce 1 1 }  { B_q0 mem_dout 0 64 } } }
	C { ap_memory {  { C_address0 mem_address 1 10 }  { C_ce0 mem_ce 1 1 }  { C_q0 mem_dout 0 64 } } }
	D { ap_memory {  { D_address0 mem_address 1 10 }  { D_ce0 mem_ce 1 1 }  { D_we0 mem_we 1 1 }  { D_d0 mem_din 1 64 }  { D_q0 mem_dout 0 64 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
