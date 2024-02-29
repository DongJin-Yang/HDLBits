module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
	parameter LEFT = 0, RIGHT = 1, FALL_L = 2, FALL_R = 3, DIG_L = 4, DIG_R = 5;
    reg [2:0]state, next;
    
    always @ (*) begin
        case(state)
            LEFT : begin
                if(!ground) next = FALL_L;
                else if(dig) next = DIG_L;
                else next = bump_left ? RIGHT : LEFT;
            end
            RIGHT : begin
                if(!ground) next = FALL_R;
                else if(dig) next = DIG_R;
                else next = bump_right ? LEFT : RIGHT;
            end
            FALL_L : begin
                if(!ground) next = FALL_L;
                else next = LEFT;
            end
            FALL_R : begin
                if(!ground) next = FALL_R;
                else next = RIGHT;
            end
            DIG_L : begin
                if(!ground) next = FALL_L;
                else next = DIG_L;
            end
            DIG_R : begin
                if(!ground) next = FALL_R;
                else next = DIG_R;
            end
        endcase
    end
    
    always @ (posedge clk, posedge areset) begin
        if(areset) state <= LEFT;
        else state <= next;
    end
    
    always @ (*) begin
        case(state)
            LEFT : begin
                walk_left  = 1;
                walk_right = 0;
                aaah = 0;
                digging = 0;
            end
            RIGHT : begin
                walk_left  = 0;
                walk_right = 1;
                aaah = 0;
                digging = 0;
            end
            FALL_L : begin
                walk_left  = 0;
                walk_right = 0;
                aaah = 1;
                digging = 0;
            end
            FALL_R : begin
                walk_left  = 0;
                walk_right = 0;
                aaah = 1;
                digging = 0;
            end
            default : begin
                walk_left  = 0;
                walk_right = 0;
                aaah = 0;
                digging = 1;
            end
        endcase
    end
endmodule

