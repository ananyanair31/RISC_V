# File saved with Nlview 7.8.0 2024-04-26 e1825d835c VDI=44 GEI=38 GUI=JA:21.0 threadsafe
# 
# non-default properties - (restore without -noprops)
property -colorscheme classic
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 18
property maxzoom 7.5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #0095ff
property objecthighlight4 #8000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlaycolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 4
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 18
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 1
property timelimit 1
#
module new TopModule work:TopModule:NOFILE -nosplit
load symbol alu work:alu:NOFILE HIERBOX pin zero output.right pinBus a input.left [7:0] pinBus alu_out output.right [7:0] pinBus alu_sel input.left [3:0] pinBus b input.left [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol controlUnit work:controlUnit:NOFILE HIERBOX pin Sh_LR output.right pin cIn output.right pin cmpEn output.right pin rotEn output.right pinBus aluOp output.right [3:0] pinBus opCode input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol iMem work:iMem:NOFILE HIERBOX pinBus addr input.left [3:0] pinBus instruction output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load port Zero output -pg 1 -lvl 4 -x 770 -y 80
load portBus A input [7:0] -attr @name A[7:0] -pg 1 -lvl 0 -x 0 -y 20
load portBus B input [7:0] -attr @name B[7:0] -pg 1 -lvl 0 -x 0 -y 120
load portBus Result output [7:0] -attr @name Result[7:0] -pg 1 -lvl 4 -x 770 -y 50
load portBus opcode input [3:0] -attr @name opcode[3:0] -pg 1 -lvl 0 -x 0 -y 80
load inst alu_inst alu work:alu:NOFILE -autohide -attr @cell(#000000) alu -pinBusAttr a @name a[7:0] -pinBusAttr alu_out @name alu_out[7:0] -pinBusAttr alu_sel @name alu_sel[3:0] -pinBusAttr b @name b[7:0] -pg 1 -lvl 3 -x 590 -y 50
load inst control_unit controlUnit work:controlUnit:NOFILE -autohide -attr @cell(#000000) controlUnit -pinAttr Sh_LR @attr n/c -pinAttr cIn @attr n/c -pinAttr cmpEn @attr n/c -pinAttr rotEn @attr n/c -pinBusAttr aluOp @name aluOp[3:0] -pinBusAttr opCode @name opCode[3:0] -pg 1 -lvl 2 -x 340 -y 70
load inst iMem_inst iMem work:iMem:NOFILE -autohide -attr @cell(#000000) iMem -pinBusAttr addr @name addr[3:0] -pinBusAttr instruction @name instruction[15:0] -pg 1 -lvl 1 -x 80 -y 70
load net ALU_OP[0] -attr @rip aluOp[0] -pin alu_inst alu_sel[0] -pin control_unit aluOp[0]
load net ALU_OP[1] -attr @rip aluOp[1] -pin alu_inst alu_sel[1] -pin control_unit aluOp[1]
load net ALU_OP[2] -attr @rip aluOp[2] -pin alu_inst alu_sel[2] -pin control_unit aluOp[2]
load net ALU_OP[3] -attr @rip aluOp[3] -pin alu_inst alu_sel[3] -pin control_unit aluOp[3]
load net A[0] -attr @rip A[0] -port A[0] -pin alu_inst a[0]
load net A[1] -attr @rip A[1] -port A[1] -pin alu_inst a[1]
load net A[2] -attr @rip A[2] -port A[2] -pin alu_inst a[2]
load net A[3] -attr @rip A[3] -port A[3] -pin alu_inst a[3]
load net A[4] -attr @rip A[4] -port A[4] -pin alu_inst a[4]
load net A[5] -attr @rip A[5] -port A[5] -pin alu_inst a[5]
load net A[6] -attr @rip A[6] -port A[6] -pin alu_inst a[6]
load net A[7] -attr @rip A[7] -port A[7] -pin alu_inst a[7]
load net B[0] -attr @rip B[0] -port B[0] -pin alu_inst b[0]
load net B[1] -attr @rip B[1] -port B[1] -pin alu_inst b[1]
load net B[2] -attr @rip B[2] -port B[2] -pin alu_inst b[2]
load net B[3] -attr @rip B[3] -port B[3] -pin alu_inst b[3]
load net B[4] -attr @rip B[4] -port B[4] -pin alu_inst b[4]
load net B[5] -attr @rip B[5] -port B[5] -pin alu_inst b[5]
load net B[6] -attr @rip B[6] -port B[6] -pin alu_inst b[6]
load net B[7] -attr @rip B[7] -port B[7] -pin alu_inst b[7]
load net Result[0] -attr @rip alu_out[0] -port Result[0] -pin alu_inst alu_out[0]
load net Result[1] -attr @rip alu_out[1] -port Result[1] -pin alu_inst alu_out[1]
load net Result[2] -attr @rip alu_out[2] -port Result[2] -pin alu_inst alu_out[2]
load net Result[3] -attr @rip alu_out[3] -port Result[3] -pin alu_inst alu_out[3]
load net Result[4] -attr @rip alu_out[4] -port Result[4] -pin alu_inst alu_out[4]
load net Result[5] -attr @rip alu_out[5] -port Result[5] -pin alu_inst alu_out[5]
load net Result[6] -attr @rip alu_out[6] -port Result[6] -pin alu_inst alu_out[6]
load net Result[7] -attr @rip alu_out[7] -port Result[7] -pin alu_inst alu_out[7]
load net Zero -port Zero -pin alu_inst zero
netloc Zero 1 3 1 NJ 80
load net instruction[12] -attr @rip instruction[12] -pin control_unit opCode[0] -pin iMem_inst instruction[12]
load net instruction[13] -attr @rip instruction[13] -pin control_unit opCode[1] -pin iMem_inst instruction[13]
load net instruction[14] -attr @rip instruction[14] -pin control_unit opCode[2] -pin iMem_inst instruction[14]
load net instruction[15] -attr @rip instruction[15] -pin control_unit opCode[3] -pin iMem_inst instruction[15]
load net opcode[0] -attr @rip opcode[0] -pin iMem_inst addr[0] -port opcode[0]
load net opcode[1] -attr @rip opcode[1] -pin iMem_inst addr[1] -port opcode[1]
load net opcode[2] -attr @rip opcode[2] -pin iMem_inst addr[2] -port opcode[2]
load net opcode[3] -attr @rip opcode[3] -pin iMem_inst addr[3] -port opcode[3]
load netBundle @A 8 A[7] A[6] A[5] A[4] A[3] A[2] A[1] A[0] -autobundled
netbloc @A 1 0 3 NJ 20 NJ 20 490J
load netBundle @B 8 B[7] B[6] B[5] B[4] B[3] B[2] B[1] B[0] -autobundled
netbloc @B 1 0 3 NJ 120 NJ 120 490J
load netBundle @opcode 4 opcode[3] opcode[2] opcode[1] opcode[0] -autobundled
netbloc @opcode 1 0 1 NJ 80
load netBundle @Result 8 Result[7] Result[6] Result[5] Result[4] Result[3] Result[2] Result[1] Result[0] -autobundled
netbloc @Result 1 3 1 750J 50n
load netBundle @ALU_OP 4 ALU_OP[3] ALU_OP[2] ALU_OP[1] ALU_OP[0] -autobundled
netbloc @ALU_OP 1 2 1 NJ 80
load netBundle @instruction 4 instruction[15] instruction[14] instruction[13] instruction[12] -autobundled
netbloc @instruction 1 1 1 NJ 80
levelinfo -pg 1 0 80 340 590 770
pagesize -pg 1 -db -bbox -sgen -130 0 890 140
show
fullfit
#
# initialize ictrl to current module TopModule work:TopModule:NOFILE
ictrl init topinfo |
