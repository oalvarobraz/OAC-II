module hadder(input a, b, output cout, sum);

    assign cout = (a & b);
    assign sum = (a ^ b);
    
endmodule


module testHadder;
    reg a, b;
    wire cout, sum;
    integer j;

    hadder h1 ( .a(a), .b(b), .cout(cout), .sum(sum));

    initial begin
        a <= 0;
        b <= 0;

        $monitor (" a=%0b b=%0b cout=%0b sum=%0b", a, b, cout, sum);

        for (j = 0; j < 10; j = j + 1) begin
            {a, b} = j;
            #10;
        end
    end
endmodule