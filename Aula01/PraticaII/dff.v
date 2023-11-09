module dff (input d, rstb, clk,
        output reg q);
       
        always @ (posedge clk) begin
            if (!rstb)
                q <= 0;
            else
                q <= d;
        end
endmodule

module testDFF;
    reg d, rstb, clk;
    wire q;
    integer j;
    reg [3:0] count;
   
    dff u1 ( .d(d), .rstb(rstb), .clk(clk), .q(q));
   
    initial begin
        d <= 0;
        rstb <= 0;
        clk <= 0;
        count = 0;
       
        $monitor ("d=%0b rstb=%0b clk=%0b q=%0b", d, rstb, clk, q);

        for (j = 0; j < 10; j = j + 1) begin
            #5 clk = ~clk;
            if (j % 4 == 0) begin
                d = 0;
                rstb = 0;
            end else if (j % 4 == 2) begin
                d = 1;
                rstb = 1;
            end
            #10;
        end
    end
   
endmodule