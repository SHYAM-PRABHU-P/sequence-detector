`timescale 1ns / 1ps

module sequence_detector_overlapping_tb();
    reg clk=1;
    reg rst;
    reg seq_in;
    wire det;
    integer i=0;
    reg [15:0] msg=16'b111010111010111;
    
    sequence_detector_overlapping uut(.clk(clk),.rst(rst),.seq_in(seq_in),.det(det));
    
    always begin
        clk=~clk;#0.5;
    end
    
    initial begin
        
        
        rst=0;
        @(posedge clk); rst=1;
        for(i=0;i<16;i=i+1) begin
            @(posedge clk);
            $display("SEQUENCE:%0d,DETECTED:%0d",seq_in,det);
            seq_in=msg[i];
        end
        
       /* for(i=0;i<14;i=i+1) begin
            @(posedge clk);
            seq_in=$random;
        end
        */
         
    end
endmodule
