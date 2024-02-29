module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
	parameter a = 0, b = 1;
    reg state, next;
    
    always @ (*) begin
        case(state)
            a : next = s ? b : a;
            b : next = b;
        endcase
    end
    always @ (posedge clk) begin
        if(reset) state <= a;
        else state <= next;
    end
    
    int clk_cnt, cnt;
    
    always @ (posedge clk) begin
        if(reset || state == a) begin
            clk_cnt = 0;
            cnt = 0;
        end
        else begin
            if(clk_cnt < 3) begin
                clk_cnt += 1;
                cnt += w;
            end
            else begin
                clk_cnt = 1;
                cnt = 0;
                cnt += w;
            end
        end
    end
    assign z = (clk_cnt == 3) && (cnt == 2);
endmodule

