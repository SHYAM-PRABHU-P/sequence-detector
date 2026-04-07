`timescale 1ns / 1ps

module sequence_detector(
    input clk,rst,seq_in,
    output reg det
    );
    
    parameter [2:0] S1=3'd0;
    parameter [2:0] S2=3'd1;
    parameter [2:0] S3=3'd2;
    
    reg [2:0] state;
    reg [2:0] next_state;
    
    always @(*) begin
        det=1'b0;
        
        case(state)
            S1  :   if(seq_in==1'b1) begin
                        next_state=S2;
                    end
                    else begin
                        next_state=S1;
                    end
            S2  :   if(seq_in==1'b0) begin
                        next_state=S3;
                    end
                    else begin
                        next_state=S2;
                    end
            S3  :   begin 
                        if(seq_in==1'b1) begin
                            det=1'b1;
                        end 
                        next_state=S1;
                    end
        default :   begin 
                        next_state=S1; 
                    end  
        endcase
    end
    
    always @(posedge clk or negedge rst) begin
        if(!rst)
            state<=S1;
        else
            state<=next_state;
    end 
    
endmodule
