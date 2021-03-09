// Code your design here
module clock(clk1, clk2, clk);
  output clk1, clk2;
  input clk;
  reg c1, c2;
  initial begin
    c1=0;
    c2=1;
  end
  
  always @(posedge clk)
    c1 = ~c1;
  
  always @(negedge clk)
    c2= ~c2;
  
  assign clk1= clk & c1;
  assign clk2= clk & c2;
endmodule



// Code your testbench here
// or browse Examples
module test;
  reg clk;
  wire clk1, clk2;
  
  clock dut (clk1, clk2, clk);
  
  always #5 clk= ~clk;
  
  initial begin
    clk=0;
    $dumpfile("test.vcd");
    $dumpvars(0, test);
    
    #100 $finish;
  end
endmodule