class spi_sequence extends uvm_sequence #(spi_xtn);

	`uvm_object_utils(spi_sequence)

		function new(string name="spi_base_sequence");
			super.new(name);
		endfunction


		task body();

			repeat(1) begin
				req = spi_xtn::type_id::create("req");
				start_item(req);
				req.randomize();
				finish_item(req);
			end

		endtask
endclass
