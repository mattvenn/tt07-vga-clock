`default_nettype none
module tt_um_vga_clock (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    wire [1:0] R;
    wire [1:0] G;
    wire [1:0] B;
    wire hsync, vsync;
    wire matt_pmod = ui_in[3];
    // https://tinytapeout.com/specs/pinouts/#common-peripherals

    assign uo_out[0] = matt_pmod ? hsync : R[1];
    assign uo_out[1] = matt_pmod ? vsync : G[1];
    assign uo_out[2] = matt_pmod ? R[0]  : B[1];
    assign uo_out[3] = matt_pmod ? R[1]  : vsync;
    assign uo_out[4] = matt_pmod ? G[0]  : R[0];
    assign uo_out[5] = matt_pmod ? G[1]  : G[0];
    assign uo_out[6] = matt_pmod ? B[0]  : B[0];
    assign uo_out[7] = matt_pmod ? B[1]  : hsync;

    vga_clock vga_clock (
    .clk        (clk), 
    .reset_n    (rst_n),
    // inputs
    .adj_hrs    (ui_in[0]),
    .adj_min    (ui_in[1]),
    .adj_sec    (ui_in[2]),
    // outputs
    .hsync      (hsync),
    .vsync      (vsync),
    .rrggbb     ({R,G,B})
    );

endmodule
