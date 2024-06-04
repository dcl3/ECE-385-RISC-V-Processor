module testbench();

timeunit 100ns;
timeprecision 1ns;

logic [9:0] SW;
logic	Clk;
logic Run, Continue;
logic [9:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
logic [31:0] PC_sim, MDR_sim, MAR_sim, IR_sim, data_mem_R_sim, data_mem_W_sim;
logic LD_MAR_sim;
logic [4:0] State_sim;
logic [6:0] opcode_sim;
logic [31:0] reg1_sim;

riscv_testtop	test(.*);

assign PC_sim = test.riscv.PC;
assign MDR_sim = test.riscv.MDR;
assign MAR_sim = test.riscv.MAR;
assign IR_sim = test.riscv.IR;
assign data_mem_R_sim = test.riscv.data_mem_R;
assign data_mem_W_sim = test.riscv.data_mem_W;
assign LD_MAR_sim = test.riscv.LD_MAR;
assign State_sim = test.riscv.curr_state;
assign opcode_sim = test.riscv.opcode;
assign reg1_sim = test.riscv.reg1;
//assign R0_val = test.slc.d0.register_file.R0_in_regfile.Dout;
//assign R1_val = test.slc.d0.register_file.R1_in_regfile.Dout;
//assign R2_val = test.slc.d0.register_file.R2_in_regfile.Dout;
//assign R3_val = test.slc.d0.register_file.R3_in_regfile.Dout;
//assign WE_val = test.slc.WE;
//assign cpu_bus_sim = test.slc.d0.cpu_bus;

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
	Clk = 0;
end

initial begin: TEST_VECTORS
//Run = 0;
//Continue = 0;
//
//SW = 10'b0000010100;
//#2 Run = 0;
// Continue = 0;
//#2 Run = 1;
//#2 Continue = 1;
//#4 Run = 0;
//#2 Run = 1;
// 
//
//#12 SW = 10'b0001010101;
//
//#8 Continue = 0;
//#2 Continue = 1;
//
//#12 SW = 10'b0000101010;
//
//#8 Continue = 0;
//#2 Continue = 1;

Run = 1;
Continue = 1;

//SW = 10'b0000001100;			// IO TEST

//SW = 10'b0000011110;			// LUI TESTS

//SW = 10'b0000010011;				// SLT/SUB/OR TEST

SW = 10'b0000100010;				// SLT/SUB/OR TEST

//SW = 10'b0000101011;				// branch

#2 Run = 0;
	Continue = 0;

#2 Continue = 1;
	Run = 1;

#2 Run = 0;
#2 Run = 1;

//#20 Continue = 0;
//#2 Continue = 1;

//#40 SW = 10'b0011111111;

#40 Continue = 0;
#2 Continue = 1;

//#40 SW = 10'b0000001111;

#40 Continue = 0;
#2 Continue = 1;

//#40 SW = 10'b1111111111;
//
//#40 Continue = 0;
//#2 Continue = 1;
//
//#40 SW = 10'b0000000000;
//
//#40 Continue = 0;
//#2 Continue = 1;
//#2 Continue = 0;
//#2 Continue = 1;



end
endmodule