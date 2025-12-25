module mux8(A, B, sel, outp);
input [7: 0] A, B;
input sel;
output [7: 0] outp;

assign outp  = (~sel) ? A : B;
endmodule
