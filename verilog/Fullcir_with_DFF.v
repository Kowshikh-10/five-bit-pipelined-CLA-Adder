`timescale 1ns / 1ns
module NAND2(input A,input B,output out);

assign out = ~(A&B);

endmodule



module NAND3(input A,input B,input C,output out);

assign out = ~(A & B & C);

endmodule


module NAND4(input A,input B,input C,input D,output out);

assign out = ~(A & B & C & D);

endmodule


module NAND5(input A,input B,input C,input D,input E,output out);

assign out = ~(A & B & C & D & E);

endmodule


module NOT(input A,output out);
assign out = ~A;
endmodule


module XOR(input A,input B,output out);
assign out = A ^ B;
endmodule





module D_FF(input D,input clk,output reg Q);
     initial Q = 1'b0;

    always @(posedge clk) begin
        Q <= D;
    end
endmodule




module Fullcir(input [4:0]A,B,input Cin,output [4:0]sum,output carry);

wire [4:0]P,G,C,Gb;

wire A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,C5;


XOR x1(.A(A[0]),.B(B[0]),.out(P[0]));
XOR x2(.A(A[1]),.B(B[1]),.out(P[1]));
XOR x3(.A(A[2]),.B(B[2]),.out(P[2]));
XOR x4(.A(A[3]),.B(B[3]),.out(P[3]));
XOR x5(.A(A[4]),.B(B[4]),.out(P[4]));

NAND2 n1(.A(A[0]),.B(B[0]),.out(Gb[0]));
NOT b1(.A(Gb[0]),.out(G[0]));

NAND2 n2(.A(A[1]),.B(B[1]),.out(Gb[1]));
NOT b2(.A(Gb[1]),.out(G[1]));

NAND2 n3(.A(A[2]),.B(B[2]),.out(Gb[2]));
NOT b3(.A(Gb[2]),.out(G[2]));

NAND2 n4(.A(A[3]),.B(B[3]),.out(Gb[3]));
NOT b4(.A(Gb[3]),.out(G[3]));

NAND2 n5(.A(A[4]),.B(B[4]),.out(Gb[4]));
NOT b5(.A(Gb[4]),.out(G[4]));


assign C[0] = Cin;
assign C[1] = G[0];

NAND2 a1(.A(G[0]),.B(P[1]),.out(A1));
NAND2 a2(.A(Gb[1]),.B(A1),.out(C[2]));

NAND2 a3(.A(G[1]),.B(P[2]),.out(A2));
NAND3 a4(.A(P[1]),.B(P[2]),.C(G[0]),.out(A3));
NAND3 a5(.A(Gb[2]),.B(A2),.C(A3),.out(C[3]));

NAND2 a6(.A(G[2]),.B(P[3]),.out(A4));
NAND3 a7(.A(P[2]),.B(P[3]),.C(G[1]),.out(A5));
NAND4 a8(.A(P[1]),.B(P[2]),.C(P[3]),.D(G[0]),.out(A6));
NAND4 a9(.A(Gb[3]),.B(A4),.C(A5),.D(A6),.out(C[4]));

NAND2 a10(.A(G[3]),.B(P[4]),.out(A7));
NAND3 a11(.A(G[2]),.B(P[3]),.C(P[4]),.out(A8));
NAND4 a12(.A(P[2]),.B(P[3]),.C(P[4]),.D(G[1]),.out(A9));
NAND5 a13(.A(P[1]),.B(P[2]),.C(P[3]),.D(P[4]),.E(G[0]),.out(A10));
NAND5 a14(.A(Gb[4]),.B(A7),.C(A8),.D(A9),.E(A10),.out(C5));

assign carry = C5;

XOR x6(.A(P[0]),.B(C[0]),.out(sum[0]));

XOR x7(.A(P[1]),.B(C[1]),.out(sum[1]));

XOR x8(.A(P[2]),.B(C[2]),.out(sum[2]));

XOR x9(.A(P[3]),.B(C[3]),.out(sum[3]));

XOR x10(.A(P[4]),.B(C[4]),.out(sum[4]));



endmodule

module Fullcir_with_DFF(input [4:0]A,B,input Cin,input clk,output [4:0]sum,output carry);

wire [4:0]A1,B1;


D_FF d1(.D(A[0]),.clk(clk),.Q(A1[0]));
D_FF d2(.D(B[0]),.clk(clk),.Q(B1[0]));

D_FF d3(.D(A[1]),.clk(clk),.Q(A1[1]));
D_FF d4(.D(B[1]),.clk(clk),.Q(B1[1]));

D_FF d5(.D(A[2]),.clk(clk),.Q(A1[2]));
D_FF d6(.D(B[2]),.clk(clk),.Q(B1[2]));

D_FF d7(.D(A[3]),.clk(clk),.Q(A1[3]));
D_FF d8(.D(B[3]),.clk(clk),.Q(B1[3]));

D_FF d9(.D(A[4]),.clk(clk),.Q(A1[4]));
D_FF d10(.D(B[4]),.clk(clk),.Q(B1[4]));



Fullcir f1(.A(A1),.B(B1),.Cin(Cin),.sum(sum),.carry(carry));




endmodule


