module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    reg [3:0] q1, q2, q3;
    assign OneHertz = {q3==4'd9&q2==4'd9&q1==4'd9};
    assign c_enable = {q2==4'd9&q1==4'd9, q1==4'd9, 1'd1};
    bcdcount counter0 (clk, reset, c_enable[0], q1);
    bcdcount counter1 (clk, reset, c_enable[1], q2);
    bcdcount counter2 (clk, reset, c_enable[2], q3);
endmodule

