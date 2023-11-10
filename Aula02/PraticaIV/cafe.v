module cafe (input coffe_button, money, soup_button, output reg coffee, soup);
    always @(coffe_button or money or soup_button) begin
        coffee <= (~(coffe_button & soup_button) & (coffe_button & money));
        soup <= (money & soup_button);
    end
endmodule


module test;
    reg c, m, s;
    wire coffee, soup;
    integer i;

    cafe a (.coffe_button(c), .money(m), .soup_button(s), .coffee(coffee), .soup(soup));

    initial begin
        c <= 0;
        m <= 0;
        s <= 0;

        $monitor("\Coffee Button: %0b\t\tMoney: %0b\t\tSoup Button: %0b\t\tCoffe: %0b\t\tSoup: %0b\n", c, m, s, coffee, soup);
        $dumpfile("coffee.vcd"); // Definindo o nome do arquivo para o gtkwave
        $dumpvars(0, test);

        for (i = 0; i < 8 ; i = i + 1) begin
            {c, m, s} = i;
            #10;
        end
    end
endmodule