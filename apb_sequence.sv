class apb_base_sequence extends uvm_sequence #(apb_xtn) ;

	`uvm_object_utils(apb_base_sequence)

	env_cfg e_cfg;
	spi_apb_reg_block reg_block;
	uvm_status_e status;
	logic [7:0] data1,data2,data3,data4,data5;

	

	function new(string name="apb_base_sequence");
		super.new(name);
	endfunction


	task body();

		if(!uvm_config_db #(env_cfg)::get(null,get_full_name,"env_cfg",e_cfg))
			`uvm_fatal(get_type_name(),"Check the connections brother")
		
			this.reg_block = e_cfg.reg_block;
	endtask

endclass


class apb_rst_seqs extends apb_base_sequence;

	`uvm_object_utils(apb_rst_seqs)

	bit [7:0] ctrl;
	function new(string name="apb_rst_seqs");

		super.new(name);
	endfunction


	task body();
		
		super.body();
		repeat(1) begin
			req = apb_xtn::type_id::create("req");

			start_item(req);	
			assert(req.randomize() with {PRESET_n == 1'b1; PWRITE == 1'b0; PADDR == 3'b000;})
			finish_item(req);


			start_item(req);	
			assert(req.randomize() with {PRESET_n == 1'b1; PWRITE == 1'b0; PADDR == 3'b001;})
			finish_item(req);


			start_item(req);	
			assert(req.randomize() with {PRESET_n == 1'b1; PWRITE == 1'b0; PADDR == 3'b010;})
			finish_item(req);


			start_item(req);	
			assert(req.randomize() with {PRESET_n == 1'b1; PWRITE == 1'b0; PADDR == 3'b011;})
			finish_item(req);


			start_item(req);	
			assert(req.randomize() with {PRESET_n == 1'b1; PWRITE == 1'b0; PADDR == 3'b101;})
			finish_item(req);

		end

	endtask

endclass


class apb_cpha1_cpol1_seqs extends apb_base_sequence;

	`uvm_object_utils(apb_cpha1_cpol1_seqs)

	bit [7:0] ctrl;
	function new(string name="apb_cpha1_cpol1_seqs");
		super.new(name);
	endfunction

	task body();
		super.body();
		if(!uvm_config_db #(bit[7:0])::get(null,get_full_name(),"bit[7:0]",ctrl))
			`uvm_fatal(get_type_name(),"Check the connections brother")

		repeat(1) 
		  begin
			req = apb_xtn::type_id::create("req");
			data1 = ctrl;
			data2 = 8'b00011001;
			data3 = 8'b00010001;
			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b0; PADDR != 3'b101;});
			finish_item(req);

			this.reg_block.cr1.write(status,data1, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.cr2.write(status,data2, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.br.write(status,data3, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));

			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b1; PADDR == 3'b101;});
			finish_item(req);
		   end
	endtask
endclass
		

class apb_read_sequence extends apb_base_sequence;

	`uvm_object_utils(apb_read_sequence)

	function new(string name="apb_read_sequence");
		super.new(name);
	endfunction

	task body();

		repeat(1)
		  begin
			req = apb_xtn::type_id::create("req");
			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b0; PADDR == 3'b101;});
			finish_item(req);
		   end
	endtask
endclass


	
class apb_cpha1_cpol0_seqs extends apb_base_sequence;

	`uvm_object_utils(apb_cpha1_cpol0_seqs)

	bit [7:0] ctrl;
	function new(string name="apb_cpha1_cpol0_seqs");
		super.new(name);
	endfunction

	task body();
		super.body();
		if(!uvm_config_db #(bit[7:0])::get(null,get_full_name(),"bit[7:0]",ctrl))
			`uvm_fatal(get_type_name(),"Check the connections brother")

		repeat(1) 
		  begin
			req = apb_xtn::type_id::create("req");
			data1 = ctrl;
			data2 = 8'b00011001;
			data3 = 8'b00010001;
			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b0; PADDR != 3'b101;});
			finish_item(req);

			this.reg_block.cr1.write(status,data1, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.cr2.write(status,data2, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.br.write(status,data3, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));

			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b1; PADDR == 3'b101;});
			finish_item(req);
		   end
	endtask
endclass



class apb_cpha0_cpol1_seqs extends apb_base_sequence;

	`uvm_object_utils(apb_cpha0_cpol1_seqs)

	bit [7:0] ctrl;
	function new(string name="apb_cpha0_cpol1_seqs");
		super.new(name);
	endfunction

	task body();
		super.body();
		if(!uvm_config_db #(bit[7:0])::get(null,get_full_name(),"bit[7:0]",ctrl))
			`uvm_fatal(get_type_name(),"Check the connections brother")

		repeat(1) 
		  begin
			req = apb_xtn::type_id::create("req");
			data1 = ctrl;
			data2 = 8'b00011001;
			data3 = 8'b00010001;
			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b0; PADDR != 3'b101;});
			finish_item(req);

			this.reg_block.cr1.write(status,data1, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.cr2.write(status,data2, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.br.write(status,data3, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));

			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b1; PADDR == 3'b101;});
			finish_item(req);
		   end
	endtask
endclass




class apb_cpha0_cpol0_seqs extends apb_base_sequence;

	`uvm_object_utils(apb_cpha0_cpol0_seqs)

	bit [7:0] ctrl;
	function new(string name="apb_cpha0_cpol0_seqs");
		super.new(name);
	endfunction

	task body();
		super.body();
		if(!uvm_config_db #(bit[7:0])::get(null,get_full_name(),"bit[7:0]",ctrl))
			`uvm_fatal(get_type_name(),"Check the connections brother")

		repeat(1) 
		  begin
			req = apb_xtn::type_id::create("req");
			data1 = ctrl;
			data2 = 8'b00011001;
			data3 = 8'b00010001;
			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b0; PADDR != 3'b101;});
			finish_item(req);

			this.reg_block.cr1.write(status,data1, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.cr2.write(status,data2, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.br.write(status,data3, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));

			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b1; PADDR == 3'b101;});
			finish_item(req);
		   end
	endtask
endclass




class apb_msb_cpha1_cpol1_seqs extends apb_base_sequence;

	`uvm_object_utils(apb_msb_cpha1_cpol1_seqs)

	bit [7:0] ctrl;
	function new(string name="apb_msb_cpha1_cpol1_seqs");
		super.new(name);
	endfunction

	task body();
		super.body();
		if(!uvm_config_db #(bit[7:0])::get(null,get_full_name(),"bit[7:0]",ctrl))
			`uvm_fatal(get_type_name(),"Check the connections brother")

		repeat(1) 
		  begin
			req = apb_xtn::type_id::create("req");
			data1 = ctrl;
			data2 = 8'b00011001;
			data3 = 8'b00010001;
			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b0; PADDR != 3'b101;});
			finish_item(req);

			this.reg_block.cr1.write(status,data1, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.cr2.write(status,data2, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.br.write(status,data3, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));

			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b1; PADDR == 3'b101;});
			finish_item(req);
		   end
	endtask
endclass



class apb_msb_cpha1_cpol0_seqs extends apb_base_sequence;

	`uvm_object_utils(apb_msb_cpha1_cpol0_seqs)

	bit [7:0] ctrl;
	function new(string name="apb_msb_cpha1_cpol0_seqs");
		super.new(name);
	endfunction

	task body();
		super.body();
		if(!uvm_config_db #(bit[7:0])::get(null,get_full_name(),"bit[7:0]",ctrl))
			`uvm_fatal(get_type_name(),"Check the connections brother")

		repeat(1) 
		  begin
			req = apb_xtn::type_id::create("req");
			data1 = ctrl;
			data2 = 8'b00011001;
			data3 = 8'b00010001;
			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b0; PADDR != 3'b101;});
			finish_item(req);

			this.reg_block.cr1.write(status,data1, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.cr2.write(status,data2, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.br.write(status,data3, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));

			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b1; PADDR == 3'b101;});
			finish_item(req);
		   end
	endtask
endclass




class apb_msb_cpha0_cpol1_seqs extends apb_base_sequence;

	`uvm_object_utils(apb_msb_cpha0_cpol1_seqs)

	bit [7:0] ctrl;
	function new(string name="apb_msb_cpha0_cpol1_seqs");
		super.new(name);
	endfunction

	task body();
		super.body();
		if(!uvm_config_db #(bit[7:0])::get(null,get_full_name(),"bit[7:0]",ctrl))
			`uvm_fatal(get_type_name(),"Check the connections brother")

		repeat(1) 
		  begin
			req = apb_xtn::type_id::create("req");
			data1 = ctrl;
			data2 = 8'b00011001;
			data3 = 8'b00010001;
			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b0; PADDR != 3'b101;});
			finish_item(req);

			this.reg_block.cr1.write(status,data1, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.cr2.write(status,data2, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.br.write(status,data3, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));

			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b1; PADDR == 3'b101;});
			finish_item(req);
		   end
	endtask
endclass



class apb_msb_cpha0_cpol0_seqs extends apb_base_sequence;

	`uvm_object_utils(apb_msb_cpha0_cpol0_seqs)

	bit [7:0] ctrl;
	function new(string name="apb_msb_cpha0_cpol0_seqs");
		super.new(name);
	endfunction

	task body();
		super.body();
		if(!uvm_config_db #(bit[7:0])::get(null,get_full_name(),"bit[7:0]",ctrl))
			`uvm_fatal(get_type_name(),"Check the connections brother")

		repeat(1) 
		  begin
			req = apb_xtn::type_id::create("req");
			data1 = ctrl;
			data2 = 8'b00011001;
			data3 = 8'b00010001;
			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b0; PADDR != 3'b101;});
			finish_item(req);

			this.reg_block.cr1.write(status,data1, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.cr2.write(status,data2, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.br.write(status,data3, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));

			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b1; PADDR == 3'b101;});
			finish_item(req);
		   end
	endtask
endclass


class low_pwr_seqs extends apb_base_sequence;

	`uvm_object_utils(low_pwr_seqs)
	bit [7:0]ctrl;
//	rand bit[7:0]spr;
//	rand bit[7:0]sppr;

	function new(string name="low_pwr_seqs");
		super.new(name);
	endfunction

	task body();
		super.body();
		if(!uvm_config_db #(bit[7:0])::get(null,get_full_name(),"bit[7:0]",ctrl))
			`uvm_fatal(get_type_name(),"Check the connections brother")

		repeat(1) 
		  begin
			req = apb_xtn::type_id::create("req");
			data1 = ctrl;
			data2 = 8'b00011011;
			data3 = 8'b00010001;
			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b0; PADDR != 3'b101;});
			finish_item(req);

			this.reg_block.cr1.write(status,data1, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.cr2.write(status,data2, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));
			this.reg_block.br.write(status,data3, .path(UVM_BACKDOOR), .map(reg_block.spi_reg_map), .parent(this));

			start_item(req);
			assert(req.randomize() with { PRESET_n == 1'b1; PWRITE == 1'b1; PADDR == 3'b101;});
			finish_item(req);
		   end
	endtask
endclass
