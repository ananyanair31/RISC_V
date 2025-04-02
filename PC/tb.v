`timescale 1ns / 1ps

module tb;
    reg clk, reset;
    reg [31:0] pc;
    reg [31:0] branch_tgt;
    reg [31:0] jump_tgt;
    reg branch_taken;
    reg jump;
    wire [31:0] next_pc;

    // Instantiate the Program Counter
    pc uut (.clk(clk), .reset(reset), .pc(pc), .branch_tgt(branch_tgt), .jump_tgt(jump_tgt), .branch_taken(branch_taken), .jump(jump), .next_pc(next_pc));

    // Clock Generation
    always #5 clk = ~clk; // 100 MHz
    
    always @(posedge clk) begin
        if (!reset) 
            pc <= next_pc;  // Update PC based on next PC
    end

    // Actual value updation
    initial begin
        // Initialize
        clk = 0;
        reset = 1;
        pc = 32'h00000000;
        #10 reset = 0; // Deassert reset

        // Check if PC updates
        #10 branch_taken = 1;
        branch_tgt = 32'h00000008;
        #10
        branch_taken = 0;
        #10 jump = 1; 
        jump_tgt = 32'h0000000C;
        #10 jump = 0;
        #40                     // to check if pc increments on its own
        
        #20 $finish; // End simulation
    end
endmodule
