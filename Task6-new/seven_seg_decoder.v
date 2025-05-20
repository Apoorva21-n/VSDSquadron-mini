module seven_seg_decoder (
    input [2:0] bin,
    output reg [6:0] seg
);
    always @(*) begin
        case (bin)
            3'd0: seg = 7'b1110111; // A
        3'd1: seg = 7'b1111111; // b
        3'd2: seg = 7'b1001110; // C
        3'd3: seg = 7'b1111110; // d
        3'd4: seg = 7'b1001111; // E
        3'd5: seg = 7'b1000111; // F
        3'd6: seg = 7'b1011111; // G
        default: seg = 7'b1111111;
        endcase
    end
endmodule
