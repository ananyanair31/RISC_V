`timescale 1ns / 1ps

module topModule(
    input clk, 
    input reset,
    input [31:0] branch_tgt,
    input [31:0] jump_tgt,
    input [31:0] writeData,
    output wire [31:0] readData1,
    output wire [31:0] readData2,  
    output wire aluSrc,  
    output wire [3:0] aluControl
    );
       
    // pc and instr
    wire [31:0] pc;
    wire [31:0] instruction;
    wire branch_taken;
    wire jump;
    wire regWrite;
    
    // instr decode
    wire [6:0] opcode;
    wire [4:0] rd;
    wire [2:0] funct3;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [6:0] funct7;
    
    // control unit
    wire [1:0] aluOp;
    wire memRead, memWrite, memToReg;
//    wire [3:0] aluControl;
    
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
    
    controlUnit cu_inst (
        .opcode(opcode),     
        .aluOp(aluOp), 
        .regWrite(regWrite),    
        .aluSrc(aluSrc),
        .memRead(memRead),     
        .memWrite(memWrite),
        .memToReg(memToReg),    
        .branch(branch_taken),      
        .jump(jump)    
    );
    
    aluControl ac_inst (
        .aluOp(aluOp),
        .funct3(funct3),
        .funct7(funct7),
        .aluControl(aluControl)
    );
endmodule
