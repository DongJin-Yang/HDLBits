module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire node_1;
    wire node_2;
    wire node_3;
    
    assign node_1 = a&b;
    assign node_2 = c&d;
    assign node_3 = node_1|node_2;
    assign out = node_3;
    assign out_n = ~node_3;

endmodule

