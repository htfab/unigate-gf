// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module ucomb_full (
    input [26:0] in,
    output [5:0] out
);

ucomb ucomb_inst (
    .u21_in(in[3:0]),
    .u31_in(in[9:4]),
    .u41_in(in[19:10]),
    .u22_in(in[25:20]),
    .u22_sel(in[26]),
    .u21_out(out[0]),
    .u31_out(out[1]),
    .u41_out(out[2]),
    .u22_out(out[4:3]),
    .mux_out(out[5])
);

endmodule

