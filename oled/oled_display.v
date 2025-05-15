// oled_display.v
// SSD1306 OLED "HELLO" Display - Placeholder

module oled_display (
    input clk,
    output scl,
    inout sda
);

    // Message buffer (only as idea – not actually sent to display here)
    reg [7:0] message [0:4];
    initial begin
        message[0] = "H";
        message[1] = "E";
        message[2] = "L";
        message[3] = "L";
        message[4] = "O";
    end

    // Stub – actual OLED control logic via I2C needed
    assign scl = 1'b1;
    assign sda = 1'bz;

endmodule
