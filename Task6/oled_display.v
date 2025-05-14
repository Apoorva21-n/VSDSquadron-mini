module oled_display (
    input clk,
    input [15:0] distance,
    output reg sda,
    output reg scl
);

    // Simple stub — needs proper SSD1306 I2C FSM logic
    // Placeholder: hold lines high to avoid OLED freezing
    initial begin
        sda = 1;
        scl = 1;
    end

endmodule
