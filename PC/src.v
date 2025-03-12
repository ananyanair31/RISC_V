`timescale 1ns / 1ps

module pc(
    input clk, reset,
    input [15:0] pc_in,     // new value for jumps/ branches
    input pc_load,          // load signal
    output reg [15:0] pc    // current pc value
    );
    
    always @(posedge clk or posedge reset)
    begin 
        if (reset)
            pc <= 16'b0;
        else if (pc_load)
            pc <= pc_in;
        else 
            pc <= pc + 1;
    end
endmodule
