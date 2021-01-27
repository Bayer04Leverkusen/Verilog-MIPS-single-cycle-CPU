
module CPUsc(clk,rst);	//single-cycle CPU
    input clk;
    input rst;

  // wire addr;
   wire [31:0] Instru;

   wire [31:0] NPC;
   wire [31:0] PC;

   wire [31:0] A;
   wire [31:0] B;
   wire [31:0] C;
   wire        Zero;


   wire [1:0]  RegDst;
   wire        Memread;
   wire [1:0]  MemtoReg;
   wire MemWrite;
   wire EXTOp;
   wire ALUSrc;
   wire RegWrite;
   wire ALUSrc2;
   wire [1:0]  NPCOp;
   wire [2:0]  length;
   wire [4:0]  ALUOp;
  
   wire [4:0]  A3; 
   wire [31:0] WD;
   wire [31:0] RD1;
   wire [31:0] RD2;           

   wire [31:0] Imm32;

   wire [31:0] Readdata;

   alu alu( .A(A),
            .B(B), 
            .ALUOp(ALUOp), 
            .C(C), 
            .Zero(Zero)
         );

   ctrl ctrl(.Instru(Instru),
             .Zero(Zero), 
             .RegDst(RegDst),
             .MemRead(MemRead),
             .MemtoReg(MemtoReg),
             .MemWrite(MemWrite),
             .EXTOp(EXTOp),
             .ALUSrc(ALUSrc),
             .RegWrite(RegWrite),
             .ALUSrc2(ALUSrc2),
             .NPCOp(NPCOp),
             .length(length),                   
             .ALUOp(ALUOp)
            );

   PC pc(   .clk(clk), 
            .rst(rst), 
            .NPC(NPC), 
            .PC(PC) );

   dm dm(   .clk(clk),
            .length(length),
            .Writedata(RD2),
            .Addr(C), 
            .MemWrite(MemWrite),
            .MemRead(MemRead), 
            .Readdata(Readdata));

   IM im(   .addr(PC[8:2]),
            .outdata(Instru) );

   RF rf(   .clk(clk), 
            .rst(rst),
            .RegWrite(RegWrite), 
            .A1(Instru[25:21]), 
            .A2(Instru[20:16]), 
            .A3(A3), 
            .WD(WD), 
            .RD1(RD1), 
            .RD2(RD2),
            .reg_sel(reg_sel),
            .reg_data(reg_data));

   EXT ext( .Imm16(Instru[15:0]), 
            .EXTOp(EXTOp), 
            .Imm32(Imm32));
   NPC npc( .PC(PC),
		.NPCOp(NPCOp),
		.IMM(Instru[25:0]),
		.NPC(NPC),
		.RS(RD1)
);

   mux4 #(5) mux_RegDst (
      .d0(Instru[20:16]), .d1(Instru[15:11]), .d2(5'b11111), .d3(5'b0), .s(RegDst), .y(A3)
   );

   mux2 #(32) mux_ALUSrc(
      .d0(RD2), .d1(Imm32), .s(ALUSrc), .y(B)
   );

   mux2 #(32) mux_ALUSrc2(
      .d0(RD1), .d1(Imm32), .s(ALUSrc2), .y(A)
   );

   mux4 #(32) mux_MemtoReg (
      .d0(C), .d1(Readdata), .d2(PC + 4), .d3(32'b0), .s(MemtoReg), .y(WD)
   );
endmodule

