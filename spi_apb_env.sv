class spi_apb_env extends uvm_env;

	`uvm_component_utils(spi_apb_env)

	apb_agent_top apb_top;
	spi_agent_top spi_top;
	env_cfg e_cfg;
	
	spi_apb_scoreboard sb;
	
	spi_apb_virtual_sequencer vsqrh;
		
	function new(string name="spi_apb_env", uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual	function void build_phase(uvm_phase phase);
		if(!uvm_config_db #(env_cfg)::get(this,"","env_cfg",e_cfg))
			`uvm_fatal(get_type_name(),"Check the connections brother");
		if(e_cfg.has_apb_agent)
			apb_top=apb_agent_top::type_id::create("apb_top",this);
		if(e_cfg.has_spi_agent)
			spi_top=spi_agent_top::type_id::create("spi_top",this);
		if(e_cfg.has_scoreboard)
			sb = spi_apb_scoreboard::type_id::create("sb",this);
		if(e_cfg.has_virtual_sequencer)
			vsqrh = spi_apb_virtual_sequencer::type_id::create("vsqrh",this);
		super.build_phase(phase);
	endfunction

	virtual function void connect_phase(uvm_phase phase);

		if(e_cfg.has_virtual_sequencer) begin
			foreach(vsqrh.a_sqrh[i]) begin
				vsqrh.a_sqrh[i] = apb_top.agenth[i].sqrh;
			end

			foreach(vsqrh.s_sqrh[i]) begin
				vsqrh.s_sqrh[i] = spi_top.agenth[i].sqrh;
			end
		end

		if(e_cfg.has_scoreboard) begin
			foreach(sb.apb_fifo[i]) begin
				apb_top.agenth[i].monh.apb_ap.connect(sb.apb_fifo[i].analysis_export);
			end
			
			foreach(sb.spi_fifo[i]) begin
				spi_top.agenth[i].monh.spi_ap.connect(sb.spi_fifo[i].analysis_export);
			end
		end

		super.connect_phase(phase);
	endfunction
			

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology;
	endfunction
endclass	
