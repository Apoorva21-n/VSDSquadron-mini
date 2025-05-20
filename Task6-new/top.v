module top (
    input clk,
    input rst,
    input rx,
    output [6:0] seg,
    output buzzer,
    output led
);

wire [3:0] digit;
wire data_valid;

uart_rx uart (
    .clk(clk),
    .rst(rst),
    .rx(rx),
    .data(digit),
    .data_valid(data_valid)
);

seven_seg_decoder ssd (
    .digit(digit),
    .seg(seg)
);

assign buzzer = (digit >= 4'd7) ? 1'b1 : 1'b0;
assign led = buzzer;

endmodule
