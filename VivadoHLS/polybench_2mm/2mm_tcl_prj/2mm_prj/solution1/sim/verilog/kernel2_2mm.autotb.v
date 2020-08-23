// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps


`define AUTOTB_DUT      kernel2_2mm
`define AUTOTB_DUT_INST AESL_inst_kernel2_2mm
`define AUTOTB_TOP      apatb_kernel2_2mm_top
`define AUTOTB_LAT_RESULT_FILE "kernel2_2mm.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "kernel2_2mm.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_kernel2_2mm_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 5.00

`define AESL_DEPTH_ni 1
`define AESL_DEPTH_nj 1
`define AESL_DEPTH_nk 1
`define AESL_DEPTH_nl 1
`define AESL_DEPTH_alpha 1
`define AESL_DEPTH_beta 1
`define AESL_MEM_tmp AESL_automem_tmp
`define AESL_MEM_INST_tmp mem_inst_tmp
`define AESL_MEM_A AESL_automem_A
`define AESL_MEM_INST_A mem_inst_A
`define AESL_MEM_B AESL_automem_B
`define AESL_MEM_INST_B mem_inst_B
`define AESL_MEM_C AESL_automem_C
`define AESL_MEM_INST_C mem_inst_C
`define AESL_MEM_D AESL_automem_D
`define AESL_MEM_INST_D mem_inst_D
`define AUTOTB_TVIN_alpha  "../tv/cdatafile/c.kernel2_2mm.autotvin_alpha.dat"
`define AUTOTB_TVIN_beta  "../tv/cdatafile/c.kernel2_2mm.autotvin_beta.dat"
`define AUTOTB_TVIN_tmp  "../tv/cdatafile/c.kernel2_2mm.autotvin_tmp.dat"
`define AUTOTB_TVIN_A  "../tv/cdatafile/c.kernel2_2mm.autotvin_A.dat"
`define AUTOTB_TVIN_B  "../tv/cdatafile/c.kernel2_2mm.autotvin_B.dat"
`define AUTOTB_TVIN_C  "../tv/cdatafile/c.kernel2_2mm.autotvin_C.dat"
`define AUTOTB_TVIN_D  "../tv/cdatafile/c.kernel2_2mm.autotvin_D.dat"
`define AUTOTB_TVIN_alpha_out_wrapc  "../tv/rtldatafile/rtl.kernel2_2mm.autotvin_alpha.dat"
`define AUTOTB_TVIN_beta_out_wrapc  "../tv/rtldatafile/rtl.kernel2_2mm.autotvin_beta.dat"
`define AUTOTB_TVIN_tmp_out_wrapc  "../tv/rtldatafile/rtl.kernel2_2mm.autotvin_tmp.dat"
`define AUTOTB_TVIN_A_out_wrapc  "../tv/rtldatafile/rtl.kernel2_2mm.autotvin_A.dat"
`define AUTOTB_TVIN_B_out_wrapc  "../tv/rtldatafile/rtl.kernel2_2mm.autotvin_B.dat"
`define AUTOTB_TVIN_C_out_wrapc  "../tv/rtldatafile/rtl.kernel2_2mm.autotvin_C.dat"
`define AUTOTB_TVIN_D_out_wrapc  "../tv/rtldatafile/rtl.kernel2_2mm.autotvin_D.dat"
`define AUTOTB_TVOUT_tmp  "../tv/cdatafile/c.kernel2_2mm.autotvout_tmp.dat"
`define AUTOTB_TVOUT_D  "../tv/cdatafile/c.kernel2_2mm.autotvout_D.dat"
`define AUTOTB_TVOUT_tmp_out_wrapc  "../tv/rtldatafile/rtl.kernel2_2mm.autotvout_tmp.dat"
`define AUTOTB_TVOUT_D_out_wrapc  "../tv/rtldatafile/rtl.kernel2_2mm.autotvout_D.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 1;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = 960642;
parameter LENGTH_alpha = 1;
parameter LENGTH_beta = 1;
parameter LENGTH_tmp = 1024;
parameter LENGTH_A = 1024;
parameter LENGTH_B = 1024;
parameter LENGTH_C = 1024;
parameter LENGTH_D = 1024;

