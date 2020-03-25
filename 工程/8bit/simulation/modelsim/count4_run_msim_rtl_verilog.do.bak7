transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/QuartusII/Quartusll_Pro/demo12 {E:/QuartusII/Quartusll_Pro/demo12/count4.v}

vlog -vlog01compat -work work +incdir+E:/QuartusII/Quartusll_Pro/demo12/simulation/modelsim {E:/QuartusII/Quartusll_Pro/demo12/simulation/modelsim/count4.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  count4_tb

add wave *
view structure
view signals
run -all
