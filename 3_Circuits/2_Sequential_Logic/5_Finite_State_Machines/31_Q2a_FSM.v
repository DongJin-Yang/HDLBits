module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
	wire r1, r2, r3, g1, g2, g3;
    assign {r3, r2, r1} = r;
    assign g = {g3, g2, g1};
    
    parameter a = 0, b = 1, c = 2, d = 3;
    reg [1:0] state, next;
    
    always @ (*) begin
        case(state)
            a : next = r1 ? b : (r2 ? c : (r3 ? d : a));
            b : next = r1 ? b : a;
            c : next = r2 ? c : a;
            d : next = r3 ? d : a;
        endcase
    end
    
    always @ (posedge clk) begin
        if(!resetn) state <= a;
        else state <= next;
    end
    assign g1 = state == b;
    assign g2 = state == c;
    assign g3 = state == d;
endmodule

