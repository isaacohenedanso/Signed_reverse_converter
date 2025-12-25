module decoder(msb_A, msb_B, lsb_A, lsb_B, is_neg_2_pow_n_A, is_zero_B, is_2_pow_n_A, is_neg_2_B, aluOp, sel, shamt, shdir);
parameter n = 3;
input is_neg_2_pow_n_A;
input is_zero_B;
input is_2_pow_n_A;
input is_neg_2_B;
input [1: 0] msb_A, msb_B;
input lsb_A, lsb_B;
output reg [3: 0] aluOp;
output reg [2: 0] sel, shamt;
output reg shdir;

always @* begin
    shamt = 3'b001;
    shdir = 1'b1;
    aluOp = 4'b0010;
    sel = 3'b000;

    case ({lsb_A, lsb_B})
        2'b01: sel = 3'b111; //G7
        2'b11: begin //odd Gs
            case(msb_A[1])
                1'b1: sel = 3'b001; //G1
                1'b0: sel = 3'b011; //G3
            endcase
        end
        2'b00: begin //even Gs
            case ({is_neg_2_pow_n_A, is_zero_B, is_2_pow_n_A, is_neg_2_B})
                4'b1100: sel = 3'b000; //G0
                4'b1000: sel = (msb_B[1] == 1'b0)? 3'b000: 3'b100; //G0: G4
                4'b0100: sel =
                    (msb_A == 2'b01)? 3'b101:
                    (msb_A == 2'b10)? 3'b100:
                    3'b000 ; //G5: G4: G0
                4'b0011: sel =  3'b110; //G6
                4'b0010: sel = (msb_B[1] == 1'b0)? 3'b101: 3'b110; //G5: G6
                4'b1001: sel = 3'b100; //G5: G6
                4'b0001: sel =
                    (msb_A == 2'b01)? 3'b101:
                    (msb_A == 2'b11 || msb_A == 2'b00)? 3'b110:
                    3'b100; //G5: G6: G4
                default: begin
                    case({msb_A, msb_B})
                        4'b0000, 4'b0001, 4'b1100, 4'b1101: sel = 3'b000; //G0
                        4'b0111, 4'b0110: sel = 3'b010; //G2;
                        4'b1011: sel = 3'b100; //G4
                        4'b0100: sel = 3'b101; //G5
                        4'b1111, 4'b1110, 4'b0011, 4'b0010: sel = 3'b110; //G6
                    endcase
                end
            endcase
       end
    endcase
end
endmodule
