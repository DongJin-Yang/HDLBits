module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
	parameter a = 0, bh = 1, bl = 2, ch = 3, cl = 4, d = 5;
    reg [2:0] state, next;
    
    always @ (*) begin
        case(state)
            a  : next = s[1] ? bh : a;
            bh : next = s[2] ? ch : (s[1] ? bh : a);
            bl : next = s[2] ? ch : (s[1] ? bl : a);
            ch : next = s[3] ? d  : (s[2] ? ch : bl);
            cl : next = s[3] ? d  : (s[2] ? cl : bl);
            d  : next = s[3] ? d  : cl;
        endcase
    end
    always @ (posedge clk) begin
        if(reset) state <= a;
        else state <= next;
    end
    always @ (*) begin
        case(state)
            a  : {fr3, fr2, fr1, dfr} = 4'b1111;
            bh : {fr3, fr2, fr1, dfr} = 4'b0110;
            bl : {fr3, fr2, fr1, dfr} = 4'b0111;
            ch : {fr3, fr2, fr1, dfr} = 4'b0010;
            cl : {fr3, fr2, fr1, dfr} = 4'b0011;
            d  : {fr3, fr2, fr1, dfr} = 4'b0000;
        endcase
    end
endmodule

