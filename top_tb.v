`timescale 1ns / 1ps
module top_tb;
    function integer mod;
        input integer N;
        input integer modulus;
        integer temp;
    begin
        temp = N;
        if (temp >= 0) begin
            mod = temp % modulus;
        end
        else begin
            while (temp < 0) begin
                temp = temp + modulus;
            end
            mod = temp;
        end
    end
    endfunction
    parameter n = 3;
    reg  [n: 0] R1;
    reg  [n-1: 0] R0, R_1;
    wire signed [3*n-1: 0] N;

    top dut (.R1(R1), .R0(R0), .R_1(R_1), .N(N));

    integer i, pass, fail;
    initial begin
        $dumpfile("top.vcd");
        $dumpvars(0);
        pass = 0;
        fail = 0;
        for(i = -252; i <252; i = i + 1) begin
            R1 = mod(i, 9);
            R0 = mod(i, 8);
            R_1 = mod(i, 7);
            #10;
            if (N === i[3*n-1:0]) begin
                pass = pass + 1;
            end
            else begin
                fail = fail + 1;
                $display("failed: expected %0d, got N=%0d", i, N);
            end
        end
        $display("pass = %0d", pass);
        $display("fail = %0d", fail);
        $finish;
    end
endmodule
