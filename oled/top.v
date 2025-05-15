module top (
    input clk,
    output oled_scl,
    inout oled_sda
);
    oled_display oled (
        .clk(clk),
        .scl(oled_scl),
        .sda(oled_sda)
    );
endmodule
