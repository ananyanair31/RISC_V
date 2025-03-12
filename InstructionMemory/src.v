`timescale 1ns / 1ps

module iMem(
    input [3:0] addr,  // PC addr
    output reg [15:0] instruction
    );
    
    reg [15:0] mem [0:15];  

    initial begin
    
    // initialize memory with instructions for the alu
    mem[0] = 16'b0000000000000000;
    mem[1] = 16'b0000000000000001;
    mem[2] = 16'b0000000000000010;
    mem[3] = 16'b0000000000000011;
    mem[4] = 16'b0000000000000100;
    mem[5] = 16'b0000000000000101;
    mem[6] = 16'b0000000000000110;
    mem[7] = 16'b0000000000000111;
    mem[8] = 16'b0000000000001000;
    mem[9] = 16'b0000000000001001;
    mem[10] = 16'b0000000000001010;
    mem[11] = 16'b0000000000001011;
    mem[12] = 16'b0000000000001100;
    mem[13] = 16'b0000000000001101;
    mem[14] = 16'b0000000000001110;
    mem[15] = 16'b0000000000001111;
    end
    
    always @(addr)
    begin
        instruction = mem[addr];
    end
endmodule
