transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {count4_8_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+E:/QuartusII/Quartusll_Pro/demo12/simulation/modelsim {E:/QuartusII/Quartusll_Pro/demo12/simulation/modelsim/count4.vt}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  count4_tb

add wave *
view structure
view signals
run -all
