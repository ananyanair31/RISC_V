`timescale 1ns / 1ps

module tb;
    reg clk, reset;
    reg [31:0] branch_tgt;
    reg [31:0] jump_tgt;
//    reg branch_taken;
//    reg jump;
//    reg regWrite;
    reg [31:0] writeData;
    wire [31:0] readData1;
    wire [31:0] readData2;
    wire aluSrc;
    wire [3:0] aluControl;

    // Instantiate the top module
    topModule uut (
        .clk(clk),
        .reset(reset),
        .branch_tgt(branch_tgt),
        .jump_tgt(jump_tgt),
//        .branch_taken(branch_taken),
//        .jump(jump),
//        .regWrite(regWrite),
        .writeData(writeData),
        .readData1(readData1),
        .readData2(readData2),
        .aluSrc(aluSrc),
        .aluControl(aluControl)
    );

    // Clock Generation
    always #5 clk = ~clk; // 100 MHz

    initial begin
        // Initialize
        clk = 0;
        reset = 1;
//        branch_taken = 0;
//        jump = 0;
        branch_tgt = 0;
        jump_tgt = 0;
//        regWrite = 0;
        writeData = 32'h0;

        #10 reset = 0; // Deassert reset

        // Write test value to register 3
        @(posedge clk);
//        regWrite = 1;
        writeData = 32'hABCD11;  // test pattern

//        @(posedge clk);
//        regWrite = 0;

//        // Read from registers rs1/rs2 (assuming rs1=3 in instruction.mem)
        #50;

        // Check if branch is taken
        @(posedge clk);
//        branch_taken = 1;
        branch_tgt = 32'h00000008;

        @(posedge clk);
//        branch_taken = 0;
        branch_tgt = 32'h0;
        
        // Check if the program jumps
        @(posedge clk);
//        jump = 1;
        jump_tgt = 32'h0000000C;

        @(posedge clk);
        jump_tgt = 32'h0;

        #40; // Wait to allow PC to progress

        #20 $finish;
    end
endmodule
