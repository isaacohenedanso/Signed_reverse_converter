module op_B(R1, R_1, B);
    parameter n = 3;
    input [n: 0] R1;
    input [n-1: 0] R_1;
    output [7: 0] B;

    assign B = R_1 -  R1;

endmodule