task read_token;
    input integer fp;
    output reg [151 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask

reg AESL_clock;
reg rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire ap_start;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire [31 : 0] ni;
wire [31 : 0] nj;
wire [31 : 0] nk;
wire [31 : 0] nl;
wire [63 : 0] alpha;
wire [63 : 0] beta;
wire [9 : 0] tmp_address0;
wire  tmp_ce0;
wire  tmp_we0;
wire [63 : 0] tmp_d0;
wire [63 : 0] tmp_q0;
wire [9 : 0] A_address0;
wire  A_ce0;
wire [63 : 0] A_q0;
wire [9 : 0] B_address0;
wire  B_ce0;
wire [63 : 0] B_q0;
wire [9 : 0] C_address0;
wire  C_ce0;
wire [63 : 0] C_q0;
wire [9 : 0] D_address0;
wire  D_ce0;
wire  D_we0;
wire [63 : 0] D_d0;
wire [63 : 0] D_q0;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;

wire ap_clk;
wire ap_rst;
wire ap_rst_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .ni(ni),
    .nj(nj),
    .nk(nk),
    .nl(nl),
    .alpha(alpha),
    .beta(beta),
    .tmp_address0(tmp_address0),
    .tmp_ce0(tmp_ce0),
    .tmp_we0(tmp_we0),
    .tmp_d0(tmp_d0),
    .tmp_q0(tmp_q0),
    .A_address0(A_address0),
    .A_ce0(A_ce0),
    .A_q0(A_q0),
    .B_address0(B_address0),
    .B_ce0(B_ce0),
    .B_q0(B_q0),
    .C_address0(C_address0),
    .C_ce0(C_ce0),
    .C_q0(C_q0),
    .D_address0(D_address0),
    .D_ce0(D_ce0),
    .D_we0(D_we0),
    .D_d0(D_d0),
    .D_q0(D_q0));

// Assignment for control signal
assign ap_clk = AESL_clock;
assign ap_rst = AESL_reset;
assign ap_rst_n = ~AESL_reset;
assign AESL_reset = rst;
assign ap_start = AESL_start;
assign AESL_start = start;
assign AESL_done = ap_done;
assign AESL_idle = ap_idle;
assign AESL_ready = ap_ready;
assign AESL_ce = ce;
assign AESL_continue = tb_continue;
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_done !== 1 && AESL_done !== 0) begin
                $display("ERROR: Control signal AESL_done is invalid!");
                $finish;
            end
        end
    end
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_ready !== 1 && AESL_ready !== 0) begin
                $display("ERROR: Control signal AESL_ready is invalid!");
                $finish;
            end
        end
    end
// The signal of port ni
reg [31: 0] AESL_REG_ni = 0;
assign ni = AESL_REG_ni;

// The signal of port nj
reg [31: 0] AESL_REG_nj = 0;
assign nj = AESL_REG_nj;

// The signal of port nk
reg [31: 0] AESL_REG_nk = 0;
assign nk = AESL_REG_nk;

// The signal of port nl
reg [31: 0] AESL_REG_nl = 0;
assign nl = AESL_REG_nl;

// The signal of port alpha
reg [63: 0] AESL_REG_alpha = 0;
assign alpha = AESL_REG_alpha;
initial begin : read_file_process_alpha
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [151  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_alpha,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_alpha);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_alpha);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port beta
reg [63: 0] AESL_REG_beta = 0;
assign beta = AESL_REG_beta;
initial begin : read_file_process_beta
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [151  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_beta,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_beta);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_beta);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


//------------------------arraytmp Instantiation--------------

// The input and output of arraytmp
wire    arraytmp_ce0, arraytmp_ce1;
wire    arraytmp_we0, arraytmp_we1;
wire    [9 : 0]    arraytmp_address0, arraytmp_address1;
wire    [63 : 0]    arraytmp_din0, arraytmp_din1;
wire    [63 : 0]    arraytmp_dout0, arraytmp_dout1;
wire    arraytmp_ready;
wire    arraytmp_done;

`AESL_MEM_tmp `AESL_MEM_INST_tmp(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arraytmp_ce0),
    .we0        (arraytmp_we0),
    .address0   (arraytmp_address0),
    .din0       (arraytmp_din0),
    .dout0      (arraytmp_dout0),
    .ce1        (arraytmp_ce1),
    .we1        (arraytmp_we1),
    .address1   (arraytmp_address1),
    .din1       (arraytmp_din1),
    .dout1      (arraytmp_dout1),
    .ready      (arraytmp_ready),
    .done    (arraytmp_done)
);

