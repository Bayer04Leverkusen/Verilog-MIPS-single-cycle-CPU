# Verilog-MIPS-single-cycle-CPU

## INTRO

This CPU supports 42 instructions below:<br> 
sll/srl/sra/sllv/srlv/srav/jr/jalr/add/addu/
sub/subu/and/or/xor/nor/slt/sltu/bltz/bgez/
j/jal/beq/bne/blez/bgtz/addi/addiu/slti/sltiu/
andi/ori/xori/lui/lb/lh/lw/lbu/lhu/sb/
sh/sw.<br>

It consists of following parts:<br>
* CPUsc: top file
* CPUsc_tb: testbranch
* DM: data memory
* EXT: extension module
* IM: instruction memory
* NPC: next pc module
* PC: pc
* RF: registers file
* alu: alu
* ctrl: control unit
* ctrl_encode_def: some definitions
* mux: includes some kinds of mux
<br>You can understand them by viewing my code. And they can run correctly on Modelsim.<br>

## ARCHITECTURE
![Image text](https://github.com/Bayer04Leverkusen/Verilog-MIPS-single-cycle-CPU/blob/main/Architecture.png)<br>

## SIMULATION RESULT
![Image text](https://github.com/Bayer04Leverkusen/Verilog-MIPS-single-cycle-CPU/blob/main/Modelsim.png)<br>
![Image text](https://github.com/Bayer04Leverkusen/Verilog-MIPS-single-cycle-CPU/blob/main/Modelsim2.png)<br>

## REFERENCE BOOK
Name: Computer Organization and Design THE HARDWARE/SOFTWARE INTERFACE
Author: David A. Patterson  John L. Hennessy

## IN THE END
I am a student from HongYi Honor College in Wuhan University, China. I designed three different kinds of CPU for my course experiment. This CPU is one of them.
The experience is invaluable because it helps me to understand deeply how CPU works. I hope my code would benefit you. And I also welcome your valuable suggestions.<br>
<br>Wenkai TU
