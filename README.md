# 32 bit RISC_V Processor
This project implements a 32-bit RISC-V-like processor in Verilog. It includes an ALU, instruction memory, program counter, instruction decoder, register file and control unit. The design is tested using a top-level verilog testbench in Vivado.

## Features Implemented So Far

- ✅ 32-bit Program Counter (PC)
- ✅ Instruction Fetch (IF) stage
- ✅ Instruction Decode (ID) stage
- ✅ Register File with:
  - Combinational reads
  - Clocked writes on rising edge
- ✅ Instruction memory initialization from file
- ✅ Support for ALU-type (R-type), I-type instructions
- ❌ Branch/Jump instructions (in progress)

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
## TODO
 - Implement ALU 
 - Support for branch (BEQ, BNE) and jump (JAL, JALR) instructions
 - Control Unit
 - Pipeline control

## Wavefrom
![image](https://github.com/user-attachments/assets/b55c8661-4d46-42b5-b129-3b80287f6edd)

![image](https://github.com/user-attachments/assets/22ff9c04-cb01-4d47-b491-293225cf4887)


