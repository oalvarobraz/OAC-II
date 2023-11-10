module alarme(input motorista_presente, cinto_em_uso, ignicao_ligada, output reg luz_de_advertencia);

    always @(motorista_presente or cinto_em_uso or ignicao_ligada) begin

        luz_de_advertencia <= (motorista_presente & (~cinto_em_uso) & ignicao_ligada);

    end

endmodule


module test;
    reg motorista, cinto, ignicao;
    wire luz;
    integer i;

    alarme a (.motorista_presente(motorista), .cinto_em_uso(cinto), .ignicao_ligada(ignicao), .luz_de_advertencia(luz));

    initial begin
        motorista <= 0;
        cinto <= 0;
        ignicao <= 0;

        $monitor("\nMotorista: %0b\t\tCinto: %0b\t\tIgnicao: %0b\t\tLuz de Advertencia: %0b\n", motorista, cinto, ignicao, luz);
        $dumpfile("alarm.vcd"); // Definindo o nome do arquivo para o gtkwave
        $dumpvars(0, test);

        for (i = 0; i < 8 ; i = i + 1) begin
            {motorista, cinto, ignicao} = i;
            #10;
        end

    end

endmodule