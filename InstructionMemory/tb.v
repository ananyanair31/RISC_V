`timescale 1ns / 1ps

module test_iMem;
    reg [3:0] addr;
    wire [15:0] instruction;
    
    iMem test_unit(
        addr,
        instruction,
        mem
    );
    
    initial begin
        addr = 16'd0; #10;
        $display("PC=%h → Instruction=%b", addr, instruction);

        addr = 16'd4; #10;
        $display("PC=%h → Instruction=%b", addr, instruction);

        addr = 16'd8; #10;
        $display("PC=%h → Instruction=%b", addr, instruction);

        addr = 16'd10; #10;
        $display("PC=%h → Instruction=%b", addr, instruction);

        $finish;
    end
endmodule
