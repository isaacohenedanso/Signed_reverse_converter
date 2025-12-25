module arithmetic_unit(A, B, S, Outp, Cout);
input [7: 0] A, B;
input [2: 0] S;
output [7: 0] Outp;
output Cout;

//adder adder_subtractor(X, Y, S, Cout, G);
adder_subtractor add_sub(B, A, S, Cout, Outp);

endmodule
