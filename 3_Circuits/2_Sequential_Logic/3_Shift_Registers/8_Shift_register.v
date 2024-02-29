module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF MUXDFF_1(KEY[0], KEY[3], SW[3], KEY[1], KEY[2], LEDR[3]);
    MUXDFF MUXDFF_2(KEY[0], LEDR[3], SW[2], KEY[1], KEY[2], LEDR[2]);
    MUXDFF MUXDFF_3(KEY[0], LEDR[2], SW[1], KEY[1], KEY[2], LEDR[1]);
    MUXDFF MUXDFF_4(KEY[0], LEDR[1], SW[0], KEY[1], KEY[2], LEDR[0]);
endmodule

module MUXDFF (
	input clk,
	input w, R, E, L,
	output Q);
	wire [1:0]con = {E, L};
    always @ (posedge clk) begin
        case(con)
            2'b00 : Q <= Q;
            2'b01 : Q <= R;
            2'b11 : Q <= R;
            2'b10 : Q <= w;
        endcase
    end
endmodule

