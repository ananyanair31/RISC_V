`timescale 1ns / 1ps

module topModule(
    input clk, 
    input reset,
    input [31:0] branch_tgt,
    input [31:0] jump_tgt,
    input branch_taken,
    input jump,  
    input regWrite,
    input [31:0] writeData,
    output wire [6:0] opcode,
    output wire [4:0] rd,
    output wire [2:0] funct3,
    output wire [4:0] rs1,
    output wire [4:0] rs2,
    output wire [6:0] funct7,
    output wire [31:0] readData1,
    output wire [31:0] readData2    
    );
        
    wire [31:0] pc;
    wire [31:0] instruction;
    
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
    
    instDecode id (
        .instruction(instruction),
        .opcode(opcode),
        .rd(rd),
        .funct3(funct3),
        .rs1(rs1),
        .rs2(rs2),
        .funct7(funct7)
    );
    
    regFile reg_inst (
        .clk(clk),
        .regWrite(regWrite),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .writeData(writeData),
        .readData1(readData1), 
        .readData2(readData2)
    );
endmodule
