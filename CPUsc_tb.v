module CPUsc_tb();	//test-branch
	reg clk;
	reg rst;
	CPUsc cpusc(.clk(clk),.rst(rst));
	initial begin
		clk=0;
		assign rst=1;
		#40
		clk=1;
		assign rst=0;
		forever #20 clk=!clk;

		#1000 $stop;
	end
endmodule