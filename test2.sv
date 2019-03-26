module test;
  logic clk, rst, y;
  divideby3fsm2 _fsm2(clk, rst, y);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, test);
  end
  initial begin
    clk=0; rst=0;
  end
    
  always #2 clk= !clk;

  initial begin
    #1 rst=1; #1 rst=0;
    #60
    $finish;
  end
endmodule
