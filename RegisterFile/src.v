`timescale 1ns / 1ps

module regFile(
    input clk,
    input regWrite,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] writeData,
    output [31:0] readData1,
    output [31:0] readData2
    );
    
    reg [31:0] registers [31:0];
    
    // initialize the registers
    integer i;
    initial begin
        for (i=0; i<31;i = i+1) begin
            registers[i] <= 32'd0;
        end
    end
    
    // Read
    assign readData1 = registers[rs1];
    assign readData2 = registers[rs2];
    
    // write
    always @(posedge clk) begin
        if (regWrite && rd!=5'd0) begin
            registers[rd] <= writeData;
        end
    end
endmodule
