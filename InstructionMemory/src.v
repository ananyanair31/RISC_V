`timescale 1ns / 1ps

module instructionMem(
    input clk,
    input irWrite,
    input [31:0] pc,
    output reg [31:0] instruction
);

    reg [31:0] memory [0:255];

    // Load instructions only in simulation
    `ifndef SYNTHESIS
    initial begin
        $display(">> Instruction Memory Initialized");
        $readmemh("instructions.mem", memory);
    end
    `endif
    
    initial begin
      $readmemh("instructions.mem", memory);
      $display("Memory contents after load:");
      $display("memory[0] = %h", memory[0]);
      $display("memory[1] = %h", memory[1]);
      $display("memory[2] = %h", memory[2]);
      $display("memory[3] = %h", memory[3]);
    end

    // Instruction fetch on positive clock edge if irWrite is high
    always @(posedge clk) begin
        if (irWrite) begin
            instruction <= memory[pc[9:2]];  // safer bit slicing (pc >> 2)
        end
    end
endmodule
