module ula1bit(Ainvert, Bnegate, carry_in, a, b, less, carry_out, operation, result);
	
	input less;
	input carry_in;
	input Ainvert, Bnegate;
	input a, b;
	input [1:0] operation;
	output carry_out, result;
	
	not IA (not_a, a);
	not IB (not_b, b);
	
	mux muxA (outputA, a, not_a, Ainvert);
	mux muxB (outputB, b, not_b, Binvert);
	
	and a1 (and_result, outputA, outputB);
	
	or or1 (or_result, outputA, outputB);
	
	adder adder1bit (carry_in, outputA, outputB, carry_out, sum);	
	
	mux4bit mux_operation (result, and_result, or_result, sum, less, operation);
	
	
	// Logic of operation part
	
	
endmodule
	