`timescale 1ns / 1ps

module instructionMem(
    input [31:0] pc,
    output wire [31:0] instruction
    );

    reg [31:0] memory [0:255];

    // Simulation-only code
    `ifndef SYNTHESIS
    initial begin
        $display(">> Instruction Memory Initialized");
        $readmemh("instructions.mem", memory);
    end
    `endif
    
    initial begin
        memory[0] = 32'hDEADBEEF;
        memory[1] = 32'hCAFEBABE;
    end 

    assign instruction = memory[pc >> 2];
endmodule
