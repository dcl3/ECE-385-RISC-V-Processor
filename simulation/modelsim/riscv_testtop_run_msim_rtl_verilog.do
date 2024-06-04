transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/definitions.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/datapath.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/test_memory.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/synchronizer.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/RISCV_Opcode_Constants.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/registerfile.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/reg_32.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/mux_2x1.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/mem2IO.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/instruction_decoder.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/control_transfer.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/alu_control.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/alu.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/riscV.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/memory_contents.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/immediate_generator.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/control.sv}
vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/riscv_testtop.sv}

vlog -sv -work work +incdir+C:/Users/mikelee/Documents/ECE385/final {C:/Users/mikelee/Documents/ECE385/final/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 50000 ns
