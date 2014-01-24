# 50MHz board input clock
create_clock -period 20.000ns [get_ports clk_50m_fpga]
create_clock -period 20.000ns [get_ports clk_top1]
create_clock -period 20.000ns [get_ports clk_bot1]
create_clock -period 10.000ns [get_ports clk_100m_fpga]


# for enhancing USB BlasterII to be reliable, 25MHz
create_clock -name {altera_reserved_tck} -period 40 {altera_reserved_tck}
set_input_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tdi]
set_input_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tms]
set_output_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tdo]

# FPGA IO port constraints
set_false_path -from [get_ports {user_pb_fpga[0]}] -to *
set_false_path -from [get_ports {user_pb_fpga[1]}] -to *
set_false_path -from [get_ports {user_pb_fpga[2]}] -to *
set_false_path -from [get_ports {user_pb_fpga[3]}] -to *

set_false_path -from [get_ports {user_dipsw_fpga[0]}] -to *
set_false_path -from [get_ports {user_dipsw_fpga[1]}] -to *
set_false_path -from [get_ports {user_dipsw_fpga[2]}] -to *
set_false_path -from [get_ports {user_dipsw_fpga[3]}] -to *

set_false_path -from * -to [get_ports {user_led_fpga[0]}]
set_false_path -from * -to [get_ports {user_led_fpga[1]}]
set_false_path -from * -to [get_ports {user_led_fpga[2]}]
set_false_path -from * -to [get_ports {user_led_fpga[3]}]

# HPS peripherals port false path setting to workaround the unconstraint path (setting false_path for hps_0 ports will not affect the routing as it is hard silicon)
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_emac1_inst_TX_CLK}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_emac1_inst_TXD0}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_emac1_inst_TXD1}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_emac1_inst_TXD2}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_emac1_inst_TXD3}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_emac1_inst_MDC}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_emac1_inst_TX_CTL}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_qspi_inst_SS0}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_qspi_inst_CLK}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_sdio_inst_CLK}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_usb1_inst_STP}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_spim0_CLK}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_spim0_MOSI}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_spim0_SS0}] 

set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_spim1_CLK}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_spim1_MOSI}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_spim1_SS0}] 

set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_uart0_inst_TX}] 
#set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_uart0_inst_RX}]
#set_false_path -from * -to [get_ports {hps_can0_TX}] 
#set_false_path -from * -to [get_ports {hps_trace_CLK}] 
#set_false_path -from * -to [get_ports {hps_trace_D0}] 
#set_false_path -from * -to [get_ports {hps_trace_D1}] 
#set_false_path -from * -to [get_ports {hps_trace_D2}] 
#set_false_path -from * -to [get_ports {hps_trace_D3}] 
#set_false_path -from * -to [get_ports {hps_trace_D4}] 
#set_false_path -from * -to [get_ports {hps_trace_D5}] 
#set_false_path -from * -to [get_ports {hps_trace_D6}] 
#set_false_path -from * -to [get_ports {hps_trace_D7}] 

set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_emac1_inst_MDIO}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_qspi_inst_IO0}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_qspi_inst_IO1}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_qspi_inst_IO2}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_qspi_inst_IO3}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_sdio_inst_CMD}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_sdio_inst_D0}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_sdio_inst_D1}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_sdio_inst_D2}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_sdio_inst_D3}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_usb1_inst_D0}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_usb1_inst_D1}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_usb1_inst_D2}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_usb1_inst_D3}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_usb1_inst_D4}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_usb1_inst_D5}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_usb1_inst_D6}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_usb1_inst_D7}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_i2c1_inst_SDA}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_i2c1_inst_SCL}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_gpio_inst_GPIO09}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_gpio_inst_GPIO35}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_gpio_inst_GPIO41}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_gpio_inst_GPIO42}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_gpio_inst_GPIO43}] 
set_false_path -from * -to [get_ports {hps_0_hps_io_hps_io_gpio_inst_GPIO44}] 

set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_MDIO}] -to *
set_false_path -from [get_ports {ps_0_hps_io_hps_io_qspi_inst_IO0}] -to *
set_false_path -from [get_ports {ps_0_hps_io_hps_io_qspi_inst_IO1}] -to *
set_false_path -from [get_ports {ps_0_hps_io_hps_io_qspi_inst_IO2}] -to *
set_false_path -from [get_ports {ps_0_hps_io_hps_io_qspi_inst_IO3}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_sdio_inst_CMD}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_sdio_inst_D0}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_sdio_inst_D1}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_sdio_inst_D2}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_sdio_inst_D3}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_usb1_inst_D0}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_usb1_inst_D1}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_usb1_inst_D2}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_usb1_inst_D3}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_usb1_inst_D4}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_usb1_inst_D5}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_usb1_inst_D6}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_usb1_inst_D7}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_i2c1_inst_SDA}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_i2c1_inst_SCL}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_gpio_inst_GPIO09}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_gpio_inst_GPIO35}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_gpio_inst_GPIO41}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_gpio_inst_GPIO42}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_gpio_inst_GPIO43}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_gpio_inst_GPIO44}] -to *

set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_RX_CTL}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_RX_CLK}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_RXD0}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_RXD1}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_RXD2}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_RXD3}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_CLK}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_DIR}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_NXT}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_MISO}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_RX}] -to *
set_false_path -from [get_ports {hps_0_hps_io_hps_io_emac1_inst_RX}] -to *
