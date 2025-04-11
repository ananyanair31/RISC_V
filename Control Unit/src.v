`timescale 1ns / 1ps

// Generates aluOp and other control signals using the opcode part of the instruction signal
module controlUnit(
    input [6:0] opcode,     // from inst decode
    output reg [1:0] aluOp, // goes to alu control unit
    output reg regWrite,    // goes to reg file
    output reg aluSrc,
    output reg memRead,     // goes to data mem
    output reg memWrite,
    output reg memToReg,    // write from data mem to reg file
    output reg branch,      // goes to pc
    output reg jump    
    );
    
    always @(*) begin
        case (opcode)
            7'b0110011: begin   // R type
                aluOp = 2'b10;
                regWrite = 1;
                aluSrc = 0;
                memWrite = 0;
                memRead = 0;
                memToReg = 0;
                branch = 0;
                jump = 0;
            end           
             7'b0010011: begin   // I type (addi)
                aluOp = 2'b00;
                regWrite = 1;
                aluSrc = 1;
                memWrite = 0;
                memRead = 0;
                memToReg = 0;
                branch = 0;
                jump = 0;
            end
            7'b0000011: begin   // Load (lw)
                aluOp = 2'b00;
                regWrite = 1;
                aluSrc = 1;
                memWrite = 0;
                memRead = 1;
                memToReg = 1;
                branch = 0;
                jump = 0;
            end
            7'b0100011: begin   // Store (sw)
                aluOp = 2'b00;
                regWrite = 0;
                aluSrc = 1;
                memWrite = 1;
                memRead = 0;
                memToReg = 0;
                branch = 0;
                jump = 0;
            end
            7'b1100011: begin   // Branch (beq)
                aluOp = 2'b01;
                regWrite = 0;
                aluSrc = 0;
                memWrite = 0;
                memRead = 0;
                memToReg = 0;
                branch = 1;
                jump = 0;
            end
            7'b1101111: begin   // JAL
                aluOp = 2'b00;  // dont care
                regWrite = 1;
                aluSrc = 0;
                memWrite = 0;
                memRead = 0;
                memToReg = 0;   // dont care
                branch = 0;
                jump = 1;
            end
            7'b1100111: begin   // JALR
                aluOp = 2'b00;
                regWrite = 1;
                aluSrc = 1;
                memWrite = 0;
                memRead = 0;
                memToReg = 0;
                branch = 0;
                jump = 1;
            end
            default: begin   
                aluOp = 2'b00;
                regWrite = 0;
                aluSrc = 0;
                memWrite = 0;
                memRead = 0;
                memToReg = 0;
                branch = 0;
                jump = 0;
            end
        endcase
    end
endmodule
