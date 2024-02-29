module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
	parameter LEFT = 0, RIGHT = 1, FALL_L = 2, FALL_R = 3;
    reg [1:0] state, next;
    
    always @ (*) begin
        case(state)
            LEFT : begin
                if (!ground) next = FALL_L;
                else next = bump_left ? RIGHT : LEFT;
            end
            RIGHT : begin
                if(!ground) next = FALL_R;
                else next = bump_right ? LEFT : RIGHT;
            end
            FALL_L : begin
                if(ground) next = LEFT;
                else next = FALL_L;
            end
            FALL_R : begin
                if(ground) next = RIGHT;
                else next = FALL_R;
            end
        endcase
    end
    
    always @ (posedge clk, posedge areset) begin
        if(areset) state <= LEFT;
        else state <= next; 
    end
    
    always @ (*) begin
        case(state)
            LEFT: begin
                walk_left  = 1;
                walk_right = 0;
                aaah = 0;
            end
            RIGHT : begin
              	walk_left  = 0;
                walk_right = 1;
                aaah = 0;
            end
            default : begin
               	walk_left  = 0;
                walk_right = 0;
                aaah = 1;
            end
        endcase
    end
    
endmodule

