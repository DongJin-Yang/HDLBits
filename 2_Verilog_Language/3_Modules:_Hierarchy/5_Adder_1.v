module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c_out1, c_out2;
    
    add16 add16_1(a[15:0], b[15:0], 0, sum[15:0], c_out1);
    add16 add16_2(a[31:16], b[31:16], c_out1, sum[31:16], c_out2); 
endmodule

