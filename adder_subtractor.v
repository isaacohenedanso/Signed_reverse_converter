module adder_subtractor(X, Y, S, Cout, G);
input [7: 0] X, Y;
input [2: 0] S;
output [7: 0] G;
output Cout;

wire [7: 0] to_A, Y_and_S1, Y_inv_and_S2;
wire [6: 0] c;

assign to_A[7] = (Y[7] & S[1]) | ((~Y[7]) & S[2]);
assign to_A[6] = (Y[6] & S[1]) | ((~Y[6]) & S[2]);
assign to_A[5] = (Y[5] & S[1]) | ((~Y[5]) & S[2]);
assign to_A[4] = (Y[4] & S[1]) | ((~Y[4]) & S[2]);
assign to_A[3] = (Y[3] & S[1]) | ((~Y[3]) & S[2]);
assign to_A[2] = (Y[2] & S[1]) | ((~Y[2]) & S[2]);
assign to_A[1] = (Y[1] & S[1]) | ((~Y[1]) & S[2]);
assign to_A[0] = (Y[0] & S[1]) | ((~Y[0]) & S[2]);

//fulladder(A, B, CI, CO, S);
fulladder fulladder0(to_A[0], X[0], S[0], c[0], G[0]);
fulladder fulladder1(to_A[1], X[1], c[0], c[1], G[1]);
fulladder fulladder2(to_A[2], X[2], c[1], c[2], G[2]);
fulladder fulladder3(to_A[3], X[3], c[2], c[3], G[3]);
fulladder fulladder4(to_A[4], X[4], c[3], c[4], G[4]);
fulladder fulladder5(to_A[5], X[5], c[4], c[5], G[5]);
fulladder fulladder6(to_A[6], X[6], c[5], c[6], G[6]);
fulladder fulladder7(to_A[7], X[7], c[6], Cout, G[7]);

endmodule
