module top_module();
	reg clk;
    initial clk = 0;
    always begin
        #5;
        clk = ~clk;
    end
    
    reg in;
    reg [2:0] s;
    wire out;
    initial begin
        in = 0;
        s = 3'h2;
        #10;
        s = 3'h6;
        #10;
        in = 1;
        s = 3'h2;
        #10;
        in = 0;
        s = 3'h7;
        #10;
        in = 1;
        s = 3'h0;
        #30;
        in = 0;
    end
    q7 tb2(clk, in, s, out);
endmodule

