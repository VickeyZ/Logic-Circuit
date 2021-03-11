`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:43:30 01/05/2020 
// Design Name: 
// Module Name:    disp_num 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module DisplaySync_MUSER_disp_num(Hexs, 
                                  LES, 
                                  Point, 
                                  Scan, 
                                  AN, 
                                  HEX, 
                                  LE, 
                                  P);

    input [15:0] Hexs;
    input [3:0] LES;
    input [3:0] Point;
    input [1:0] Scan;
   output [3:0] AN;
   output [3:0] HEX;
   output LE;
   output P;
   
   wire V0;
   wire V1;
   
   Mux4to1  XLXI_1 (.I0(Point[0]), 
                   .I1(Point[1]), 
                   .I2(Point[2]), 
                   .I3(Point[3]), 
                   .S(Scan[1:0]), 
                   .O(P));
   Mux4to1  XLXI_2 (.I0(LES[0]), 
                   .I1(LES[1]), 
                   .I2(LES[2]), 
                   .I3(LES[3]), 
                   .S(Scan[1:0]), 
                   .O(LE));
   Mux4to1b4  XLXI_3 (.I0(Hexs[3:0]), 
                     .I1({Hexs[4], Hexs[5], Hexs[6], Hexs[7]}), 
                     .I2(Hexs[11:8]), 
                     .I3(Hexs[15:12]), 
                     .S(Scan[1:0]), 
                     .O(HEX[3:0]));
   Mux4to1b4  XLXI_4 (.I0({V0, V1, V1, V1}), 
                     .I1({V1, V0, V1, V1}), 
                     .I2({V1, V1, V0, V1}), 
                     .I3({V1, V1, V1, V0}), 
                     .S(Scan[1:0]), 
                     .O(AN[3:0]));
   VCC  XLXI_5 (.P(V1));
   GND  XLXI_6 (.G(V0));
endmodule
`timescale 1ns / 1ps

module disp_num(clk, 
                Hexs, 
                LES, 
                Point, 
                rst, 
                AN, 
                Segment);

    input clk;
    input [15:0] Hexs;
    input [3:0] LES;
    input [3:0] Point;
    input rst;
   output [3:0] AN;
   output [7:0] Segment;
   
   wire [31:0] clkd;
   wire [3:0] HEX;
   wire XLXN_13;
   wire XLXN_14;
   
   DisplaySync_MUSER_disp_num  XLXI_1 (.Hexs(Hexs[15:0]), 
                                      .LES(LES[3:0]), 
                                      .Point(Point[3:0]), 
                                      .Scan(clkd[19:18]), 
                                      .AN(AN[3:0]), 
                                      .HEX(HEX[3:0]), 
                                      .LE(XLXN_14), 
                                      .P(XLXN_13));
   clkdiv  XLXI_2 (.clk(clk), 
                  .rst(rst), 
                  .clkdiv(clkd[31:0]));
   MyMc14495  XLXI_3 (.D0(HEX[0]), 
                     .D1(HEX[1]), 
                     .D2(HEX[2]), 
                     .D3(HEX[3]), 
                     .LE(XLXN_14), 
                     .Point(XLXN_13), 
                     .a(Segment[0]), 
                     .b(Segment[1]), 
                     .c(Segment[2]), 
                     .d(Segment[3]), 
                     .e(Segment[4]), 
                     .f(Segment[5]), 
                     .g(Segment[6]), 
                     .p(Segment[7]));
endmodule

