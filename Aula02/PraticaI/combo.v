module combo (input a, b, c, d, output reg o);
    always @(a or b or c or d) begin
        o <= ~((a & b) | (c ^ d));
    end
endmodule


module test;
    reg a, b, c, d;
    wire o;
    integer i;

    combo c1 (.a(a), .b(b), .c(c), .d(d), .o(o));

    initial begin
        a <= 0;
        b <= 0;
        c <= 0;
        d <= 0;

        $monitor("a: %b b: %b c: %b d: %b o: %b", a, b, c, d, o);
        $dumpfile("comb.vcd"); // Definindo o nome do arquivo para o gtkwave
        $dumpvars(0, test); // Fala quais variáveis eu quero enviar e qual o nome do modulo de teste

        for (i = 0;i < 16 ;i = i + 1) begin
            {a, b, c, d} = i;
            #10;
        end
    end

    

endmodule