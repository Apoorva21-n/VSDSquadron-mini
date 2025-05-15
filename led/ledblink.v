module led_blink_three (
    input clk,
    output reg [2:0] leds
);

    reg [24:0] counter;
    reg [1:0] state;

    always @(posedge clk) begin
        counter <= counter + 1;

        if (counter == 25_000_000) begin // ~0.5 sec delay at 50 MHz
            counter <= 0;
            state <= state + 1;
        end
    end

    always @(*) begin
        case (state)
            2'd0: leds = 3'b001;
            2'd1: leds = 3'b010;
            2'd2: leds = 3'b100;
            default: leds = 3'b001;
        endcase
    end

endmodule
