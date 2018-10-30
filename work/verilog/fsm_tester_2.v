/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module fsm_tester_2 (
    input clk,
    input rst,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg [15:0] out,
    output reg v,
    output reg n,
    output reg z
  );
  
  
  
  localparam DIV = 5'h1a;
  
  reg [15:0] inputa;
  
  reg [15:0] inputb;
  
  localparam START_test_modules = 5'd0;
  localparam ADD_test_modules = 5'd1;
  localparam ADD2_test_modules = 5'd2;
  localparam ADD3_test_modules = 5'd3;
  localparam ADD4_test_modules = 5'd4;
  localparam SUB_test_modules = 5'd5;
  localparam SUB2_test_modules = 5'd6;
  localparam SUB3_test_modules = 5'd7;
  localparam SUB4_test_modules = 5'd8;
  localparam SUB5_test_modules = 5'd9;
  localparam AND_test_modules = 5'd10;
  localparam NAND_test_modules = 5'd11;
  localparam OR_test_modules = 5'd12;
  localparam NOR_test_modules = 5'd13;
  localparam XOR_test_modules = 5'd14;
  localparam XNOR_test_modules = 5'd15;
  localparam A_test_modules = 5'd16;
  localparam B_test_modules = 5'd17;
  localparam SHL_test_modules = 5'd18;
  localparam SHR_test_modules = 5'd19;
  localparam SRA_test_modules = 5'd20;
  localparam CMPEQ_TRUE_test_modules = 5'd21;
  localparam CMPEQ_FALSE_test_modules = 5'd22;
  localparam CMPLT_TRUE_test_modules = 5'd23;
  localparam CMPLT_FALSE_test_modules = 5'd24;
  localparam CMPLE_TRUE_test_modules = 5'd25;
  localparam CMPLE_FALSE_test_modules = 5'd26;
  localparam MUL_test_modules = 5'd27;
  localparam DIVIDE_test_modules = 5'd28;
  localparam ERROR_test_modules = 5'd29;
  localparam DONE_test_modules = 5'd30;
  
  reg [4:0] M_test_modules_d, M_test_modules_q = START_test_modules;
  reg [26:0] M_module_change_d, M_module_change_q = 1'h0;
  reg [4:0] M_next_state_d, M_next_state_q = 1'h0;
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [20-1:0] M_seg_chars;
  display_3 seg (
    .clk(clk),
    .rst(rst),
    .chars(M_seg_chars),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  
  wire [16-1:0] M_alu16_out;
  wire [1-1:0] M_alu16_z;
  wire [1-1:0] M_alu16_v;
  wire [1-1:0] M_alu16_n;
  reg [7-1:0] M_alu16_alufn;
  reg [16-1:0] M_alu16_a;
  reg [16-1:0] M_alu16_b;
  reg [1-1:0] M_alu16_e;
  alu_4 alu16 (
    .alufn(M_alu16_alufn),
    .a(M_alu16_a),
    .b(M_alu16_b),
    .e(M_alu16_e),
    .out(M_alu16_out),
    .z(M_alu16_z),
    .v(M_alu16_v),
    .n(M_alu16_n)
  );
  
  always @* begin
    M_test_modules_d = M_test_modules_q;
    M_next_state_d = M_next_state_q;
    M_module_change_d = M_module_change_q;
    
    io_led = 24'h000000;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    M_alu16_alufn = 7'h00;
    M_alu16_a = 16'h0000;
    M_alu16_b = 16'h0000;
    M_seg_chars = 20'h00000;
    out = 16'h0000;
    if (io_dip[16+7+0-:1] == 1'h1) begin
      M_alu16_e = 1'h1;
    end else begin
      M_alu16_e = 1'h0;
    end
    M_module_change_d = M_module_change_q + 1'h1;
    v = M_alu16_v;
    n = M_alu16_n;
    z = M_alu16_z;
    
    case (M_test_modules_q)
      START_test_modules: begin
        M_next_state_d = 5'h00;
        M_module_change_d = 1'h1;
        if (io_button[3+0-:1] == 1'h1) begin
          M_test_modules_d = ADD_test_modules;
        end
      end
      ADD_test_modules: begin
        M_next_state_d = 5'h01;
        M_seg_chars = 20'h12100;
        M_alu16_alufn = 7'h00;
        inputa = 16'h0003;
        M_alu16_a = inputa;
        inputb = 16'h0018;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        v = M_alu16_v;
        n = M_alu16_n;
        z = M_alu16_z;
        if (M_alu16_out != inputa + inputb) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = ADD2_test_modules;
        end
      end
      ADD2_test_modules: begin
        M_next_state_d = 5'h02;
        M_seg_chars = 20'h12100;
        M_alu16_alufn = 7'h00;
        inputa = 16'h0001;
        M_alu16_a = inputa;
        inputb = 16'hffff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        v = M_alu16_v;
        n = M_alu16_n;
        z = M_alu16_z;
        if (M_alu16_out != inputa + inputb) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = ADD3_test_modules;
        end
      end
      ADD3_test_modules: begin
        M_next_state_d = 5'h03;
        M_seg_chars = 20'h12100;
        M_alu16_alufn = 7'h00;
        inputa = 16'hffff;
        M_alu16_a = inputa;
        inputb = 16'hffff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        v = M_alu16_v;
        n = M_alu16_n;
        z = M_alu16_z;
        if (M_alu16_out != inputa + inputb) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = ADD4_test_modules;
        end
      end
      ADD4_test_modules: begin
        M_next_state_d = 5'h04;
        M_seg_chars = 20'h12100;
        M_alu16_alufn = 7'h00;
        inputa = 16'h8000;
        M_alu16_a = inputa;
        inputb = 16'h8000;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        v = M_alu16_v;
        n = M_alu16_n;
        z = M_alu16_z;
        if (M_alu16_out != inputa + inputb) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = SUB_test_modules;
        end
      end
      SUB_test_modules: begin
        M_next_state_d = 5'h05;
        M_seg_chars = 20'h62d40;
        M_alu16_alufn = 7'h01;
        inputa = 16'h001b;
        M_alu16_a = inputa;
        inputb = 16'h0003;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        v = M_alu16_v;
        n = M_alu16_n;
        z = M_alu16_z;
        if (M_alu16_out != inputa - inputb) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = SUB2_test_modules;
        end
      end
      SUB2_test_modules: begin
        M_next_state_d = 5'h06;
        M_seg_chars = 20'h62d40;
        M_alu16_alufn = 7'h01;
        inputa = 16'h001b;
        M_alu16_a = inputa;
        inputb = 16'hffff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        v = M_alu16_v;
        n = M_alu16_n;
        z = M_alu16_z;
        if (M_alu16_out != inputa - inputb) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = SUB3_test_modules;
        end
      end
      SUB3_test_modules: begin
        M_next_state_d = 5'h07;
        M_seg_chars = 20'h62d40;
        M_alu16_alufn = 7'h01;
        inputa = 16'h8000;
        M_alu16_a = inputa;
        inputb = 16'hffff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        v = M_alu16_v;
        n = M_alu16_n;
        z = M_alu16_z;
        if (M_alu16_out != inputa - inputb) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = SUB4_test_modules;
        end
      end
      SUB4_test_modules: begin
        M_next_state_d = 5'h08;
        M_seg_chars = 20'h62d40;
        M_alu16_alufn = 7'h01;
        inputa = 16'h8000;
        M_alu16_a = inputa;
        inputb = 16'h4000;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        v = M_alu16_v;
        n = M_alu16_n;
        z = M_alu16_z;
        if (M_alu16_out != inputa - inputb) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = SUB5_test_modules;
        end
      end
      SUB5_test_modules: begin
        M_next_state_d = 5'h09;
        M_seg_chars = 20'h62d40;
        M_alu16_alufn = 7'h01;
        inputa = 16'hffff;
        M_alu16_a = inputa;
        inputb = 16'hffff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        v = M_alu16_v;
        n = M_alu16_n;
        z = M_alu16_z;
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != inputa - inputb) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = AND_test_modules;
        end
      end
      AND_test_modules: begin
        M_next_state_d = 5'h0a;
        M_seg_chars = 20'h11d00;
        M_alu16_alufn = 7'h18;
        inputa = 16'h0f0f;
        M_alu16_a = inputa;
        inputb = 16'h00ff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != (inputa & inputb)) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = OR_test_modules;
        end
      end
      OR_test_modules: begin
        M_next_state_d = 5'h0b;
        M_seg_chars = 20'h29800;
        M_alu16_alufn = 7'h1e;
        inputa = 16'h0f0f;
        M_alu16_a = inputa;
        inputb = 16'h00ff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != (inputa | inputb)) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = XOR_test_modules;
        end
      end
      XOR_test_modules: begin
        M_next_state_d = 5'h0c;
        M_seg_chars = 20'h494c0;
        M_alu16_alufn = 7'h16;
        inputa = 16'h0f0f;
        M_alu16_a = inputa;
        inputb = 16'h00ff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != (inputa ^ inputb)) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = A_test_modules;
        end
      end
      A_test_modules: begin
        M_next_state_d = 5'h0d;
        M_seg_chars = 20'h10000;
        M_alu16_alufn = 7'h1a;
        inputa = 16'h0f0f;
        M_alu16_a = inputa;
        inputb = 16'h00ff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != inputa) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = NAND_test_modules;
        end
      end
      NAND_test_modules: begin
        M_next_state_d = 5'h0e;
        M_seg_chars = 20'h388e8;
        M_alu16_alufn = 7'h17;
        inputa = 16'h0f0f;
        M_alu16_a = inputa;
        inputb = 16'h00ff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != ~(inputa & inputb)) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = NOR_test_modules;
        end
      end
      NOR_test_modules: begin
        M_next_state_d = 5'h0f;
        M_seg_chars = 20'h394c0;
        M_alu16_alufn = 7'h11;
        inputa = 16'h0f0f;
        M_alu16_a = inputa;
        inputb = 16'h00ff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != ~(inputa | inputb)) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = XNOR_test_modules;
        end
      end
      XNOR_test_modules: begin
        M_next_state_d = 5'h10;
        M_seg_chars = 20'h49ca6;
        M_alu16_alufn = 7'h19;
        inputa = 16'h0f0f;
        M_alu16_a = inputa;
        inputb = 16'h00ff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != (inputa ~^ inputb)) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = B_test_modules;
        end
      end
      B_test_modules: begin
        M_next_state_d = 5'h11;
        M_seg_chars = 20'h50000;
        M_alu16_alufn = 7'h15;
        inputa = 16'h0f0f;
        M_alu16_a = inputa;
        inputb = 16'h00ff;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != inputb) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = CMPEQ_TRUE_test_modules;
        end
      end
      CMPEQ_TRUE_test_modules: begin
        M_next_state_d = 5'h12;
        M_seg_chars = 20'h73e00;
        M_alu16_alufn = 7'h33;
        inputa = 16'haaaa;
        M_alu16_a = inputa;
        inputb = 16'haaaa;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && inputa == inputb && M_alu16_out == 16'h0000) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = CMPEQ_FALSE_test_modules;
        end
      end
      CMPEQ_FALSE_test_modules: begin
        M_next_state_d = 5'h13;
        M_seg_chars = 20'h73e00;
        M_alu16_alufn = 7'h33;
        inputa = 16'haaaa;
        M_alu16_a = inputa;
        inputb = 16'haaa0;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && inputa != inputb && M_alu16_out == 16'h0001) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = CMPLT_TRUE_test_modules;
        end
      end
      CMPLT_TRUE_test_modules: begin
        M_next_state_d = 5'h14;
        M_seg_chars = 20'h73c80;
        M_alu16_alufn = 7'h35;
        inputa = 16'h0007;
        M_alu16_a = inputa;
        inputb = 16'h7000;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && inputa < inputb && M_alu16_out == 16'h0000) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = CMPLT_FALSE_test_modules;
        end
      end
      CMPLT_FALSE_test_modules: begin
        M_next_state_d = 5'h15;
        M_seg_chars = 20'h73c80;
        M_alu16_alufn = 7'h35;
        inputa = 16'h7000;
        M_alu16_a = inputa;
        inputb = 16'h0007;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && inputa >= inputb && M_alu16_out == 16'h0001) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = CMPLE_TRUE_test_modules;
        end
      end
      CMPLE_TRUE_test_modules: begin
        M_next_state_d = 5'h16;
        M_seg_chars = 20'h73c90;
        M_alu16_alufn = 7'h37;
        inputa = 16'h0007;
        M_alu16_a = inputa;
        inputb = 16'h7000;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && inputa <= inputb && M_alu16_out == 16'h0000) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = CMPLE_FALSE_test_modules;
        end
      end
      CMPLE_FALSE_test_modules: begin
        M_next_state_d = 5'h17;
        M_seg_chars = 20'h73c90;
        M_alu16_alufn = 7'h37;
        inputa = 16'h7000;
        M_alu16_a = inputa;
        inputb = 16'h0007;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && inputa > inputb && M_alu16_out == 16'h0001) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = SHL_test_modules;
        end
      end
      SHL_test_modules: begin
        M_next_state_d = 5'h18;
        M_seg_chars = 20'h62480;
        M_alu16_alufn = 7'h20;
        inputa = 16'hb773;
        M_alu16_a = inputa;
        inputb = 16'h0002;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != inputa << inputb[0+3-:4]) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = SHR_test_modules;
        end
      end
      SHR_test_modules: begin
        M_next_state_d = 5'h19;
        M_seg_chars = 20'h624c0;
        M_alu16_alufn = 7'h21;
        inputa = 16'hb773;
        M_alu16_a = inputa;
        inputb = 16'h0002;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != inputa >> inputb[0+3-:4]) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = SRA_test_modules;
        end
      end
      SRA_test_modules: begin
        M_next_state_d = 5'h1a;
        M_seg_chars = 20'h61840;
        M_alu16_alufn = 7'h23;
        inputa = 16'hb773;
        M_alu16_a = inputa;
        inputb = 16'h0002;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = MUL_test_modules;
        end
      end
      MUL_test_modules: begin
        M_next_state_d = 5'h1b;
        M_seg_chars = 20'h3c564;
        M_alu16_alufn = 7'h40;
        inputa = 16'h000a;
        M_alu16_a = inputa;
        inputb = 16'h0002;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != inputa * inputb) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = DIVIDE_test_modules;
        end
      end
      DIVIDE_test_modules: begin
        M_next_state_d = 5'h1c;
        M_seg_chars = 20'h40d60;
        M_alu16_alufn = 7'h60;
        inputa = 16'h0064;
        M_alu16_a = inputa;
        inputb = 16'h000a;
        M_alu16_b = inputb;
        out[0+7-:8] = M_alu16_out[0+7-:8];
        out[8+7-:8] = M_alu16_out[8+7-:8];
        if (M_module_change_q[26+0-:1] == 1'h1 && M_alu16_out != inputa / inputb || inputb == 1'h0) begin
          M_test_modules_d = ERROR_test_modules;
        end
        if (M_module_change_q == 1'h0) begin
          M_test_modules_d = DONE_test_modules;
        end
      end
      ERROR_test_modules: begin
        M_seg_chars = 20'h08864;
        M_module_change_d = 1'h1;
        out = 16'h0001;
        if (io_button[4+0-:1] == 1'h1) begin
          
          case (M_next_state_q)
            5'h00: begin
              M_test_modules_d = ADD_test_modules;
            end
            5'h01: begin
              M_test_modules_d = ADD2_test_modules;
            end
            5'h02: begin
              M_test_modules_d = ADD3_test_modules;
            end
            5'h03: begin
              M_test_modules_d = ADD4_test_modules;
            end
            5'h04: begin
              M_test_modules_d = SUB_test_modules;
            end
            5'h05: begin
              M_test_modules_d = SUB2_test_modules;
            end
            5'h06: begin
              M_test_modules_d = SUB3_test_modules;
            end
            5'h07: begin
              M_test_modules_d = SUB4_test_modules;
            end
            5'h08: begin
              M_test_modules_d = SUB5_test_modules;
            end
            5'h09: begin
              M_test_modules_d = AND_test_modules;
            end
            5'h0a: begin
              M_test_modules_d = OR_test_modules;
            end
            5'h0b: begin
              M_test_modules_d = XOR_test_modules;
            end
            5'h0c: begin
              M_test_modules_d = A_test_modules;
            end
            5'h0d: begin
              M_test_modules_d = NAND_test_modules;
            end
            5'h0e: begin
              M_test_modules_d = NOR_test_modules;
            end
            5'h0f: begin
              M_test_modules_d = XNOR_test_modules;
            end
            5'h10: begin
              M_test_modules_d = B_test_modules;
            end
            5'h11: begin
              M_test_modules_d = CMPEQ_TRUE_test_modules;
            end
            5'h12: begin
              M_test_modules_d = CMPEQ_FALSE_test_modules;
            end
            5'h13: begin
              M_test_modules_d = CMPLT_TRUE_test_modules;
            end
            5'h14: begin
              M_test_modules_d = CMPLT_FALSE_test_modules;
            end
            5'h15: begin
              M_test_modules_d = CMPLE_TRUE_test_modules;
            end
            5'h16: begin
              M_test_modules_d = CMPLE_FALSE_test_modules;
            end
            5'h17: begin
              M_test_modules_d = SHL_test_modules;
            end
            5'h18: begin
              M_test_modules_d = SHR_test_modules;
            end
            5'h19: begin
              M_test_modules_d = SRA_test_modules;
            end
            5'h1a: begin
              M_test_modules_d = MUL_test_modules;
            end
            5'h1b: begin
              M_test_modules_d = DIVIDE_test_modules;
            end
            5'h1c: begin
              M_test_modules_d = DONE_test_modules;
            end
          endcase
        end
      end
      DONE_test_modules: begin
        M_seg_chars = 20'h414f0;
        out = 16'h0000;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_module_change_q <= 1'h0;
      M_next_state_q <= 1'h0;
      M_test_modules_q <= 1'h0;
    end else begin
      M_module_change_q <= M_module_change_d;
      M_next_state_q <= M_next_state_d;
      M_test_modules_q <= M_test_modules_d;
    end
  end
  
endmodule
