module logic_unit(X, Y, S, Q);
input [1: 0] S;
input [7: 0] X, Y;
output [7: 0] Q;

//logic_u(X, Y, S, Q);
logic_u l7(X[7], Y[7], S, Q[7]);
logic_u l6(X[6], Y[6], S, Q[6]);
logic_u l5(X[5], Y[5], S, Q[5]);
logic_u l4(X[4], Y[4], S, Q[4]);
logic_u l3(X[3], Y[3], S, Q[3]);
logic_u l2(X[2], Y[2], S, Q[2]);
logic_u l1(X[1], Y[1], S, Q[1]);
logic_u l0(X[0], Y[0], S, Q[0]);

endmodule
