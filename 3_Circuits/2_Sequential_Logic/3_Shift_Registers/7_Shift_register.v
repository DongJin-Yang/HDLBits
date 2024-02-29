module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg r1, r2, r3;
    always @ (posedge clk) begin
        if(!resetn) {r1, r2, r3, out} <= 4'b0;
        else {r1, r2, r3, out} <= {in, r1, r2, r3};
    end
endmodule

