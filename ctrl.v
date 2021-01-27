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
    if(Instru[5:0]==6'b100000)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x010;
        ALUOp=5'b00001;
        NPCOp=2'b00;	length=3'b000;
        end
    else if(Instru[5:0]==6'b100010)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x010;
        ALUOp=5'b00010;
        NPCOp=2'b00;	length=3'b000;
        end
    else if(Instru[5:0]==6'b100100)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x010;
        ALUOp=5'b00011;
        NPCOp=2'b00;	length=3'b000;
        end    
    else if(Instru[5:0]==6'b100101)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x010;
        ALUOp=5'b00100;
        NPCOp=2'b00;	length=3'b000;
        end
    else if(Instru[5:0]==6'b101010)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x010;
        ALUOp=5'b00101;
        NPCOp=2'b00;	length=3'b000;
        end
    else if(Instru[5:0]==6'b101011)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x010;
        ALUOp=5'b00110;
        NPCOp=2'b00;	length=3'b000;
        end
    else if(Instru[5:0]==6'b100001)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x010;
        ALUOp=5'b00001;
        NPCOp=2'b00;	length=3'b000;
        end
    else if(Instru[5:0]==6'b100011)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x010;
        ALUOp=5'b00010;
        NPCOp=2'b00;	length=3'b000;
        end
    else if(Instru[5:0]==6'b100110)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x010;
        ALUOp=5'b01000;
        NPCOp=2'b00;	length=3'b000;
        end
    else if(Instru[5:0]==6'b100111)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x010;
        ALUOp=5'b01001;
        NPCOp=2'b00;	length=3'b000;
        end
    else if(Instru[5:0]==6'b000000)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x011;
        ALUOp=5'b01010;
        NPCOp=2'b00;	length=3'b000;
        end
    else if(Instru[5:0]==6'b000011)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x011;
        ALUOp=5'b01011;
        NPCOp=2'b00;	length=3'b000;
        end
   else if(Instru[5:0]==6'b000111)
        begin
       {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x010;
        ALUOp=5'b10100;
        NPCOp=2'b00;	length=3'b000;
       end
    else if(Instru[5:0]==6'b000010)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x011;
        ALUOp=5'b01101;
        NPCOp=2'b00;	length=3'b000;
        end
    else if(Instru[5:0]==6'b000100)
        begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b010000x010;
        ALUOp=5'b01110;
        NPCOp=2'b00;	length=3'b000;
        end
    else if(Instru[5:0]==6'b000110)
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
    if(Instru[20:16]==5'b00001)begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0x00000x00;
        ALUOp=5'b10000;	length=3'b000;
        if(Zero) NPCOp=2'b01;
        else  NPCOp=2'b00;
      end
    if(Instru[20:16]==5'b00000)begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0x00000x00;
         ALUOp=5'b10001;	length=3'b000;
         if(Zero) NPCOp=2'b01;
        else  NPCOp=2'b00;
    end
    end
6'b000010:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0x00x0xx00;
        ALUOp=5'bx;
        NPCOp=2'b10;	length=3'b000;
    end

6'b000011:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b100100xx10;
        ALUOp=5'bx;
        NPCOp=2'b10;	length=3'b000;
    end

6'b000100:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0x00x0x000;
        ALUOp=5'b00010;	length=3'b000;
        if(Zero) NPCOp=2'b01;
        else  NPCOp=2'b00;
    end

6'b000101:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0x00x0x000;
        ALUOp=5'b00010;	length=3'b000;
        if(~Zero) NPCOp=2'b01;
        else NPCOp=2'b00;
    end

6'b000110:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0x00000x00;
        ALUOp=5'b10010;	length=3'b000;
        if(Zero) NPCOp=2'b01;
        else NPCOp=2'b00;
    end

6'b000111:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0x00000x00;
        ALUOp=5'b10011;	length=3'b000;
        if(Zero) NPCOp=2'b01;
        else NPCOp=2'b00;
    end

6'b001000:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0000001110;
        ALUOp=5'b00001;
        NPCOp=2'b00;	length=3'b000;
    end

6'b001001:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0000001110;
        ALUOp=5'b00001;
        NPCOp=2'b00;	length=3'b000;
    end

6'b001010:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0000001110;
        ALUOp=5'b00101;
        NPCOp=2'b00;	length=3'b000;
    end

6'b001011:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0000001110;
        ALUOp=5'b00101;
        NPCOp=2'b00;	length=3'b000;
    end

6'b001100:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0000001110;
        ALUOp=5'b00011;
        NPCOp=2'b00;	length=3'b000;
    end

6'b001101:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0000000110;
        ALUOp=5'b00100;
        NPCOp=2'b00;	length=3'b000;
    end

6'b001110:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0000000110;
        ALUOp=5'b01000;
        NPCOp=2'b00;	length=3'b000;
    end

6'b001111:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0000001110;
        ALUOp=5'b01100;
        NPCOp=2'b00;	length=3'b000;
    end

/*6'b100000:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0010101110;
        ALUOp=5'b00001;
        NPCOp=2'b00;
        length=3'b010;
    end

6'b100001:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0010101110;
        ALUOp=5'b00001;
        NPCOp=2'b00;
        length=3'b001;
    end
*/
6'b100011:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0010101110;
        ALUOp=5'b00001;
        NPCOp=2'b00;	length=3'b000;
    end

/*6'b100100:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0010100110;
        ALUOp=5'b00001;
        NPCOp=2'b00;
        length=3'b110;
    end

6'b100101:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0010100110;
        ALUOp=5'b00001;
        NPCOp=2'b00;
        length=3'b101;
    end

6'b101000:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0x00x11100;
        ALUOp=5'b00001;
        NPCOp=2'b00;
        length=3'b010;
    end

6'b101001:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0x00x11100;
        ALUOp=5'b00001;
        NPCOp=2'b00;
        length=3'b001;
    end
*/ 
6'b101011:
    begin
        {RegDst,MemRead,MemtoReg,MemWrite,EXTOp,ALUSrc,RegWrite,ALUSrc2}
         =10'b0x00x11100;
        ALUOp=5'b00001;
        NPCOp=2'b00;	length=3'b000;
    end
endcase    
end
endmodule
