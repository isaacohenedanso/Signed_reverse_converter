module top(R1, R0, R_1, N);
parameter n = 3;
input [n: 0] R1;
input [n-1: 0] R0, R_1;
output [3*n-1: 0] N;

wire [7: 0] from_opA;
wire [7: 0] from_opB;
wire [3: 0] aluOp;
wire [2: 0] shamt, sel;
wire shdir;
wire [7: 0] frommux_A, frommux_B;
wire [7: 0] N_2, N_1;
wire [n-1: 0] N0;
wire Cout_A, Cout_B;
wire is_neg_2_pow_n_A;
wire is_2_pow_n_A;
wire is_zero_B;
wire is_neg_2_B;
wire [n-1: 0] N2, N1;

localparam signed [7: 0] in_A1 = (2<<(n-1))-1;
localparam signed [7: 0] in_A2 = -((2 << (n-1)) + 1) << 1;
localparam signed [7: 0] in_A3 = -((2<<(n-1))+1);
localparam signed [7: 0] in_A4 = ((2<<(n-1))-1) << 1;
localparam signed [7: 0] in_A5 = -((2<<(n-1))-1) -((2<<(n-1))+1);
localparam signed [7: 0] in_A6 = -2;
localparam signed [7: 0] in_A7 = (2<<(n-1))<<1;

localparam signed [7: 0] in_B1 = (2<<(n-1))-1;
localparam signed [7: 0] in_B2 = ((2<<(n-1))+1)<<1;
localparam signed [7: 0] in_B3 = (2<<(n-1))+1;
localparam signed [7: 0] in_B4 = ((2<<(n-1))-1) << 1;
localparam signed [7: 0] in_B5 = 2;
localparam signed [7: 0] in_B6 = (2<<(n-1))<<1;
localparam signed [7: 0] in_B7 = -2;

localparam signed [7: 0] neg_2_pow_n = -(2 << (n-1));

// op_A(R1, R0, R_1, A);
op_A from_A(R1, R0, R_1, from_opA);
// op_B(R1, R_1, B);
op_B from_B(R1, R_1, from_opB);

assign is_neg_2_pow_n_A = (from_opA == neg_2_pow_n)? 1'b1: 1'b0;
assign is_zero_B = (from_opB == 0)? 1'b1: 1'b0;
assign is_2_pow_n_A = (from_opA == (2 << (n-1)))? 1'b1: 1'b0;
assign is_neg_2_B = (from_opB == in_B7)? 1'b1: 1'b0;


// decoder(msb_A, msb_B, lsb_A, lsb_B, is_neg_2_pow_n_A, is_zero_B, is_neg_2_pow_n_A, is_neg_2_B, aluOp, sel, shamt, shdir);
decoder dec(from_opA[n+1:n], from_opB[n:n-1], from_opA[0], from_opB[0], is_neg_2_pow_n_A, is_zero_B, is_2_pow_n_A, is_neg_2_B, aluOp, sel, shamt, shdir);

// mux(in_A, in_B, in_C, in_D, in_E, in_F, sel, outp);
mux mux_A(in_A1, in_A2, in_A3, in_A4, in_A5, in_A6, in_A7, sel, frommux_A);
mux mux_B(in_B1, in_B2, in_B3, in_B4, in_B5, in_B6, in_B7, sel, frommux_B);
// alu(X, Y, S, shift_amount, shift_direction, Outp, Cout)56
alu alu_A(from_opA, frommux_A, aluOp, shamt, shdir, N_2, Cout_A);
alu alu_B(from_opB, frommux_B, aluOp, shamt, shdir, N_1, Cout_B);
assign N2 = N_2[n-1: 0];
assign N1 = N_1[n-1: 0];
assign N0 = R0;
assign N = {N2, N1, N0};
endmodule
