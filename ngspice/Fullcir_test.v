`timescale 1ns / 1ns

module Fullcir_test();

reg [4:0] A, B;
reg Cin;
wire [4:0] sum;
wire carry;

// Instantiate the DUT (Device Under Test)
Fullcir dut(.A(A), .B(B), .Cin(Cin), .sum(sum), .carry(carry));

initial begin
    // Test Case 1: 5 + 3 = 8
    A = 5'b00101;  // 5
    B = 5'b00011;  // 3
    Cin = 0;
    #10;
    $display("Test 1: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    // Test Case 2: 15 + 15 = 30
    A = 5'b01111;  // 15
    B = 5'b01111;  // 15
    Cin = 0;
    #10;
    $display("Test 2: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    // Test Case 3: 31 + 1 = 32 (overflow)
    A = 5'b11111;  // 31
    B = 5'b00001;  // 1
    Cin = 0;
    #10;
    $display("Test 3: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    // Test Case 4: 0 + 0 = 0
    A = 5'b00000;  // 0
    B = 5'b00000;  // 0
    Cin = 0;
    #10;
    $display("Test 4: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    // Test Case 5: 10 + 5 = 15
    A = 5'b01010;  // 10
    B = 5'b00101;  // 5
    Cin = 0;
    #10;
    $display("Test 5: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    // Test Case 6: 20 + 12 = 32 (overflow)
    A = 5'b10100;  // 20
    B = 5'b01100;  // 12
    Cin = 0;
    #10;
    $display("Test 6: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    // Test Case 7: 16 + 8 = 24
    A = 5'b10000;  // 16
    B = 5'b01000;  // 8
    Cin = 0;
    #10;
    $display("Test 7: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    // Test Case 8: 7 + 7 = 14
    A = 5'b00111;  // 7
    B = 5'b00111;  // 7
    Cin = 0;
    #10;
    $display("Test 8: A=%5b, B=%5b, Cin=%b => sum=%5b, carry=%b", A, B, Cin, sum, carry);
    
    $finish;
end

endmodule