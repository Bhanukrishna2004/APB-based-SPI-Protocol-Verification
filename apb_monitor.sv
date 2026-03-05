class apb_monitor extends uvm_monitor;

	`uvm_component_utils(apb_monitor)
	
	uvm_analysis_port #(apb_xtn) apb_ap;
	
	apb_cfg a_cfg;
	
	virtual apb_if.APB_MON_MP vif;
	
	function new(string name="apb_monitor", uvm_component parent);
		super.new(name,parent);
		apb_ap = new("apb_ap",this);
	endfunction
	function void build_phase(uvm_phase phase);

                if(!uvm_config_db #(apb_cfg)::get(this,"","apb_cfg",a_cfg))
                        `uvm_fatal(get_type_name(),"Check the connections brother")

        endfunction

        function void connect_phase(uvm_phase phase);
                vif = a_cfg.vif;
        endfunction

	task run_phase(uvm_phase phase);
		forever 
			collect_data();
	endtask


	task collect_data();
		apb_xtn xtnh;
		xtnh = apb_xtn::type_id::create("xtnh");

		@(vif.apb_mon_cb);
		wait(vif.apb_mon_cb.PENABLE && vif.apb_mon_cb.PREADY)
		xtnh.PSEL = vif.apb_mon_cb.PSEL;
		xtnh.PRESET_n = vif.apb_mon_cb.PRESET_n;
		xtnh.PENABLE = vif.apb_mon_cb.PENABLE;
		xtnh.PADDR = vif.apb_mon_cb.PADDR;
		xtnh.PWRITE = vif.apb_mon_cb.PWRITE;

		if(vif.apb_mon_cb.PWRITE)
			xtnh.PWDATA = vif.apb_mon_cb.PWDATA;
		else
			xtnh.PRDATA = vif.apb_mon_cb.PRDATA;
		xtnh.PREADY = vif.apb_mon_cb.PREADY;
		xtnh.PSLVERR = vif.apb_mon_cb.PSLVERR;
	
		`uvm_info(get_type_name(),$sformatf("Printing from APB monitor %s",xtnh.sprint()),UVM_LOW)
		apb_ap.write(xtnh);
	endtask
endclass

