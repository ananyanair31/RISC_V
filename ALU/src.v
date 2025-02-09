`timescale 1ns / 1ps

module alu(
    input [7:0] a,b,
    input [3:0] alu_sel,
    output reg [31:0] alu_out,
    output reg zero
    );
    
    always @(*)
    begin
        case(alu_sel)
        
        4'b0000: alu_out = a&b;
        4'b0001: alu_out = a|b;
        4'b0010: alu_out = a+b;
        4'b0011: alu_out = a-b;
        4'b0100: alu_out = (a>b)?8'd1:8'd0;
        4'b0101: alu_out = a<<1;
        4'b0110: alu_out = a>>1;
        4'b0111: alu_out = {a[6:0],a[7]};
        4'b1000: alu_out = {a[0],a[7:1]};
        4'b1001: alu_out = a*b;
        4'b1010: alu_out = a/b;
        4'b1011: alu_out = a^b;
        4'b1100: alu_out = ~(a&b);
        4'b1101: alu_out = ~(a|b);
        4'b1110: alu_out = ~(a^b);
        4'b1111: alu_out = (a==b)? 8'd1 : 8'd0;
        
        default: alu_out = a+b;
        
        endcase 
     end
endmodule
