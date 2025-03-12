`timescale 1ns / 1ps

module topTb;
    reg clk, reset;
    reg [7:0] a,b;
    wire [7:0] alu_result;
    wire zero;
    reg [3:0] pc_in;
    reg pc_load;
    integer i;
    
    topModule test_unit(
        .clk(clk),
        .reset(reset),
        .pc_in(pc_in),
        .pc_load(pc_load),
        .a(a), 
        .b(b),  // ALU 8-bit Inputs
        .alu_result(alu_result), // ALU 8-bit Output
        .zero(zero) // Zero Flag
     );
     
     always #10 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        pc_load = 0;          // Do not load the PC initially
        a = 8'h0A;            // Set ALU input a
        b = 8'h02;            // Set ALU input b

        // Apply reset pulse
        #5 reset = 1; 
        #5 reset = 0;
        
        // Test ALU and Program Counter
        #10;
        a = 8'hF2;
        b = 8'hD3;

        // Test Program Counter Load (Load PC with a value)
        #20;
        pc_in = 16'h0004;     // Load PC with value 0x0004
        pc_load = 1;          // Load the new value into the PC
        #10;
        pc_load = 0;          // Stop loading the PC, let it increment
        
        // Check if PC loaded the correct value (it should now be 0x0004)
        #20;

        // Test Program Counter increment behavior after loading values
        // The PC should increment automatically if pc_load is deasserted
        #20;
        // The PC should increment from 0x0011 (since it was loaded with 0x0010 previously).
        
        // Test ALU with another input
        #20;
        a = 8'h0B;
        b = 8'h03;

        // Monitor the incrementing of the PC
        // After the load, PC will continue to increment automatically
        #40;
        $finish;  // End simulation
    end
endmodule
