module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    parameter a = 0, b = 1, c = 2, d = 3, e = 4;
    reg [2:0] state, next;
    
    always @ (*) begin
        case(y)
            a : next = x ? b : a;
            b : next = x ? e : b;
            c : next = x ? b : c;
            d : next = x ? c : b;
            e : next = x ? e : d;
        endcase
    end
    always @ (posedge clk) begin
       	state <= next;
    end
    assign Y0 = next[0];
    assign z = (y == d) || (y == e);

endmodule

