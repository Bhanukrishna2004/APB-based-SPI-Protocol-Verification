package spi_apb_test_pkg;

	import uvm_pkg::* ;

	`include "uvm_macros.svh"
	`include "spi_xtn.sv"
//	`include "env_cfg.sv"
	`include "spi_cfg.sv"
	`include "apb_cfg.sv"
	`include "spi_apb_reg_integer_file.sv"
	`include "spi_apb_reg_block.sv"

	`include "env_cfg.sv"
	`include "spi_driver.sv"
	`include "spi_monitor.sv"
	`include "spi_sequencer.sv"
	`include "spi_agent.sv"
	`include "spi_agent_top.sv"
	`include  "apb_xtn.sv"
	`include "apb_driver.sv"
	`include "apb_monitor.sv"
	`include "apb_sequencer.sv"
	`include "apb_agent.sv"
	`include "apb_agent_top.sv"
	`include "spi_sequence.sv"
	`include "apb_sequence.sv"
	`include "spi_apb_virtual_sequencer.sv"
	`include "spi_apb_virtual_sequence.sv"
	`include "spi_apb_scoreboard.sv"
	`include "spi_apb_env.sv"
	`include "spi_apb_test.sv"
endpackage