// Assignment between dut and arraytmp
assign arraytmp_address0 = tmp_address0;
assign arraytmp_ce0 = tmp_ce0;
assign tmp_q0 = arraytmp_dout0;
assign arraytmp_we0 = tmp_we0;
assign arraytmp_din0 = tmp_d0;
assign arraytmp_we1 = 0;
assign arraytmp_din1 = 0;
assign arraytmp_ready= ready;
assign arraytmp_done = interface_done;


//------------------------arrayA Instantiation--------------

// The input and output of arrayA
wire    arrayA_ce0, arrayA_ce1;
wire    arrayA_we0, arrayA_we1;
wire    [9 : 0]    arrayA_address0, arrayA_address1;
wire    [63 : 0]    arrayA_din0, arrayA_din1;
wire    [63 : 0]    arrayA_dout0, arrayA_dout1;
wire    arrayA_ready;
wire    arrayA_done;

`AESL_MEM_A `AESL_MEM_INST_A(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayA_ce0),
    .we0        (arrayA_we0),
    .address0   (arrayA_address0),
    .din0       (arrayA_din0),
    .dout0      (arrayA_dout0),
    .ce1        (arrayA_ce1),
    .we1        (arrayA_we1),
    .address1   (arrayA_address1),
    .din1       (arrayA_din1),
    .dout1      (arrayA_dout1),
    .ready      (arrayA_ready),
    .done    (arrayA_done)
);

// Assignment between dut and arrayA
assign arrayA_address0 = A_address0;
assign arrayA_ce0 = A_ce0;
assign A_q0 = arrayA_dout0;
assign arrayA_we0 = 0;
assign arrayA_din0 = 0;
assign arrayA_we1 = 0;
assign arrayA_din1 = 0;
assign arrayA_ready=    ready;
assign arrayA_done = 0;


//------------------------arrayB Instantiation--------------

// The input and output of arrayB
wire    arrayB_ce0, arrayB_ce1;
wire    arrayB_we0, arrayB_we1;
wire    [9 : 0]    arrayB_address0, arrayB_address1;
wire    [63 : 0]    arrayB_din0, arrayB_din1;
wire    [63 : 0]    arrayB_dout0, arrayB_dout1;
wire    arrayB_ready;
wire    arrayB_done;

`AESL_MEM_B `AESL_MEM_INST_B(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayB_ce0),
    .we0        (arrayB_we0),
    .address0   (arrayB_address0),
    .din0       (arrayB_din0),
    .dout0      (arrayB_dout0),
    .ce1        (arrayB_ce1),
    .we1        (arrayB_we1),
    .address1   (arrayB_address1),
    .din1       (arrayB_din1),
    .dout1      (arrayB_dout1),
    .ready      (arrayB_ready),
    .done    (arrayB_done)
);

// Assignment between dut and arrayB
assign arrayB_address0 = B_address0;
assign arrayB_ce0 = B_ce0;
assign B_q0 = arrayB_dout0;
assign arrayB_we0 = 0;
assign arrayB_din0 = 0;
assign arrayB_we1 = 0;
assign arrayB_din1 = 0;
assign arrayB_ready=    ready;
assign arrayB_done = 0;


//------------------------arrayC Instantiation--------------

// The input and output of arrayC
wire    arrayC_ce0, arrayC_ce1;
wire    arrayC_we0, arrayC_we1;
wire    [9 : 0]    arrayC_address0, arrayC_address1;
wire    [63 : 0]    arrayC_din0, arrayC_din1;
wire    [63 : 0]    arrayC_dout0, arrayC_dout1;
wire    arrayC_ready;
wire    arrayC_done;

`AESL_MEM_C `AESL_MEM_INST_C(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayC_ce0),
    .we0        (arrayC_we0),
    .address0   (arrayC_address0),
    .din0       (arrayC_din0),
    .dout0      (arrayC_dout0),
    .ce1        (arrayC_ce1),
    .we1        (arrayC_we1),
    .address1   (arrayC_address1),
    .din1       (arrayC_din1),
    .dout1      (arrayC_dout1),
    .ready      (arrayC_ready),
    .done    (arrayC_done)
);

