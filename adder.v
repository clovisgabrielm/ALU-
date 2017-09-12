module adder(carry_in, a, b, carry_out, sum);

	output sum, carry_out;
	input a, b, carry_in;
	
	xor xor1 (half_sum, a, b);
	xor xor2 (sum, half_sum, carry_in);
		 
	and and1 (half_carry, a, b);
	and and2 (a2, half_sum, carry_in);
		 
	or or1 (carry_out, a2, half_carry);
	
endmodule
