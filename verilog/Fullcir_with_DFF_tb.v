`timescale 1ns / 1ns

module Fullcir_with_DFF_tb();

reg [4:0] A, B;
reg Cin, clk;
wire [4:0] sum;
wire carry;


Fullcir_with_DFF dut(.A(A), .B(B), .Cin(Cin), .clk(clk), .sum(sum), .carry(carry));


initial begin
    clk = 0;
    forever #5 clk = ~clk;  
end

initial begin
    $dumpfile("output.vcd");
    $dumpvars(0, Fullcir_with_DFF_tb);
    
    Cin = 0;  
    
    
    A = 5'b00101;  
    B = 5'b00011;  
    #10;  
    #10;  
    $display("Test 1: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    

    A = 5'b01111;  
    B = 5'b01111; 
    #10;
    #10;
    $display("Test 2: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    
    A = 5'b11111;  
    B = 5'b00001;  
    #10;
    #10;
    $display("Test 3: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    

    A = 5'b00000;  
    B = 5'b00000; 
    #10;
    #10;
    $display("Test 4: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    
    A = 5'b01010;  
    B = 5'b00101;  
    #10;
    #10;
    $display("Test 5: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    
    A = 5'b10100;  
    B = 5'b01100;  
    #10;
    #10;
    $display("Test 6: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    A = 5'b10000;
    B = 5'b01000;  
    #10;
    #10;
    $display("Test 7: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    

    A = 5'b00111; 
    B = 5'b00111; 
    #10;
    #10;
    $display("Test 8: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    $finish;
end

endmodule