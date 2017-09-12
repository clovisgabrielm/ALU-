module mux(OUT, X, Y, SEL);
	output OUT;
	input X, Y, SEL;
	not I5 (sel_n, SEL) ;
	and I6 (sel_x, Y, SEL);
	and I7 (sel_y, sel_n, X);
	or I4 (OUT, sel_x, sel_y);
endmodule
