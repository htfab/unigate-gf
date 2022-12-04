// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module unigate (
`ifdef USE_POWER_PINS
    inout vdd,
    inout vss,
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [63:0] la_data_in,
    output [63:0] la_data_out,
    input  [63:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    // IO
    assign io_oeb[31:0] = {(32){1'b0}};
    assign io_out[31:0] = {(32){1'b0}};
    assign io_oeb[37:32] = {(6){1'b1}};

    // IRQ
    assign irq = 3'b000;	// Unused

    // LA
    assign la_data_out = {io_in[31:5], io_out[37:32], {(31){1'b0}}};

    ucomb_full gate (
        .in(io_in[31:5]),
        .out(io_out[37:32])
    );

endmodule

