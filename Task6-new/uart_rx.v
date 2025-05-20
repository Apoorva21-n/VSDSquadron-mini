module uart_rx (
    input clk,
    input rst,
    input rx,
    output reg [3:0] data,
    output reg data_valid
);

parameter CLK_FREQ = 12000000;
parameter BAUD_RATE = 9600;
localparam CLKS_PER_BIT = CLK_FREQ / BAUD_RATE;

reg [15:0] clk_cnt = 0;
reg [3:0] bit_idx = 0;
reg [9:0] rx_shift = 0;
reg receiving = 0;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        clk_cnt <= 0;
        bit_idx <= 0;
        rx_shift <= 0;
        receiving <= 0;
        data_valid <= 0;
    end else begin
        if (!receiving && !rx) begin
            receiving <= 1;
            clk_cnt <= 0;
            bit_idx <= 0;
        end else if (receiving) begin
            clk_cnt <= clk_cnt + 1;
            if (clk_cnt == CLKS_PER_BIT) begin
                clk_cnt <= 0;
                rx_shift <= {rx, rx_shift[9:1]};
                bit_idx <= bit_idx + 1;
                if (bit_idx == 9) begin
                    data <= rx_shift[7:4]; // Only digits 0–9 expected
                    data_valid <= 1;
                    receiving <= 0;
                end
            end
        end else begin
            data_valid <= 0;
        end
    end
end

endmodule
