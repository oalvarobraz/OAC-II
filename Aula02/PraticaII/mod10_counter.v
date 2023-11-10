module mod10_counter (input clk, input rstn, output reg[3:0] out);
    always @(posedge clk) begin
        if (!rstn) begin
            out <= 0;
        end else begin
            if (out == 10) 
                out <= 0;
            else
                out <= out + 1;
        end
    end
endmodule


module test;
    reg clk, rstn;
    wire[3:0] out;
    
    always #2 clk = ~clk;

    mod10_counter c1 (.clk(clk), .rstn(rstn), .out(out));

    initial begin

        $monitor("clk= %0b\trstn= %0b\tout= %b\n", clk, rstn, out);
        $dumpfile("mod10_counter.vcd"); // Definindo o nome do arquivo para o gtkwave
        $dumpvars(0, test); // Fala quais variáveis eu quero enviar e qual o nome do modulo de teste

        {clk, rstn} = 0;

        #2 rstn <= 1;

        #100 $finish;

    end

endmodule