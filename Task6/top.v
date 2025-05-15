module top(
    input clk,         // 12 MHz clock
    input uart_rx_pin, // input from Docklight TX
    output [6:0] seg,
    output dp
);

    wire [7:0] rx_data;
    wire rx_done;
    reg [3:0] digit;

    // UART Receiver: 9600 baud at 12MHz clock
    uart_rx #(.CLK_FREQ(12000000), .BAUD_RATE(9600)) uart_inst (
        .clk(clk),
        .rst(1'b0),        // no external reset needed
        .rx(uart_rx_pin),
        .data(rx_data),
        .done(rx_done)
    );

    // Convert ASCII to digit when a new byte is received
    always @(posedge clk) begin
        if (rx_done) begin
            if (rx_data >= "1" && rx_data <= "7")
                digit <= rx_data - "0"; // convert ASCII to number
            else
                digit <= 4'd0; // display OFF for any invalid input
        end
    end

    // 7-segment decoder
    function [6:0] digit_to_seg;
        input [3:0] d;
        begin
            case (d)
                4'd1: digit_to_seg = 7'b0110000;
                4'd2: digit_to_seg = 7'b1101101;
                4'd3: digit_to_seg = 7'b1111001;
                4'd4: digit_to_seg = 7'b0110011;
                4'd5: digit_to_seg = 7'b1011011;
                4'd6: digit_to_seg = 7'b1011111;
                4'd7: digit_to_seg = 7'b1110000;
                default: digit_to_seg = 7'b0000000; // blank/off
            endcase
        end
    endfunction

    assign seg = digit_to_seg(digit);
    assign dp = 1'b1; // Decimal Point OFF

endmodule
