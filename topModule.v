`timescale 1ns / 1ps

module topModule(
    input clk, 
    input reset,
    input [31:0] branch_tgt,
    input [31:0] jump_tgt,
    input branch_taken,
    input jump,  
    output [31:0] pc,  
    output [31:0] instruction
    );
    
    pc pc_inst (
        .clk(clk),
        .reset(reset),
        .branch_tgt(branch_tgt),
        .jump_tgt(jump_tgt),
        .branch_taken(branch_taken),
        .jump(jump),
        .pc(pc)
    );

    // Instantiate Instruction Memory module
    instructionMem im (
        .pc(pc),
        .instruction(instruction)
    );
endmodule
