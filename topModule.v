`timescale 1ns / 1ps

module topModule(
    input clk, reset,
    input [15:0] pc_in,
    input pc_load,
    input [7:0] a,b,
    output [7:0] alu_result,
    output zero
    );
    
    wire [15:0] pc;
    wire [15:0] instruction;
    wire [3:0] alu_sel;
    
    assign addr = pc[3:0];
    assign alu_sel = instruction[3:0]; 
    
    pc pc_inst (
        .clk(clk),
        .reset(reset),
        .pc_in(pc_in),
        .pc_load(pc_load)
        ,.pc(pc)
    );
    
    iMem iMem_inst (
        .addr(addr),
        .instruction(instruction)
    );
    
    alu alu_inst (
        .a(a),
        .b(b),
        .alu_sel(alu_sel),
        .alu_result(alu_result),
        .zero(zero)
     );
endmodule
