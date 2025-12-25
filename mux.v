module mux(in_A, in_B, in_C, in_D, in_E, in_F, in_G, sel, outp);
input [7: 0] in_A, in_B, in_C, in_D, in_E, in_F, in_G;
input [2: 0] sel;
output [7: 0] outp;

assign outp = (sel == 3'b001)? in_A:
              (sel == 3'b010)? in_B:
              (sel == 3'b011)? in_C:
              (sel == 3'b100)? in_D:
              (sel == 3'b101)? in_E:
              (sel == 3'b110)? in_F:
              (sel == 3'b111)? in_G:
              3'b000;
endmodule
