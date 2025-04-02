`timescale 1ns / 1ps

module pc(
    input clk, 
    input reset,
    input [31:0] pc,
    input [31:0] branch_tgt,
    input [31:0] jump_tgt,
    input branch_taken,
    input jump,
    output reg [31:0] next_pc
    );
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            next_pc <= 32'h00000000;
        else if (jump)
            next_pc <= jump_tgt;
        else if (branch_taken) 
            next_pc <= branch_tgt;
        else 
            next_pc <= pc + 4;
    end
endmodule
