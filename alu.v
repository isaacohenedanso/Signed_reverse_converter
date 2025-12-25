module alu(X, Y, S, shift_amount, shift_direction, Outp, Cout);
input [7: 0] X, Y;
input [3: 0] S;
input [2: 0] shift_amount;
input shift_direction;
output [7: 0] Outp;
output Cout;

wire [7: 0] fromAU, fromLU, fromM;

// arithmetic_unit(A, B, S, Outp, Cout);
arithmetic_unit AU(Y, X, S[2: 0], fromAU, Cout);

// logic_unit(X, Y, S, Q);
logic_unit LU(X, Y, S[1: 0], fromLU);

// mux8(A, B, sel, outp);
mux8 mux(fromAU, fromLU, S[3], fromM);

// shifter(data, shamt, shdir, outp);
shifter shift(fromM, shift_amount, shift_direction, Outp);

endmodule
