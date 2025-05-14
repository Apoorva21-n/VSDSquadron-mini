module top (
    input clk,
    input uart_rx,
    output oled_scl,
    inout oled_sda
);
    wire [7:0] uart_data;
    wire uart_valid;

    uart_rx uart_inst (
        .clk(clk),
        .rx(uart_rx),
        .data_out(uart_data),
        .data_valid(uart_valid)
    );

    oled_display oled (
        .clk(clk),
        .char_in(uart_data),
        .char_valid(uart_valid),
        .scl(oled_scl),
        .sda(oled_sda)
    );
endmodule
