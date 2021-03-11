







# Lab6--Design of 7-Segment LED Display Decoder

<center>姓名：<u>潘子曰</u>     学号：<u>3180105354</u>     专业：<u>计算机科学与技术</u>
<center>课程名称：<u>逻辑与计算机设计基础实验</u>   同组学生姓名：<u>张佳文</u>
    <center>试验时间：<u>2019-10-24</u>    实验地点：<u>紫金港东4-509</u>  指导老师：<u>洪奇军</u>



## 1. Objectives & Requirements


> 1. Master the display principle of 7-segment LED.
> 2. Master the design of 7-segment LED display decoder.
> 3. Know how to control multiple LEDs.

## 2. Contents & Principles

> ### 2.1 Tasks
>
> > 1. Design hexadecimal general 7-segment display decoder circuit.
> > 2. Simulate and encapsulate *MC14495* compatible display decoder.
> > 3. Design and realize dynamically displaying 4-digit hexadecimal number.
> > 4. Design and realize statically displaying 8-digit hexadecimal number.
> > 5. Learn the HDL description method for decoder circuit.
>
> ### 2.2 Principles
>
> > #### 7-segment LED structure
> >
> > * Controlled by 8 codes. (8 parts of a digit and a point).
> > * All the **anode (or cathode)**s are connected together, and all the other nodes are for control.
> >   * Common anode: if the cathode logic level is 0 then the LED is lit on.
> >   * Common cathode: if the anode logic level is 1 then the LED is lit on.
> >
> > <img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102203924555.png" alt="image-20191102203924555" style="zoom: 67%;" />
> >
> > <img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102221833134.png" alt="image-20191102221833134" style="zoom:67%;" />
> >
> > <center>Common anode 7-segment LED</center>
> >#### Compatible MC14495 General Decoder
> > 
> >This is the truth table:
> > 
> ><img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102204149391.png" alt="image-20191102204149391" style="zoom:67%;" />
> > 
> >Thus we can construct the internal circuit of *MC14495* decoder with this truth table.
> > 
> >
> > 
> >#### Multiple 7-segment LED Display Principle
> > 
> >**Static Display**: each 7-segment LED corresponds to a display decoding circuit.
> > 
> >**Dynamic Display**: TDM (*time division multiplexing*) display
> > 
> >* Persistence of vision.
> > * **One** 7-segment LED display decoding circuit does time-sharing decoding for **each** 7-segment LED display.
> > 
> >**Control sequence**: Control the common node with clockwise signal and output the corresponding display signal respectively. (*Dynamic Scan*)
> > 
> >**4-digit 7-segment structure**:
> > 
> ><img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102215724961.png" alt="image-20191102215724961" style="zoom: 67%;" />
> > 
> >
> > 
> >#### TDM principle
> > 
> ><img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102215851753.png" alt="image-20191102215851753" style="zoom: 67%;" />
> > 
> >The circuit will output a specific control signal at each interval. And thus cause the corresponding LED light to be lit on. 
> > 
> >
> > 
> >#### 4-digit 7-segment Dynamic Display Control
> > 
> >**Dynamic scan**:
> > 
> >* The scan signal is from the counter. <font color=red>*Sequential circuit to combinational circuit*</font>.
> > * Use the circuit board clock as the counter clock, after the time signal has been converted to the  frequency, it will be transferred to the control port as the scan signal for LED.
> > * The time-frequency conversion coefficient should be proper that make your eyes comfort.
> > 
> >**Condition branch statement realization**:
> > 
> >* Use **if_them** or **case** to realize the output circuit.
> > 
> ><img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102221933392.png" alt="image-20191102221933392" style="zoom: 67%;" />
> 

## 3. Major Experiment Instruments

