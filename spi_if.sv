interface spi_if (input logic clk);

    logic  mosi;
    logic  miso;
    logic  sclk;
    logic  ss;
    logic  spi_interrupt_request;

    clocking spi_drv_cb @(posedge clk);
        default input #1 output #1;
        input mosi, sclk, ss,spi_interrupt_request;
        output  miso;
    endclocking

    clocking spi_mon_cb @(posedge clk);
        default input #1 output #1;
        input mosi, sclk, ss, spi_interrupt_request;
        input miso;
    endclocking

    modport SPI_DRV_MP  (clocking spi_drv_cb);
    modport SPI_MON_MP (clocking spi_mon_cb);

endinterface

