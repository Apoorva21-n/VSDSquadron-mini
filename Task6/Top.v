module top (
    input clk,
    output TRIG,
    input ECHO,
    output BUZZER,
    output UART_TX,
    output SDA,
    output SCL
);

    wire [15:0] distance;
    wire trigger_buzz;

    ultrasonic_sensor usensor (
        .clk(clk),
        .trig(TRIG),
        .echo(ECHO),
        .distance(distance)
    );

    assign trigger_buzz = (distance < 15);
    assign BUZZER = trigger_buzz;

    uart_trx uart (
        .clk(clk),
        .distance(distance),
        .tx(UART_TX)
    );

    oled_display oled (
        .clk(clk),
        .distance(distance),
        .sda(SDA),
        .scl(SCL)
    );

endmodule
