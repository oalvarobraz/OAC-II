`include "fadder.v"

module fadder2bits(input a0, a1, b0, b1, output cout, sum0, sum1);
    wire cin0, cout0;
    assign cin0 = 0;
    fadder f0 (.a(a0), .b(b0), .cin(cin0), .cout(cout0), .sum(sum0));
    fadder f1 (.a(a1), .b(b1), .cin(cout0), .cout(cout), .sum(sum1));

endmodule


module test_fadder2bits;
    reg a0, a1, b0, b1;
    wire cout, sum0, sum1;
    integer i;

    fadder2bits f2bits (.a0(a0), .a1(a1), .b0(b0), .b1(b1), .cout(cout), .sum0(sum0), .sum1(sum1));

    initial begin
        a0 <= 0;
        a1 <= 0;
        b0 <= 0;
        b1 <= 0;

        $monitor("numero 1: %0b%0b\nnumero 2: %0b%0b\nResultado: %0b%0b%0b\n", a1, a0, b1, b0, cout, sum1, sum0);

        
        for (i = 0;i < 16;i = i + 1) begin
            {a0, a1, b0, b1} = i;
            #10;
        end

    end
endmodule