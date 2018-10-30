set projDir "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/planAhead"
set projName "ALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/mojo_top_0.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/reset_conditioner_1.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/fsm_tester_2.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/display_3.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/alu_4.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/display_3.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/alu_4.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/char_7.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/decoder_8.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/adder_9.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/compare_10.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/boolean_11.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/shifter_12.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/multiply_13.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/divide_14.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/char_7.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/decoder_8.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/adder_9.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/compare_10.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/boolean_11.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/shifter_12.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/multiply_13.v" "C:/Users/user/Documents/ISTD/50.002/Github/ALU_5/ALU/work/verilog/divide_14.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
