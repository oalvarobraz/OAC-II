`include "fadder.v"

module fadder2bits(input a0, a1, b0, b1, output cout, sum0, sum1);
    wire cin0, cout0;
    fadder f0 (.a(a0), .b(b0), .cin(cin0), .cout(cout0), .sum(sum0));
    fadder f1 (.a(a1), .b(b1), .cin(cout0), .cout(cout), .sum(sum1));

endmodule


module test_fadder2bits;
    
endmodule