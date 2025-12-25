module shifter(data, shamt, shdir, outp);
//direction
//1 = right
//0 = left
input [7: 0] data;
input [2: 0] shamt;
input shdir;
output [7: 0] outp;

assign outp = (shdir)? (data >> shamt) : (data << shamt);

endmodule

