module logic_u(X, Y, S, Q);
input [1: 0] S;
input X, Y;
output Q;

assign Q = (S == 2'b00)? X & Y:
            (S == 2'b01)? X | Y:
            (S == 2'b10)? X ^ Y:
            ~X;
endmodule
