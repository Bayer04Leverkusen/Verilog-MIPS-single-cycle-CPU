// instruction memory
module IM(input  [8:2]  addr,output [31:0] outdata );

    reg  [31:0] ROM[127:0];
    initial begin
    /*
    define your own instruction here!!
    2 ways: 1:just define each instruction by using "ROM[x]=32'hxxxxxxxx"
            2:$readmemh();
    */
    end
    assign outdata = ROM[addr]; 
endmodule 
