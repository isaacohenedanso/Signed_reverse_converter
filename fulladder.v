module fulladder(A, B, CI, CO, S);
input A, B, CI;
output CO, S;

assign {CO, S} = A + B + CI;
endmodule
