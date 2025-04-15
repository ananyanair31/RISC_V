`timescale 1ns / 1ps

module pc(
    input clk, 
    input reset,
    input [31:0] branch_tgt,
    input [31:0] jump_tgt,
    input branch_taken,
    input jump,
    input pcWrite,
    output reg [31:0] pc
    );
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 32'h00000000;
        else if (pcWrite) begin
            if (jump)
                pc <= jump_tgt;
            else if (branch_taken) 
                pc <= branch_tgt;
            else 
                pc <= pc + 4;
        end
    end
endmodule
