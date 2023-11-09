module mux (input A, B, S, output reg X);
    always @(*) begin
        if (S == 0) begin
            X = A;
        end else if (S == 1) begin
            X = B;
        end
    end
endmodule


module testMux;
    reg A, B, S;
    wire X;
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