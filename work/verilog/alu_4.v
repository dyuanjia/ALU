/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_4 (
    input [6:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [16-1:0] M_adder16_out;
  wire [1-1:0] M_adder16_z;
  wire [1-1:0] M_adder16_v;
  wire [1-1:0] M_adder16_n;
  reg [16-1:0] M_adder16_a;
  reg [16-1:0] M_adder16_b;
  reg [7-1:0] M_adder16_alufn;
  adder_9 adder16 (
    .a(M_adder16_a),
    .b(M_adder16_b),
    .alufn(M_adder16_alufn),
    .out(M_adder16_out),
    .z(M_adder16_z),
    .v(M_adder16_v),
    .n(M_adder16_n)
  );
  
  wire [16-1:0] M_compare16_out;
  reg [7-1:0] M_compare16_alufn;
  reg [16-1:0] M_compare16_a;
  reg [16-1:0] M_compare16_b;
  compare_10 compare16 (
    .alufn(M_compare16_alufn),
    .a(M_compare16_a),
    .b(M_compare16_b),
    .out(M_compare16_out)
  );
  
  wire [16-1:0] M_boolean16_out;
  reg [16-1:0] M_boolean16_a;
  reg [16-1:0] M_boolean16_b;
  reg [7-1:0] M_boolean16_alufn;
  boolean_11 boolean16 (
    .a(M_boolean16_a),
    .b(M_boolean16_b),
    .alufn(M_boolean16_alufn),
    .out(M_boolean16_out)
  );
  
  wire [16-1:0] M_shifter16_out;
  reg [7-1:0] M_shifter16_alufn;
  reg [16-1:0] M_shifter16_a;
  reg [16-1:0] M_shifter16_b;
  shifter_12 shifter16 (
    .alufn(M_shifter16_alufn),
    .a(M_shifter16_a),
    .b(M_shifter16_b),
    .out(M_shifter16_out)
  );
  
  wire [16-1:0] M_multiply16_out;
  reg [16-1:0] M_multiply16_a;
  reg [16-1:0] M_multiply16_b;
  multiply_13 multiply16 (
    .a(M_multiply16_a),
    .b(M_multiply16_b),
    .out(M_multiply16_out)
  );
  
  wire [16-1:0] M_divide16_out;
  reg [16-1:0] M_divide16_a;
  reg [16-1:0] M_divide16_b;
  divide_14 divide16 (
    .a(M_divide16_a),
    .b(M_divide16_b),
    .out(M_divide16_out)
  );
  
  always @* begin
    M_adder16_alufn = alufn;
    M_adder16_a = a;
    M_adder16_b = b;
    z = M_adder16_z;
    v = M_adder16_v;
    n = M_adder16_n;
    M_compare16_alufn = alufn;
    M_compare16_a = a;
    M_compare16_b = b;
    M_boolean16_alufn = alufn;
    M_boolean16_a = a;
    M_boolean16_b = b;
    M_shifter16_alufn = alufn;
    M_shifter16_a = a;
    M_shifter16_b = b;
    M_multiply16_a = a;
    M_multiply16_b = b;
    M_divide16_a = a;
    M_divide16_b = b;
    out = 16'h0000;
    
    case (alufn[4+2-:3])
      3'h0: begin
        out = M_adder16_out;
      end
      3'h1: begin
        out = M_boolean16_out;
      end
      3'h2: begin
        out = M_shifter16_out;
      end
      3'h3: begin
        out = M_compare16_out;
      end
      3'h4: begin
        out = M_multiply16_out;
      end
      3'h6: begin
        out = M_divide16_out;
      end
    endcase
  end
endmodule