> |                      **Equipment**                       |
> | :------------------------------------------------------: |
> | Computer (Intel Core i5 or higher, 4GB memory or higher) |
> |                *Sword* circuit design box                |
> |        Xilinx ISE 14.4 or higher development suit        |
>
> The detail parameters about *SWORD* box are listed below:
>
> * **Core**: *Xilinx Kintex^TM-7^ Series XC7K160/325*
>   * Number: 162,240
>   * Slice: 25350
>   * Internal storage: 11.7MB
> * **Storage architecture**: *Supporting 32-bit storage architecture*
>   * 6MB SRAM (Static Random Access Memory): Supporting 32-bit Data, 16-bit TAG
>   * 512MB BDDR3 dynamic storage: Supporting 32-bit Data
>   * 32MB NOR Flash Storage: Supporting 32-bit Data
> * **Basic interface**: *Supporting basic application of microcomputer principle, SOC or microprocessor*
>   * 4×5+1 button matric
>   * 16-bit slide switch
>   * 16-bit LED
>   * 8-bit seven-segment LED
> * **Standard interface**: *Supporting the realization of basic computer systems*
>   * 12-bit VGA interface (RGB656)
>   * USB-HID (Keyboard)
> * **Communication interface**: *Supporting external storage, multimedia and customized device*
>   * MicroSD (TF)
>   * PMOD
>   * HDMI
>   * Arduino
>
> <img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191028000846060.png" alt="image-20191028000846060" style="zoom:33%;" />



## 4. Experiment Procedure

