# 16 bit RISC_V Processor
This project implements a 16-bit RISC-V-like processor in Verilog. It includes an ALU, instruction memory, program counter, instruction decoder, and control unit. The design is tested using a top-level testbench in Vivado.

## Features

  1. 16-bit Instruction Memory
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
│── TopModule.v/         # Top Module
│── testbench.v/         # Testbench
```
## Airthmetic Logic Unit

| Opcode | Operation |
| ------ | --------- |
|0000	| ADD
|0001	| SUB
|0010	| AND
|0011 |	OR
|0100 | XOR
|0101	| NOR
|0110	| NAND
|0111	| XNOR
|1000	| Logical Shift Left
|1001	| Logical Shift Right
|1010	| Arithmetic Shift Left
|1011	| Arithmetic Shift Right
|1100	| Rotate Left
|1101	| Rotate Right
|1110	| Compare 
