interface apb_if(input bit clock);

//	bit PCLK;
	logic PRESET_n;
	logic PSEL;
	logic PENABLE;
	logic PWRITE;
	logic [2:0]PADDR;
	logic [7:0]PWDATA;
	logic [7:0]PRDATA;
	logic PREADY;
	logic PSLVERR;

//assign PCLK=clk;

	clocking apb_drv_cb@(posedge clock);
		
		default input #1 output #1;
		
//		output PCLK;
		output PRESET_n;
		output PSEL;
		output PENABLE;
		output PWRITE;
		output PADDR;
		output PWDATA;
		
		input PRDATA;
		input PREADY;
		input PSLVERR;
	endclocking

	clocking apb_mon_cb@(posedge clock);
		
		default input #1 output #1;
		
//		input PCLK;
		input PRESET_n;
		input PSEL;
		input PENABLE;
		input PWRITE;
		input PADDR;
		input PWDATA;
		
		input PRDATA;
		input PREADY;
		input PSLVERR;
	endclocking

modport APB_DRV_MP(clocking apb_drv_cb);

modport APB_MON_MP(clocking apb_mon_cb);



property signals_stable;
@(posedge clock)$rose(PSEL)|->($stable(PWRITE)&& $stable(PADDR)&& $stable(PWDATA))until PREADY[->1];
endproperty

property penable_stable;
@(posedge clock)$rose(PENABLE)|->($stable(PSEL)&& $stable(PENABLE))until PREADY[->1];
endproperty

property psel_to_ready;
@(posedge clock)(PSEL && PENABLE)|->##[0:$]PREADY;
endproperty

property address_reserved;
@(posedge clock)PSEL|->((PADDR!=3'b100)||(PADDR!=3'b110)||(PADDR!=3'b111));
endproperty

property penable_deassert;
@(posedge clock)(!PSEL)|->(!PENABLE);
endproperty

property valid_write_data_transfer;
@(posedge clock)(PSEL&&PENABLE&&PWRITE)|->(PWDATA !=='hx);
endproperty

property valid_read_data_transfer;
@(posedge clock)(PSEL&&PENABLE&&(!PWRITE))|->(PWDATA !=='hx);
endproperty

property pready_low_at_start;
@(posedge clock)(PSEL&&(!PENABLE))|->(!PREADY);
endproperty

property pready_deassert;
@(posedge clock)(!PSEL)|->(!PREADY);
endproperty

signals_stablea:assert property(signals_stable)
                $info("signal stability is verified");
                else
                $error("signal stability is not verified");

penable_stable1a:assert property(penable_stable)
                $info("penable_stable stability is verified");
                else
                $error("penable_stable stability is not verified");

psel_to_readya:assert property(psel_to_ready)
                $info("psel_to_ready stability is verified");
                else
                $error("psel_to_ready stability is not verified");

address_reserveda:assert property(address_reserved)
                $info("address_reserved stability is verified");
                else
                $error("address_reserved stability is not verified");

penable_deasserta:assert property(penable_deassert)
                $info("penable_deassert stability is verified");
                else
                $error("penable_deassert stability is not verified");

valid_write_data_transfera:assert property(valid_write_data_transfer)
                $info("valid_write_data_transfer stability is verified");
                else
                $error("valid_write_data_transfer stability is not verified");

valid_read_data_transfera:assert property(valid_read_data_transfer)
                $info("valid_read_data_transfer stability is verified");
                else
                $error("valid_read_data_transfer stability is not verified");

pready_low_at_starta:assert property(pready_low_at_start)
                $info("pready_low_at_start stability is verified");
                else
                $error("pready_low_at_start stability is not verified");

pready_deasserta:assert property(pready_deassert)
                $info("pready_deassert stability is verified");
                else
                $error("pready_deassert stability is not verified");

endinterface

