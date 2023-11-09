`include "hadder.v"

module fadder (input a, b, cin, output cout, sum);
    wire h1_cout, h1_sum, h2_cout;

    hadder h1 ( .a(a), .b(b), .cout(h1_cout), .sum(h1_sum));
    hadder h2 ( .a(h1_sum), .b(cin), .cout(h2_cout), .sum(sum));

    assign cout = h2_cout | h1_cout;
endmodule

module test_fadder;
    reg a, b, cin;
    wire cout, sum;
    integer j;

    fadder f1 ( .a(a), .b(b), .cin(cin), .cout(cout), .sum(sum));

    initial begin
        a <= 0;
        b <= 0;
        cin <= 0;

        $monitor ("a0=%0b b0=%0b cin=%0b cout=%0b sum=%0b", a, b, cin, cout, sum);

        for (j = 0; j < 10;j = j + 1) begin
            {a, b, cin} = j;
            #10;
        end

    end

endmodule