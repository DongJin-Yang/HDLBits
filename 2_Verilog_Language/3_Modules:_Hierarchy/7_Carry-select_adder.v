module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire cout1, cout2, cout3;
    wire [15:0] temp_sum2, temp_sum3;

    add16 add16_1(a[15:0], b[15:0], 0, sum[15:0], cout1);
    add16 add16_2(a[31:16], b[31:16], 0, temp_sum2, cout2);
    add16 add16_3(a[31:16], b[31:16], 1, temp_sum3, cout3);

    always @ (cout1, temp_sum2, temp_sum3) begin
        case(cout1)
            0 : sum[31:16] = temp_sum2;
            1 : sum[31:16] = temp_sum3;
        endcase
    end

endmodule

