`timescale 1ns / 1ps

module topModule(
    input [3:0] opCode,
    input [7:0] a,b,
    output [7:0] alu_out,
    output zero
    );
    
    wire cIn, Sh_LR, rotEn, cmpEn;
    wire [3:0] alu_sel;
    
    controlUnit control_unit (
        .opCode(opCode),
        .Cin(Cin),
        .Sh_LR(Sh_LR),
        .rotEn(rotEn),
        .cmpEn(cmpEn),
        .aluOp(aluOp)
    );

    alu alu_inst (
        .a(A),
        .b(B),
        .alu_sel(ALU_OP),
        .alu_out(Result),
        .zero(Zero)
    );
endmodule
