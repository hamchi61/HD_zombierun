
    module mario_run(clk, video_on, x, y, color);
    parameter ROM_WIDTH = 12;
    parameter ROM_ADDR_BITS = 13;

    (* rom_style="block" *)
    reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];
    input wire clk;
    input wire video_on;
    input wire [6:0] x;
    input wire [5:0] y;
    reg [ROM_ADDR_BITS-1:0] address;
    output reg [ROM_WIDTH-1:0] color;

    initial
      $readmemh("mario_run.hex", rom);

    always @(posedge clk)
      if (video_on) begin
         address <= {y, x};
         color <= rom[address];
      end
    endmodule
    