// Assignment between dut and arrayC
assign arrayC_address0 = C_address0;
assign arrayC_ce0 = C_ce0;
assign C_q0 = arrayC_dout0;
assign arrayC_we0 = 0;
assign arrayC_din0 = 0;
assign arrayC_we1 = 0;
assign arrayC_din1 = 0;
assign arrayC_ready=    ready;
assign arrayC_done = 0;


//------------------------arrayD Instantiation--------------

// The input and output of arrayD
wire    arrayD_ce0, arrayD_ce1;
wire    arrayD_we0, arrayD_we1;
wire    [9 : 0]    arrayD_address0, arrayD_address1;
wire    [63 : 0]    arrayD_din0, arrayD_din1;
wire    [63 : 0]    arrayD_dout0, arrayD_dout1;
wire    arrayD_ready;
wire    arrayD_done;

`AESL_MEM_D `AESL_MEM_INST_D(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayD_ce0),
    .we0        (arrayD_we0),
    .address0   (arrayD_address0),
    .din0       (arrayD_din0),
    .dout0      (arrayD_dout0),
    .ce1        (arrayD_ce1),
    .we1        (arrayD_we1),
    .address1   (arrayD_address1),
    .din1       (arrayD_din1),
    .dout1      (arrayD_dout1),
    .ready      (arrayD_ready),
    .done    (arrayD_done)
);

// Assignment between dut and arrayD
assign arrayD_address0 = D_address0;
assign arrayD_ce0 = D_ce0;
assign D_q0 = arrayD_dout0;
assign arrayD_we0 = D_we0;
assign arrayD_din0 = D_d0;
assign arrayD_we1 = 0;
assign arrayD_din1 = 0;
assign arrayD_ready= ready;
assign arrayD_done = interface_done;


initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 0);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

    event next_trigger_ready_cnt;
    
    initial begin : gen_ready_cnt
        ready_cnt = 0;
        wait (AESL_reset === 0);
        forever begin
            @ (posedge AESL_clock);
            if (ready == 1) begin
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end
    
    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);
    
    // done_cnt
    always @ (posedge AESL_clock) begin
        if (AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
                    done_cnt <= done_cnt + 1;
                end
            end
        end
    end
    
    initial begin : finish_simulation
        wait (all_finish == 1);
        // last transaction is saved at negedge right after last done
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        $finish;
    end
    
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_alpha;
reg [31:0] size_alpha;
reg [31:0] size_alpha_backup;
reg end_beta;
reg [31:0] size_beta;
reg [31:0] size_beta_backup;
reg end_tmp;
reg [31:0] size_tmp;
reg [31:0] size_tmp_backup;
reg end_A;
reg [31:0] size_A;
reg [31:0] size_A_backup;
reg end_B;
reg [31:0] size_B;
reg [31:0] size_B_backup;
reg end_C;
reg [31:0] size_C;
reg [31:0] size_C_backup;
reg end_D;
reg [31:0] size_D;
reg [31:0] size_D_backup;

initial begin : initial_process
    integer proc_rand;
    rst = 1;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    rst = 0;
end
initial begin : start_process
    integer proc_rand;
    reg [31:0] start_cnt;
    ce = 1;
    start = 0;
    start_cnt = 0;
    wait (AESL_reset === 0);
    @ (posedge AESL_clock);
    #0 start = 1;
    start_cnt = start_cnt + 1;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt >= AUTOTB_TRANSACTION_NUM) begin
            // keep pushing garbage in
            #0 start = 1;
        end
        if (AESL_ready) begin
            start_cnt = start_cnt + 1;
        end
    end
end

always @(AESL_done)
begin
    tb_continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end

reg dump_tvout_finish_tmp;

initial begin : dump_tvout_runtime_sign_tmp
    integer fp;
    dump_tvout_finish_tmp = 0;
    fp = $fopen(`AUTOTB_TVOUT_tmp_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_tmp_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_tmp_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_tmp_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_tmp = 1;
end


reg dump_tvout_finish_D;

initial begin : dump_tvout_runtime_sign_D
    integer fp;
    dump_tvout_finish_D = 0;
    fp = $fopen(`AUTOTB_TVOUT_D_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_D_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_D_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_D_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_D = 1;
end


////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    clk_cnt <= clk_cnt + 1;
    AESL_ready_p1 <= AESL_ready;
    AESL_start_p1 <= AESL_start;
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
event report_progress;

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 0);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 0);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = finish_timestamp[i] - start_timestamp[i]+1;
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

`endif

endmodule
