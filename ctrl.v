// `include "ctrl_encode_def.v"
module ctrl(Instru, Zero, 
            RegDst,MemRead,MemtoReg,
            MemWrite,EXTOp,ALUSrc,
            RegWrite,ALUSrc2,NPCOp,length,ALUOp,clk
            );
	input  [31:0] Instru  ;      
	input        Zero;
	input clk;
	output reg      RegWrite; // control signal for register write
	output reg      MemWrite; // control signal for memory write
	output reg      EXTOp;    // control signal to signed extension
	output reg[1:0] RegDst;
	output reg[4:0] ALUOp;    // ALU opertion
	output reg[1:0] NPCOp;    // next pc operation
	output reg      ALUSrc;   // ALU source for A
	output reg      ALUSrc2;
	output reg      MemRead;  
	output reg[1:0] MemtoReg;   
	output reg[2:0] length;
	
 always@(Instru or Zero)
  begin
	length=3'b000;
  case(Instru[31:26])
  6'b000000:
    begin
	    if(Instru[5:0]==6'b100000)	//add
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b00001;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b100010)	//sub
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b00010;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b100100)	//and
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b00011;
		NPCOp=2'b00;	length=3'b000;
		end    
	    else if(Instru[5:0]==6'b100101)	//or
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b00100;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b101010)	//slt
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b00101;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b101011)	//sltu
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b00110;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b100001)	//addu
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b00001;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b100011)	//subu
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b00010;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b100110)	//xor
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b01000;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b100111)	//nor
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b01001;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b000000)	//sll
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x011;
		ALUOp=5'b01010;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b000011)	//sra
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x011;
		ALUOp=5'b01011;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b000111)	//srav
		begin
	       {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b10100;
		NPCOp=2'b00;	length=3'b000;
	       end
	    else if(Instru[5:0]==6'b000010)	//srl
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x011;
		ALUOp=5'b01101;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b000100)	//sllv
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b01110;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b000110)	//srlv
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010000x010;
		ALUOp=5'b01111;
		NPCOp=2'b00;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b001000)  //jr
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0x00x0xxx0;
		ALUOp=5'b00000;//Actually it is x.
		NPCOp=2'b11;	length=3'b000;
		end
	    else if(Instru[5:0]==6'b001001) //jalr
		begin
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b010100xx10;
		ALUOp=5'b00000;
		NPCOp=2'b11;	length=3'b000;
	      end
	    end

	6'b000001:
	    begin
		    if(Instru[20:16]==5'b00001)begin	//bgez
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0x00000x00;
		ALUOp=5'b10000;	length=3'b000;
		if(Zero) NPCOp=2'b01;
		else  NPCOp=2'b00;
	      end
		    if(Instru[20:16]==5'b00000)begin	//bltz
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0x00000x00;
		 ALUOp=5'b10001;	length=3'b000;
		 if(Zero) NPCOp=2'b01;
		else  NPCOp=2'b00;
	    end
	    end
	6'b000010:	
	    begin	//j
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0x00x0xx00;
		ALUOp=5'bx;
		NPCOp=2'b10;	length=3'b000;
	    end

	6'b000011:
	    begin	//jal
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b100100xx10;
		ALUOp=5'bx;
		NPCOp=2'b10;	length=3'b000;
	    end

	6'b000100:
	    begin	//beq
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0x00x0x000;
		ALUOp=5'b00010;	length=3'b000;
		if(Zero) NPCOp=2'b01;
		else  NPCOp=2'b00;
	    end

	6'b000101:
	    begin	//bne
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0x00x0x000;
		ALUOp=5'b00010;	length=3'b000;
		if(~Zero) NPCOp=2'b01;
		else NPCOp=2'b00;
	    end

	6'b000110:
	    begin	//blez
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0x00000x00;
		ALUOp=5'b10010;	length=3'b000;
		if(Zero) NPCOp=2'b01;
		else NPCOp=2'b00;
	    end

	6'b000111:
	    begin	//bgtz
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0x00000x00;
		ALUOp=5'b10011;	length=3'b000;
		if(Zero) NPCOp=2'b01;
		else NPCOp=2'b00;
	    end

	6'b001000:
	    begin	//addi
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0000001110;
		ALUOp=5'b00001;
		NPCOp=2'b00;	length=3'b000;
	    end

	6'b001001:
	    begin	//addiu
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0000001110;
		ALUOp=5'b00001;
		NPCOp=2'b00;	length=3'b000;
	    end

	6'b001010:
	    begin	//slti
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0000001110;
		ALUOp=5'b00101;
		NPCOp=2'b00;	length=3'b000;
	    end

	6'b001011:
	    begin	//sltiu
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0000001110;
		ALUOp=5'b00101;
		NPCOp=2'b00;	length=3'b000;
	    end

	6'b001100:
	    begin	//andi
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0000001110;
		ALUOp=5'b00011;
		NPCOp=2'b00;	length=3'b000;
	    end

	6'b001101:
	    begin	//ori
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0000000110;
		ALUOp=5'b00100;
		NPCOp=2'b00;	length=3'b000;
	    end

	6'b001110:
	    begin	//xori
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0000000110;
		ALUOp=5'b01000;
		NPCOp=2'b00;	length=3'b000;
	    end

	6'b001111:
	    begin	//lui
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0000001110;
		ALUOp=5'b01100;
		NPCOp=2'b00;	length=3'b000;
	    end

	6'b100000:
	    begin	//lb
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0010101110;
		ALUOp=5'b00001;
		NPCOp=2'b00;
		length=3'b010;
	    end

	6'b100001:
	    begin	//lh
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0010101110;
		ALUOp=5'b00001;
		NPCOp=2'b00;
		length=3'b001;
	    end
	
	6'b100011:
	    begin	//lw
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0010101110;
		ALUOp=5'b00001;
		NPCOp=2'b00;	length=3'b000;
	    end

	6'b100100:
	    begin	//lbu
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0010100110;
		ALUOp=5'b00001;
		NPCOp=2'b00;
		length=3'b110;
	    end

	6'b100101:
	    begin	//lhu
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0010100110;
		ALUOp=5'b00001;
		NPCOp=2'b00;
		length=3'b101;
	    end

	6'b101000:
	    begin	//sb
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0x00x11100;
		ALUOp=5'b00001;
		NPCOp=2'b00;
		length=3'b010;
	    end

	6'b101001:
	    begin	//sh
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0x00x11100;
		ALUOp=5'b00001;
		NPCOp=2'b00;
		length=3'b001;
	    end
	
	6'b101011:
	    begin	//sw
		{RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
		 =10'b0x00x11100;
		ALUOp=5'b00001;
		NPCOp=2'b00;	length=3'b000;
	    end
	endcase    
end
endmodule
