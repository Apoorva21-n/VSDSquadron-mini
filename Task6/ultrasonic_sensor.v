module ultrasonic_sensor (
    input clk,
    output reg trig,
    input echo,
    output reg [15:0] distance
);

    reg [19:0] timer;
    reg [19:0] echo_timer;
    reg measuring;

    always @(posedge clk) begin
        timer <= timer + 1;

        if (timer == 0) begin
            trig <= 1;
        end else if (timer == 10) begin
            trig <= 0;
        end

        if (echo) begin
            measuring <= 1;
            echo_timer <= echo_timer + 1;
        end else if (measuring) begin
            measuring <= 0;
            distance <= echo_timer / 58;
            echo_timer <= 0;
        end
    end
endmodule
