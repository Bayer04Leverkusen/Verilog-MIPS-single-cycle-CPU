`include "ctrl_encode_def.v"

module alu(A, B, ALUOp, C, Zero);	//alu module
           
	input  signed [31:0] A, B;
	input         [4:0]  ALUOp;
	output signed [31:0] C;
	output Zero;
   
	reg [31:0] C;
	integer    i;
       
	always @( * ) begin
    case ( ALUOp )
			`ALU_NOP:  C = A;                          
            `ALU_ADD:  C = A + B;                      
            `ALU_SUB:  C = A - B;                      
            `ALU_AND:  C = A & B;                      
            `ALU_OR:   C = A | B;                      
            `ALU_SLT:  C = (A < B) ? 32'd1 : 32'd0;    
            `ALU_SLTU: C = ({1'b0, A} < {1'b0, B}) ? 32'd1 : 32'd0;
			`ALU_XOR: C=A ^ B;
			`ALU_NOR: C=~(A|B);
            `ALU_SLL: C=B<<A[10:6];
            `ALU_SRA: C=B>>>A[10:6];
            `ALU_LUI: C={B[15:0],16'b0};
            `ALU_SRL: C=B>>A[10:6];
            `ALU_SLLV: C=B<<A[4:0];
            `ALU_SRLV: C=B>>A[4:0];
            `ALU_BGEZ: C=(A>=0)?0:1;
            `ALU_BLTZ: C=(A<0)?0:1;
            `ALU_BLEZ: C=(A<=0)?0:1;
            `ALU_BGTZ: C=(A>0)?0:1;
            `ALU_SRAV: C=B>>>A[4:0];
        default:   C = A;                          // Undefined
    endcase
	end // end always
	
	assign Zero = (C == 32'b0);

endmodule
