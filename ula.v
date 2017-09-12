module ula(Ainvert, Bnegate, carry_in, a, b, carry_out, operation, result, set, overflow, zero);

	parameter less = 0;
	input Ainvert, Bnegate;
	
	input [7:0] a, b;
	input [1:0] operation; // quatro operacoes - entao vai de 00 ate 11
	output [7:0] result;
	output zero;
	output overflow;
	
	wire [7:0] carry_in;
	wire [7:0] carry_out;
	wire set;
	
	// Sequencia dos parametros na ula de 1 bit:
	// Ainvert, Bnegate, carry_in, a, b, less, carry_out, operation, result
	
	ula1bit ula0 (Ainvert, Bnegate, Bnegate, a[0], b[0], set, carry_out[0], operation, result[0]);
	
	ula1bit ula1 (Ainvert, Bnegate, carry_out[0], a[1], b[1], less, carry_out[1], operation, result[1]);
	
	ula1bit ula2 (Ainvert, Bnegate, carry_out[1], a[2], b[2], less, carry_out[2], operation, result[2]);
	
	ula1bit ula3 (Ainvert, Bnegate, carry_out[2], a[3], b[3], less, carry_out[3], operation, result[3]);
	
	ula1bit ula4 (Ainvert, Bnegate, carry_out[3], a[4], b[4], less, carry_out[4], operation, result[4]);
	
	ula1bit ula5 (Ainvert, Bnegate, carry_out[4], a[5], b[5], less, carry_out[5], operation, result[5]);
	
	ula1bit ula6 (Ainvert, Bnegate, carry_out[5], a[6], b[6], less, carry_out[6], operation, result[6]);
	
	// Sequencia de parametros na ula do bit mais significativo
	// Ainvert, Bnegate, carry_in, a, b, less, operation, result, set, overflow
	msb_ula1bit ula7 (Ainvert, Bnegate, carry_out[6], a[7], b[7], less, operation, result[7], set, overflow);
	
	nor zero_output (zero, result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7]);
	
	
	
	
endmodule
	