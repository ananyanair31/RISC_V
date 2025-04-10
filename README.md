# 32 bit RISC_V Processor
This project implements a 32-bit RISC-V-like processor in Verilog. It includes an ALU, instruction memory, program counter, instruction decoder, and control unit. The design is tested using a top-level testbench in Vivado.

## Features

  1. 32-bit Instruction Memory
  2. ALU with 15 Operations
  3. Program Counter (PC)
  4. Instruction Decoder
  5. Control Unit
  6. Top-Level Integration & Simulation

## Project Structure
```
RISC_V/
│── alu.v/                # ALU RTL code
│── iMem.v/          # Instruction Memory
│── control_unit.v/         # Control Unit
│── pc.v/         # Program Counter
│── instDecode.v/         # Instruction Decode
│── regFile.v/         # Register File
│── TopModule.v/         # Top Module
│── topTb.v/         # Testbench

```

## Wavefrom
![image](https://github.com/user-attachments/assets/b55c8661-4d46-42b5-b129-3b80287f6edd)

![image](https://github.com/user-attachments/assets/22ff9c04-cb01-4d47-b491-293225cf4887)


