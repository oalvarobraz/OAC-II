module mux (input [3:0] A, [3:0] B, S, output reg [3:0] X);
    always @(*) begin
        X = (S == 0) ? A : B;
    end
endmodule


module testMux;
    reg [3:0] A, [3:0] B, S;
    wire [3:0] X;
    integer i;

    mux m1 (.A(A), .B(B), .S(S), .X(X));

    initial begin
        A <= 0;
        B <= 0;
        S <= 0;

        $monitor (" A=%0b B=%0b S=%0b X=%0b", A, B, S, X);

        for (i = 0;i < 10;i = i + 1) begin
            {A, B, S} = i;
            #10;
        end

    end

endmodule
