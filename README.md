# APB-based-SPI-Protocol-Verification
# APB-Based SPI Controller Verification using UVM

This project focuses on the functional verification of an APB-Based SPI Controller using a SystemVerilog UVM (Universal Verification Methodology) testbench. The goal of this project is to verify the correct functionality of an SPI controller integrated with the AMBA APB protocol, which is commonly used in System-on-Chip (SoC) designs for low-speed peripheral communication.

The verification environment is developed using UVM, enabling a modular, reusable, and scalable verification architecture. The testbench is designed to generate stimulus, drive transactions to the design, monitor outputs, and validate the correctness of SPI communication and APB transactions.

## Project Overview

The APB interface is responsible for configuring the SPI controller registers and managing communication between the processor and SPI peripheral devices. Through APB read and write transactions, the processor can configure SPI control registers, initiate data transfers, and read status information.

The SPI controller enables serial communication between a master and slave device using the SPI protocol. The protocol uses four primary signals:

- MOSI (Master Out Slave In)
- MISO (Master In Slave Out)
- SCLK (Serial Clock)
- SS / CS (Slave Select / Chip Select)

The verification environment ensures that these signals behave correctly during SPI data transfers and that the APB interface performs correct register access operations.

## UVM Testbench Architecture

The verification environment follows the standard UVM architecture and includes the following components:

- **Sequence Item (Transaction):** Defines APB and SPI transactions used to generate stimulus.
- **Sequence:** Generates sequences of transactions to test different scenarios.
- **Sequencer:** Controls the flow of transactions between sequences and the driver.
- **Driver:** Converts high-level transactions into pin-level signals and drives them to the DUT.
- **Monitor:** Observes DUT signals and captures transactions for analysis.
- **Agent:** Contains the sequencer, driver, and monitor and manages communication with the DUT.
- **Scoreboard:** Compares expected outputs with actual outputs to ensure functional correctness.
- **Environment:** Integrates agents, scoreboard, and other verification components.
- **Test:** Configures the environment and executes verification scenarios.

## Verification Strategy

The verification process focuses on validating the correct operation of both the APB interface and the SPI communication protocol. Multiple test scenarios were implemented to ensure robust verification of the design.

The following functionalities were verified:

- APB read and write transactions
- SPI data transmission through MOSI
- SPI data reception through MISO
- Correct generation of SPI clock (SCLK)
- Proper control of Slave Select (SS) signal
- Register configuration through APB interface
- Serial data shifting and transfer completion

The testbench uses constrained random stimulus generation to improve coverage and detect corner-case bugs. Simulation results were analyzed using waveform debugging tools to confirm correct behavior of the controller.

## Tools and Technologies

- SystemVerilog
- UVM (Universal Verification Methodology)
- AMBA APB Protocol
- SPI Communication Protocol
- Simulation Tools (QuestaSim / Synopsys VCS)
- Waveform Debugging

## Learning Outcomes

Through this project, I gained hands-on experience in:

- Developing reusable UVM verification environments
- Understanding AMBA APB protocol transactions
- Verifying SPI serial communication
- Implementing constrained random verification
- Debugging RTL functionality using waveform analysis
- Building modular verification architectures

This project helped strengthen my understanding of digital design verification methodologies and provided practical exposure to industry-standard verification practices used in ASIC and SoC development.


