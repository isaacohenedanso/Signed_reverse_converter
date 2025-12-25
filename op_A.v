module op_A(R1, R0, R_1, A);
    parameter n = 3;
    input [n: 0] R1;
    input [n-1: 0] R0, R_1;
    output [7: 0] A;

    assign A = R1 + R_1 - (2*R0);

endmodule
