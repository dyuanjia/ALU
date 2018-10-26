/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module boolean_5 (
    input [15:0] a,
    input [15:0] b,
    input [6:0] alufn,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    if (alufn[0+3-:4] == 4'h8) begin
      out = a & b;
    end else begin
      if (alufn[0+3-:4] == 4'he) begin
        out = a | b;
      end else begin
        if (alufn[0+3-:4] == 4'h6) begin
          out = a ^ b;
        end else begin
          if (alufn[0+3-:4] == 4'ha) begin
            out = a;
          end else begin
            if (alufn[0+3-:4] == 4'h7) begin
              out = ~(a & b);
            end else begin
              if (alufn[0+3-:4] == 4'h1) begin
                out = ~(a | b);
              end else begin
                if (alufn[0+3-:4] == 4'h9) begin
                  out = a ~^ b;
                end else begin
                  if (alufn[0+3-:4] == 4'h5) begin
                    out = b;
                  end else begin
                    out = 1'h0;
                  end
                end
              end
            end
          end
        end
      end
    end
  end
endmodule
