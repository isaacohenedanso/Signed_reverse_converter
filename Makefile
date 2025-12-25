CC=iverilog
CCC=vvp

all: build run


build: fulladder.v adder_subtractor.v arithmetic_unit.v logic_u.v logic_unit.v mux8.v shifter.v alu.v op_A.v op_B.v decoder.v mux.v top.v top_tb.v
	$(CC) -o top fulladder.v adder_subtractor.v arithmetic_unit.v logic_u.v logic_unit.v mux8.v shifter.v alu.v op_A.v op_B.v decoder.v mux.v top.v top_tb.v
	@echo "Compiling Verilog source files...\n"

run: top
	@echo "Running compiled file...\n"
	$(CCC) top


clean:
	rm *.vcd top
