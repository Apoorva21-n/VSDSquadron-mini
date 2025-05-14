module ultrasonic_sensor(
    input wire clk,              // Clock signal
    input wire reset,            // Reset signal
    input wire trig,             // Trigger signal from FPGA
    input wire echo,             // Echo signal from sensor
    output reg [15:0] distance, // Measured distance in cm
    output reg buzzer           // Buzzer control
);

    reg [15:0] count;  // Counter for echo duration
    reg echo_state;    // State of echo signal
    reg [31:0] clk_div; // Clock divider for time measurement

    // Parameters for distance calculation (this will depend on the specific sensor)
    parameter TIME_PER_CM = 58; // Time in clock cycles per cm of distance

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            distance <= 0;
            buzzer <= 0;
            echo_state <= 0;
            clk_div <= 0;
        end else begin
            // Clock divider to simulate time
            clk_div <= clk_div + 1;
            if (clk_div == 500000) begin // Adjust to match your FPGA clock
                clk_div <= 0;
                // Trigger the ultrasonic sensor
                if (!echo_state) begin
                    trig <= 1;
                    echo_state <= 1;
                end else begin
                    trig <= 0;
                end
            end

            // Count the duration of the echo pulse
            if (echo) begin
                count <= count + 1;
            end else begin
                distance <= count / TIME_PER_CM; // Convert the count to distance (in cm)
                count <= 0;
            end
        end
    end

    // Buzzer control: Trigger buzzer if the object is within a certain distance
    always @(posedge clk) begin
        if (distance < 10) begin // Set your threshold here (e.g., 10 cm)
            buzzer <= 1;  // Activate buzzer
        end else begin
            buzzer <= 0;  // Deactivate buzzer
        end
    end
endmodule
