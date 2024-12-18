`timescale 1ns / 1ps

module display(
    output wire [6:0] seg,
    output wire [3:0] ano,
    input wire [15:0] nums,
    input wire basys3_clk
);
    wire [1:0] s;
    wire clk;
    clock_div clock_div(.clk(basys3_clk), .clr(0), .out_clk(clk), .s(s));
    seg_mux seg_mux(.s(s), .seg(seg), .ano(ano), .nums(nums));
endmodule
