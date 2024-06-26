
module mem2IO (input logic Clk,
					input logic Reset,
					input logic [31:0] addr,
					input logic OE,
					input logic WE,
					input logic [9:0] SW,
					input logic [31:0] Data_from_CPU, Data_from_SRAM,
					output logic [31:0] Data_to_CPU, Data_to_SRAM,
					output logic [3:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

	logic [31:0] hex_data;
		
		// Load data from switches when address is xFFFF, and from SRAM otherwise.
	always_comb
	 begin 
		Data_to_CPU = 32'd0;
		if (~WE && OE) 
			if (addr[31:0] == 32'hFFFFFFFF) 
				Data_to_CPU = {22'b000000,SW};
			else 
				Data_to_CPU = Data_from_SRAM;
	 end

		 // Pass data from CPU to SRAM
	assign Data_to_SRAM = Data_from_CPU;

		// Write to LEDs when WE is active and address is xFFFF.
	always_ff @ (posedge Clk) begin 
		if (Reset) 
			hex_data <= 32'd0;
		else if ( WE && (addr[31:0] == 32'hFFFFFFFF) ) 
			hex_data <= Data_from_CPU;
		end
			 
assign HEX0 = hex_data[3:0];
assign HEX1 = hex_data[7:4];
assign HEX2 = hex_data[11:8];
assign HEX3 = hex_data[15:12];
assign HEX4 = hex_data[19:16];
assign HEX5 = hex_data[23:20];

endmodule