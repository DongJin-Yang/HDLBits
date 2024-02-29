module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    always @ (posedge clk) begin
        case(state)
            0 : if(a&b)   state = 1;
            1 : if(~(a|b))state = 0;
        endcase
    end
	assign q = a^b^state;
endmodule

