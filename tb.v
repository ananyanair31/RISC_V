`timescale 1ns / 1ps

module tb;
    reg clk, reset;
    reg [31:0] branch_tgt;
    reg [31:0] jump_tgt;
    reg branch_taken;
    reg jump;
    wire [31:0] pc;
    wire [31:0] instruction;

    // Instantiate the top module
    
    topModule uut (
        .clk(clk),
        .reset(reset),
        .branch_tgt(branch_tgt),
        .jump_tgt(jump_tgt),
        .branch_taken(branch_taken),
        .jump(jump),
        .pc(pc),
        .instruction(instruction)
    );    
    // Clock Generation
    always #5 clk = ~clk; // 100 MHz

    // Actual value updation
    initial begin
        // Initialize
        clk = 0;
        reset = 1;
        #10 reset = 0; // Deassert reset

        // normal execution
        #10;
        
        // Check if branch is taken
        @ (posedge clk) begin
        branch_taken = 1;
        end
        branch_tgt = 32'h00000008;
        #10 branch_taken = 0;
        
        #20
        // Check if the program jumps
        @(posedge clk) begin
        jump = 1; 
        end
        jump_tgt = 32'h0000000c;
        #10 jump = 0;
        
        #40                     // to check if pc increments on its own
        
        #20 $finish; // End simulation
    end
endmodule