> ### Task1: Hex27Seg
>
> > Create a new project named **Hex27Seg**, select **schematic** as the `Top-level Source Type`.
> >
> > #### Design MC14495_ZJU
> >
> > Create a new schematic source named **MC14495_ZJU**. And finish it like the image below:
> >
> > <img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102222638005.png" alt="image-20191102222638005" style="zoom: 25%;" />
> >
> > Then create corresponding symbol.
> >
> > #### Simulation for MC14495_ZJU Module
> >
> > Create a `verilog fixture` type source file, and enter the code below:
> >
> > ```verilog
> > `timescale 1ns / 1ps
> > module MC14495_ZJU_MC14495_ZJU_sch_tb();
> > 
> > // Inputs
> >    reg D2;
> >    reg D1;
> >    reg D0;
> >    reg D3;
> >    reg LE;
> >    reg point;
> > 
> > // Output
> >    wire p;
> >    wire a;
> >    wire b;
> >    wire c;
> >    wire d;
> >    wire e;
> >    wire f;
> >    wire g;
> > 
> > // Instantiate the UUT
> >    MC14495_ZJU UUT (
> > 		.D2(D2), 
> > 		.D1(D1), 
> > 		.D0(D0), 
> > 		.D3(D3), 
> > 		.LE(LE), 
> > 		.point(point), 
> > 		.p(p), 
> > 		.a(a), 
> > 		.b(b), 
> > 		.c(c), 
> > 		.d(d), 
> > 		.e(e), 
> > 		.f(f), 
> > 		.g(g)
> >    );
> > // Initialize Inputs
> > 	integer i;
> > 	initial begin
> > 	
> >    for (i=0;i<=15;i=i+1) begin
> > 		#50;
> > 	   {D3, D2, D1, D0}=i;
> > 	   point = i;
> >    end
> > 	
> >    #50;
> >    i = i+1;
> > 	assign LE =1;
> > 	
> > 	end
> > endmodule
> > ```
> >
> > And check the simulation result. It should be like this:
> >
> > ![image-20191102223451776](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102223451776.png)
> >
> > #### Create Top Module
> >
> > Create a new schematic called **Hex27Seg_Sch** and finish it like this:
> >
> > ![image-20191102223026386](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102223026386.png)
> >
> > #### Physical Test
> >
> > Add a `.ucf` constraints file with the code below:
> >
> > ```vhdl
> > NET "SW[0]"	LOC=AA10	|	IOSTANDARD=LVCMOS15;
> > NET "SW[1]"	LOC=AB10	|	IOSTANDARD=LVCMOS15;
> > NET "SW[2]"	LOC=AA13	|	IOSTANDARD=LVCMOS15;
> > NET "SW[3]"	LOC=AA12	|	IOSTANDARD=LVCMOS15;
> > NET "SW[4]"	LOC=Y13	|	IOSTANDARD=LVCMOS15;
> > NET "SW[5]"	LOC=Y12	|	IOSTANDARD=LVCMOS15;
> > NET "SW[6]"	LOC=AD11	|	IOSTANDARD=LVCMOS15;
> > NET "SW[7]"	LOC=AD10	|	IOSTANDARD=LVCMOS15;
> > 
> > NET "point"	LOC=AF13	|	IOSTANDARD=LVCMOS15;
> > NET "LE"		LOC=AF10	|	IOSTANDARD=LVCMOS15;
> > 
> > NET "Buzzer"	LOC=AF24	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[0]"	LOC=AB22	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[1]"	LOC=AD24	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[2]"	LOC=AD23	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[3]"	LOC=Y21	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[4]"	LOC=W20	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[5]"	LOC=AC24	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[6]"	LOC=AC23	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[7]"	LOC=AA22	|	IOSTANDARD=LVCMOS33;
> > 
> > NET "AN[0]"	LOC=AD21	|	IOSTANDARD=LVCMOS33;
> > NET "AN[1]"	LOC=AC21	|	IOSTANDARD=LVCMOS33;
> > NET "AN[2]"	LOC=AB21	|	IOSTANDARD=LVCMOS33;
> > NET "AN[3]"	LOC=AC22	|	IOSTANDARD=LVCMOS33;
> > ```
> >
> > Then generate the programming file and download onto the circuit board.
>
> ### Task2: Hex427Seg
>
> > #### Prerequisite
> >
> > Create a new project named **Hex427Seg**. Select schematic as the `Top-level Source Type`. Copy **MC14495_ZJU.sym** and **MC14495_ZJU.sch** to the directory.
> >
> > ![image-20191102224247607](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102224247607.png)
> >
> > #### Design Dynamic Scan Module
> >
> > Create a verilog source file and name it **dispsync**. Enter the following source code:
> >
> > ```verilog
> > `timescale 1ns / 1ps
> > module dispsync(
> > 	input [1:0] Scan,
> > 	input [15:0] Hexs,
> > 	input [3:0] point,
> > 	input [3:0] LES,
> > 	output reg [3:0] Hex,
> > 	output reg LE,
> > 	output reg p,
> > 	output reg[3:0] AN
> >     );
> > 	 
> > 	always @* begin
> > 		case(Scan)
> > 			2'b00:begin Hex<=Hexs[3:0];	AN<=4'b 1110;	p<=point[0];	LE<=LES[0];end
> > 			2'b01:begin Hex<=Hexs[7:4];	AN<=4'b 1101;	p<=point[1];	LE<=LES[1];end
> > 			2'b10:begin Hex<=Hexs[11:8];	AN<=4'b 1011;	p<=point[2];	LE<=LES[2];end
> > 			2'b11:begin Hex<=Hexs[15:12];	AN<=4'b 0111;	p<=point[3];	LE<=LES[3];end
> > 		endcase
> > 	end
> > 	
> > endmodule
> > ```
> > 
> >Then create the corresponding symbol.
> > 
> >#### Design General Frequency-dividing Counter Module
> > 
> >Create a new verilog source file named **clkdiv**. Enter the source code below:
> > 
> >```verilog
> > `timescale 1ns / 1ps
> > module clkdiv(
> > 	input clk,
> > 	input rst,
> > 	output reg[31:0] clkdiv
> >  );
> >    	always @ (posedge clk or posedge rst) begin
> > 		if(rst) clkdiv<=0;
> > 		else clkdiv<=clkdiv+1'b1;
> > 	end
> > 	
> > endmodule
> > ```
> > 
> >Then create the corresponding symbol.
> > 
> >#### Design the Top Module
> > 
> >Create a new schematic source file called **Hex427Seg_sch** and finish it like the image below:
> > 
> >![image-20191102224931204](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102224931204.png)
> > 
> >#### Physical Test
> > 
> >Add the UCF constraints file and enter the source code:
> > 
> >```vhdl
> > NET "clk_100mhz"	LOC=AC18	|	IOSTANDARD=LVCMOS18;
> > NET "clk_100mhz"	TNM_NET=TM_CLK;
> > TIMESPEC TS_CLK_100M = PERIOD "TM_CLK" 10 ns HIGH 50%;
> > 
> > NET "RSTN"	LOC=W13	|	IOSTANDARD=LVCMOS18;
> > 
> > NET "SW[0]"	LOC=AA10	|	IOSTANDARD=LVCMOS15;
> > NET "SW[1]"	LOC=AB10	|	IOSTANDARD=LVCMOS15;
> > NET "SW[2]"	LOC=AA13	|	IOSTANDARD=LVCMOS15;
> > NET "SW[3]"	LOC=AA12	|	IOSTANDARD=LVCMOS15;
> > NET "SW[4]"	LOC=Y13	|	IOSTANDARD=LVCMOS15;
> > NET "SW[5]"	LOC=Y12	|	IOSTANDARD=LVCMOS15;
> > NET "SW[6]"	LOC=AD11	|	IOSTANDARD=LVCMOS15;
> > NET "SW[7]"	LOC=AD10	|	IOSTANDARD=LVCMOS15;
> > 
> > NET "SEGMENT[0]"	LOC=AB22	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[1]"	LOC=AD24	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[2]"	LOC=AD23	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[3]"	LOC=Y21	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[4]"	LOC=W20	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[5]"	LOC=AC24	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[6]"	LOC=AC23	|	IOSTANDARD=LVCMOS33;
> > NET "SEGMENT[7]"	LOC=AA22	|	IOSTANDARD=LVCMOS33;
> > 
> > NET "AN[0]"	LOC=AD21	|	IOSTANDARD=LVCMOS33;
> > NET "AN[1]"	LOC=AC21	|	IOSTANDARD=LVCMOS33;
> > NET "AN[2]"	LOC=AB21	|	IOSTANDARD=LVCMOS33;
> > NET "AN[3]"	LOC=AC22	|	IOSTANDARD=LVCMOS33;
> > ```
> > 
> >Then generate the programming file and then download it onto the circuit board.
>
> ### Task3: Hex827Seg (Expansion)
>
> > #### Prerequisite
> >
> > Create a new project named **Hex827Seg**, select schematic as the **Top-level Source Type**. Copy **MC14495_ZJU.sym**, **MC14495_ZJU.sch**, **clkdiv.v** and **clkdiv.sym** to the directory. Add the source file to the project.
> >
> > #### Add Hex2Seg and HexTo8SEG Module
> >
> > Add a new verilog module source named **Hex2Seg**. Enter the code below:
> >
> > ```verilog
> > `timescale 1ns / 1ps
> > module Hex2Seg(
> > 	input [3:0] Hex,
> > 	input point,
> > 	input flash,
> > 	input LE,
> > 	output [7:0] Segment
> >  );
> > 	
> > 	wire en = LE & flash;
> > 	
> > 	MC14495_ZJU MSEG (
> > 		.D3(Hex[3]), 
> > 		.D2(Hex[2]), 
> > 		.D1(Hex[1]), 
> > 		.D0(Hex[0]), 
> > 		
> > 		.LE(en), 
> > 		.point(point), 
> > 		 
> > 		.a(a), 
> > 		.b(b), 
> > 		.c(c), 
> > 		.d(d), 
> > 		.e(e), 
> > 		.f(f), 
> > 		.g(g),
> > 		.p(p)
> > );
> > 	
> > 	assign Segment = {a,b,c,d,e,f,g,p};
> > 
> > 
> > endmodule
> > ```
> >
> > Then add a new verilog module source file named **HexTo8SEG** and enter the source code below:
> >
> > ```verilog
> > `timescale 1ns / 1ps
> > module HexTo8SEG(
> > 	input [31:0] Hexs,
> > 	input [7:0] points,
> > 	input [7:0] LES,
> > 	input flash,
> > 	output [63:0] SEG_TXT
> >  ); 
> > 	
> > Hex2Seg HTS0(.Hex(Hexs[31:28]), .point(points[7]), .flash(flash), .LE(LES[7]), .Segment(SEG_TXT[7:0]));	
> > Hex2Seg HTS1(.Hex(Hexs[27:24]), .point(points[6]), .flash(flash), .LE(LES[6]),.Segment(SEG_TXT[15:8]));
> > Hex2Seg HTS2(.Hex(Hexs[23:20]), .point(points[5]), .flash(flash), .LE(LES[5]),.Segment(SEG_TXT[23:16]));	
> > Hex2Seg HTS3(.Hex(Hexs[19:16]), .point(points[4]), .flash(flash), .LE(LES[4]),.Segment(SEG_TXT[31:24]));
> > Hex2Seg HTS4(.Hex(Hexs[15:12]), .point(points[3]), .flash(flash), .LE(LES[3]),.Segment(SEG_TXT[39:32]));	
> > Hex2Seg HTS5(.Hex(Hexs[11:8]), .point(points[2]), .flash(flash), .LE(LES[2]),.Segment(SEG_TXT[47:40]));	
> > Hex2Seg HTS6(.Hex(Hexs[7:4]), .point(points[1]), .flash(flash), .LE(LES[1]),.Segment(SEG_TXT[55:48]));	
> > Hex2Seg HTS7(.Hex(Hexs[3:0]), .point(points[0]), .flash(flash), .LE(LES[0]),.Segment(SEG_TXT[63:56]));
> > 
> > endmodule
> > ```
> >
> > #### Add Parallel to Serial Module
> >
> > Copy **P2S.sym** from the experiment material package. And then add copy of **P2S.ngc** and **P2S_IO.v** to the project.
> >
> > This is the core module within this task, which converts parallel output to serial module. However, we cannot design this module by ourselves since we don't know the detailed design standard of the LED display circuit on the experiment board.
> >
> > #### Add UCF constraints File
> >
> > Add the following source code:
> >
> > ```vhdl
> > NET "seg_clk"	LOC=M24	|	IOSTANDARD=LVCMOS33;
> > NET "seg_clrn"	LOC=M20	|	IOSTANDARD=LVCMOS33;
> > NET "seg_sout"	LOC=L24	|	IOSTANDARD=LVCMOS33;
> > NET "SEG_PEN"	LOC=R18	|	IOSTANDARD=LVCMOS33;
> > 
> > NET "SW[0]"	LOC=AA10	|	IOSTANDARD=LVCMOS15;
> > NET "SW[1]"	LOC=AB10	|	IOSTANDARD=LVCMOS15;
> > NET "SW[2]"	LOC=AA13	|	IOSTANDARD=LVCMOS15;
> > NET "SW[3]"	LOC=AA12	|	IOSTANDARD=LVCMOS15;
> > NET "SW[4]"	LOC=Y13	|	IOSTANDARD=LVCMOS15;
> > NET "SW[5]"	LOC=Y12	|	IOSTANDARD=LVCMOS15;
> > NET "SW[6]"	LOC=AD11	|	IOSTANDARD=LVCMOS15;
> > NET "SW[7]"	LOC=AD10	|	IOSTANDARD=LVCMOS15;
> > 
> > NET "SW[8]"	LOC=AE10	|	IOSTANDARD=LVCMOS15;
> > NET "SW[9]"	LOC=AE12	|	IOSTANDARD=LVCMOS15;
> > NET "SW[10]"	LOC=AF12	|	IOSTANDARD=LVCMOS15;
> > NET "SW[11]"	LOC=AE8	|	IOSTANDARD=LVCMOS15;
> > NET "SW[12]"	LOC=AF8	|	IOSTANDARD=LVCMOS15;
> > NET "SW[13]"	LOC=AE13	|	IOSTANDARD=LVCMOS15;
> > NET "SW[14]"	LOC=AF13	|	IOSTANDARD=LVCMOS15;
> > NET "SW[15]"	LOC=AF10	|	IOSTANDARD=LVCMOS15;
> > 
> > 
> > 
> > NET "clk_100mhz"	LOC=AC18	|	IOSTANDARD=LVCMOS18;
> > NET "clk_100mhz"	TNM_NET=TM_CLK;
> > TIMESPEC TS_CLK_100M = PERIOD "TM_CLK" 10 ns HIGH 50%;
> > 
> > NET "RSTN"	LOC=W13	|	IOSTANDARD=LVCMOS18;
> > ```
> >
> > 
> >
> > Then the final hierarchy structure will be like this:
> >
> > ![image-20191103184425528](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191103184425528.png)
> >
> > Generate the programming file and test on the experiment board.

## 5. Experiment Results and Analyses

> ### Task1: Hex27Seg
>
> > With different combination of SW[0], SW[1] and SW[2], the decoding result will be presented on the small 7-segment LED screen. The content is the decoding result of 3 values of the switches.
> >
> > ![1-Disp](C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab06\1-Disp.jpg)
> >
> > <center>Display</center>
> >
> > SW[3] to SW[6] control whether the corresponding bit of numbers will be displayed on the screen.
> >
> > ![1-AN](C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab06\1-AN.jpg)
> >
> > <center>SW[3] to SW[6] control</center>
> >
> > SW[14] controls the point display.
> >
> > <img src="C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab06\1-point.JPG" alt="1-point" style="zoom:15%;" />
> >
> > <center>point</center>
> >
> > SW[15] controls the overall lighting status of the LED screen.
> >
> > <img src="C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab06\1-LE.JPG" alt="1-LE" style="zoom: 15%;" />
> >
> > <center>Light Enable</center>
> 
> ### Task2: Hex427Seg
> 
> > This time there are four numbers printed on the screen.
> >
> > <img src="C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab06\2-ALL.JPG" alt="2-ALL" style="zoom:15%;" />
>>
> > <center>Print</center>
>>
> > SW[0] to SW[3] are for controlling the point of each corresponding digit.
> >
> > ![2-point](C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab06\2-point.JPG)
> >
> > <center>point</center>
> >
> > SW[4] to SW[7] are for controlling the lighting status of each digit.
> >
> > ![2-LE](C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab06\2-LE.JPG)
> >
> > <center>light enable</center>
> 
> ### Task3: Hex827Seg (Expansion)
> 
> > The circumstance on the LED screen is much the same with the previous several tasks. That is because the scan frequency is much faster than the process frequency of our naked eyes, which makes the digits on the screen look like static.
> >
> > <img src="C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab06\8271.jpg" alt="8271" style="zoom:50%;" />
> >
> > If we toggle the switches from SW[0] to SW[7], the corresponding points will be then be controlled according to the switch status.
> >
> > ![8272](C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab06\8272.jpg)
>>
> > If we toggle the switch from SW[8] to SW[15], the display mode will be controlled according to the switch status. To be more specific, if we set certain switch to 1, then the corresponding digit will flash at a rate can be tracked by our naked eyes.
>>
> > ![8273](C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab06\8273.jpg)
> >

## 6. Discussion and Conclusion

> ### Thinking Questions
>
> 1. *How to make the most simple change to the experiment to realize **common cathode** decoding*?
>
> * We can simply rename the port of VCC **G0** and that of GND **V5**.
>
>   
>
> 2. *How to realize the display of more than 4 hexadecimal digits*?
>
> * By using wider decoder input like 4-bit or more input, which making more outputs both for light enable and display encoder (MC14495). 
>
>   
>
> 3.  *How to realize the display of special symbols like*?
>
> ![image-20191107162350405](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191107162350405.png)
>
> * By adding a new symbol encoder similar to the original encoder (MC14495), which 		translates certain input code to the 7-segment code.
>
>   
>
> 4. *How to make certain digit flash*?
>
> * Use an **AND** gate to input **LE** signal and the signal from a clock module which sends a signal at certain frequency.
>
>   
>
> 5. *How to convert some special sequential circuit to **counting & combinational circuit***?
>
> * Design a module which control different part of the circuit based on the input signal from the **counter**, thus the outcome of the circuit is then decided by both **time and current status**.
>
> 
>
> ### Conclusion
>
> I got a bit confused when trying to understand how parallel-to-serial module works before the TA taught me the principle of the serial output. 
>
> In short, parallel-to-serial is kind of mechanism that quickly displays each part of the LED one by one at a high speed.
>
> Then I got to understand so many confusions I stuck into back to my young age. For example, if we use a high-shutter-speed camera to take a photo towards to computer screen, there will be like some kind of waves of colors. That is because the serial signal is transferring and is shot by my camera.
>
> That also inspires me some other circumstance in our daily life. To sum, this experiment course most definitely enables me to understand the working principle of a screen, which I think is good for our future experiments and projects.
