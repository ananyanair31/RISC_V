`timescale 1ns / 1ps

module controlUnit(
    input [3:0] opcode,
    output reg cIn, Sh_LR, rotEn, cmpEn,
    output reg [3:0] aluOp
    );
    
    always @(*)
    begin
        // Default Values
        cIn = 0;
        Sh_LR = 0;
        rotEn = 0;
        cmpEn = 0;
        aluOp = opcode;
        
        case (opcode)
            4'b0000: cIn = 1; // ADD
            4'b0001: cIn = 1; //SUB
            4'b1000: Sh_LR = 0; // shift left
            4'b1001: Sh_LR = 1; // shift Right
            4'b1010: Sh_LR = 0; // Arithmetic Shift Left
            4'b1011: Sh_LR = 1; // Arithmetic Shift Right
            4'b1100: rotEn = 1; // Rotate Left
            4'b1101: rotEn = 1; // Rotate Right
            4'b1110: cmpEn = 1; // Compare
            default: ; // Other operations use default values
        endcase
    end
endmodule
