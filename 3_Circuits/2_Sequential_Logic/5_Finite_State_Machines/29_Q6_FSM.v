module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
	parameter a = 0, b = 1, c = 2, d = 3, e = 4, f = 5;
    reg [2:0] state, next;
    
    always @ (*) begin
        case(state)
           	a : next = w ? a : b;
           	b : next = w ? d : c;
            c : next = w ? d : e;
            d : next = w ? a : f;
            e : next = w ? d : e;
            f : next = w ? d : c;
        endcase
    end
    always @ (posedge clk) begin
        if(reset) state <= a;
        else state <= next;
    end
    assign z = (state == e) || (state == f);
endmodule

