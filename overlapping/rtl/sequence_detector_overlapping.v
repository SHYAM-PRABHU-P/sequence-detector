`timescale 1ns / 1ps

module sequence_detector_overlapping(
    input clk,rst,seq_in,
    output reg det
    );
    
    parameter [1:0]S1=0;
    parameter [1:0]S2=1;
    parameter [1:0]S3=2;
    
    reg [1:0]state;
    reg [1:0]next_state;
    
    always @(*) begin
        det=1'b0;
        
        case(state)
            S1  :   if(seq_in==1) begin
                        next_state=S2;
                    end
                    else begin
                        next_state=S1;
                    end
            S2  :   if(seq_in==0) begin
                        next_state=S3;
                    end
                    else begin
                        next_state=S2;
                    end
            S3  :   begin
                        if(seq_in==1) begin
                            det=1'b1;
                            next_state=S2;
                        end
                        else begin
                            next_state=S1;
                        end
                    end
       default  :   next_state=S1;
        endcase
    end
    
    always @(posedge clk or negedge rst) begin
        if(!rst)
            state<=S1;
        else
            state<=next_state;
    end
endmodule
