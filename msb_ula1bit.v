module msb_ula1bit(Ainvert, Bnegate, carry_in, a, b, less, operation, result, set, overflow);
	
	input less;
	input carry_in;
	input Ainvert, Bnegate;
	input a, b;
	input [1:0] operation;
	output set;
	output result, overflow;
	
	not IA (not_a, a);
	not IB (not_b, b);
	
	mux muxA (outputA, a, not_a, Ainvert);
	mux muxB (outputB, b, not_b, Binvert);
	
	and a1 (and_result, outputA, outputB);
	
	or or1 (or_result, outputA, outputB);
	
	adder adder1bit (carry_in, outputA, outputB, carry_out, sum);	
	
	mux4bit mux_operation (result, and_result, or_result, sum, less, operation);
	
	//O xor dos carries eh a saida overflow
	xor carries_output (overflow, carry_in, carry_out);
	xor set_output (set, sum, overflow);
	
	
	
endmodule
	