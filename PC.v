module PC( clk, rst, NPC, PC );	//PC module

	input              clk;	
	input              rst;	//reset	signal
	input       [31:0] NPC;	//NPC signal from "NPC module", decide the next PC 
	output reg  [31:0] PC;	//output of the value of current PC

	always @(posedge clk, posedge rst)
		if (rst) 
			PC <= 32'h0000_0000;
		else
			PC <= NPC;
      
endmodule
