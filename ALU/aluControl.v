`timescale 1ns / 1ps

module aluControl(
    input [1:0] aluOp,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [3:0] aluControl
    );
    
    always @(*) begin
        case (aluOp)
            2'b00: aluControl = 4'b0000;    // for load/stor
            2'b01: aluControl = 4'b0001;    // for branches
            3'b10: begin                    // R type
                case ({funct7, funct3})
                    10'b0000000000: aluControl = 4'b0000; // ADD
                    10'b0100000000: aluControl = 4'b0001; // SUB
                    10'b0000000111: aluControl = 4'b0010; // AND
                    10'b0000000110: aluControl = 4'b0011; // OR
                    10'b0000000100: aluControl = 4'b0100; // XOR
                    10'b0000000001: aluControl = 4'b0101; // SLL
                    10'b0000000101: aluControl = 4'b0110; // SRL
                    10'b0100000101: aluControl = 4'b0111; // SRA
                    10'b0000000010: aluControl = 4'b1000; // SLT
                    10'b0000000011: aluControl = 4'b1001; // SLTU
                    default: aluControl = 4'b0000;        // default to ADD
                endcase
            end
            default: aluControl = 4'b0000;  // default add
        endcase
    end
endmodule
