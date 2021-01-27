module dm(clk,length,Writedata,Addr, MemWrite,MemRead, Readdata);	// data memory
	input          clk;			
	input          MemWrite;	//MemWrite==1: write data
	input          MemRead;		//MemRead==1:read data
	input  [2:0]   length;     	//control read/write bit, half byte or byte
	input  [31:0]   Addr;		//read/write address
	input  [31:0]  Writedata;	//the data to write
	
	output reg[31:0]  Readdata;	//output of the data
			 
	reg [7:0] ram[127:0];
	
	always@(*) begin	
		case(length)	
		   3'b000: begin  
			Readdata[7:0]=(MemRead==1)?ram[Addr]:8'bz;
			Readdata[15:8]=(MemRead==1)?ram[Addr+1]:8'bz;
			Readdata[23:16]=(MemRead==1)?ram[Addr+2]:8'bz;
			Readdata[31:24]=(MemRead==1)?ram[Addr+3]:8'bz;
			end

			3'b001: begin
			 Readdata[7:0]=(MemRead==1)?ram[Addr]:8'bz;
			Readdata[15:8]=(MemRead==1)?ram[Addr+1]:8'bz;
			 Readdata[23:16]=(MemRead==1)?{8{ram[Addr+1][7]}}:8'bz;
			Readdata[31:24]=(MemRead==1)?{8{ram[Addr+1][7]}}:8'bz;
			end
			
			3'b010: begin
			Readdata[7:0]=(MemRead==1)?ram[Addr]:8'bz;
			Readdata[15:8]=(MemRead==1)?{8{ram[Addr][7]}}:8'bz;
			Readdata[23:16]=(MemRead==1)?{8{ram[Addr][7]}}:8'bz;
			Readdata[31:24]=(MemRead==1)?{8{ram[Addr][7]}}:8'bz;
			end

			3'b101: begin
			Readdata[7:0]=(MemRead==1)?ram[Addr]:8'bz;
			Readdata[15:8]=(MemRead==1)?ram[Addr+1]:8'bz;
			Readdata[23:16]=(MemRead==1)?8'b0:8'bz;
			Readdata[31:24]=(MemRead==1)?8'b0:8'bz;
			end

			3'b110: begin
			Readdata[7:0]=(MemRead==1)?ram[Addr]:8'bz;
			Readdata[15:8]=(MemRead==1)?8'b0:8'bz;
			 Readdata[23:16]=(MemRead==1)?8'b0:8'bz;
			Readdata[31:24]=(MemRead==1)?8'b0:8'bz;
			end
		endcase
	end
	
	always @(negedge clk)	// when clk is in negtive edge, dm begins to write data 
		begin
		  if (MemWrite==1) begin
			  if(length==3'b00) begin
			  ram[Addr]<=Writedata[7:0];
			  ram[Addr+1]<=Writedata[15:8];
			  ram[Addr+2]<=Writedata[23:16];
			  ram[Addr+3]<=Writedata[31:24];
			  end

			  else if(length==3'b001) begin
			  ram[Addr]<=Writedata[7:0];
			  ram[Addr+1]<=Writedata[15:8];
			  end

			  else if(length==3'b010) begin
				ram[Addr]<=Writedata[7:0];
			  end
		  end
		end
endmodule
