module test;
  logic clk, rst, Ta, Tb;
  logic [1:0] La, Lb;
  fsm1 _fsm1(clk, rst, Ta, Tb, La, Lb);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, test);
  end
  initial begin
    clk=0; rst=0; Ta=0; Tb=0;
  end
    
  always #2 clk= !clk;

  initial begin
    #1 rst=1; #1 rst=0;
    Ta=1; Tb=0; #3
    Ta=1; Tb=1; #4
    Ta=0; Tb=1; #4
    Ta=1; Tb=0; #4
    Ta=0; Tb=0; #4
    
    $finish;
  end
endmodule
