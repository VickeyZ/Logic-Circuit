







# Lab5--The Design and Utilization of Variable Encoder 

<center>姓名：<u>潘子曰</u>     学号：<u>3180105354</u>     专业：<u>计算机科学与技术</u>
<center>课程名称：<u>逻辑与计算机设计基础实验</u>   同组学生姓名：<u>张佳文</u>
    <center>试验时间：<u>2019-09-26</u>    实验地点：<u>紫金港东4-509</u>  指导老师：<u>洪奇军</u>


## 1. Objectives & Requirements


> 1. Gain the general knowing of the logical structure and functionality of variable encoders. 
> 2. Realize **combining function** based on variable encoders.
> 3. Master the typical utilization of variable decoder (basic method of **address decoding**).
> 4. Gain the concept of **memory addressing**.
> 5. Design the circuit module based on **schematics**.
>    * Get familiar with the **Hardware Description Language**.
>
> 6. Further knowing the **ISE platform** and **physical verification on experiment box**.

## 2. Contents & Principles

> ### 2.1 Tasks
>
> > #### Basic Tasks
> >
> > 1. Design and realize **74HC138 decoder** module with schematic.
> > 2. Realize the **lamp control** module with 74HC138 encoder.
> > 3. Write the module simulation source code.
> >
> > #### Advanced Tasks
> >
> > 4. Design $32\times 32$ bit ROM IP core.
> > 5. Use variable decoder to decode address:
> >    * Expand 4 same $8\times 16$ ROM IP cores to realize $32\times 16$ bit ROM.
>
> ### 2.2 Principles
>
> > #### General Decoding
> >
> > ```mermaid
> > graph LR
> > A[input n-bit variable]-->B(Variable Decoder)
> > B-->C[output 2^n objects]
> > ```
> >
> > A **binary decoder** is a combinational logic circuit that converts binary information from the n coded inputs to a maximum of 2n unique outputs. They are used in a wide variety of applications, including data multiplexing and data demultiplexing, seven segment displays, and memory address decoding. 
> >
> > #### 3-8 Variable Decoder Detail
> >
> > <center>Logic Functionality Table of 74LS138</center>
> >![image-20191101153029561](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191101153029561.png)
> > 
> >*ATT: The logic level of 74LS138 is negative, thus we must slightly adjust out design.*
> > 
> >#### Double 2-4 Variable Decoder
> > 
> ><center>Logic Functionality Table of 74LS139</center>
> > ![image-20191101152926721](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191101152926721.png)
> >
> > *ATT: The logic level of 74LS139 is negative, thus we must slightly adjust our design.*
> >
> > #### Realize Combinational Function with Variable Decoder
> >
> > Use **OR** gate to output all the minterms.
> >
> >  *ATT: We must use a <font color=red>**NAND**</font> gate instead of the **OR** gate, because the logic function of the modules we design is negative.*
> >
> > Take the lamp control design in experiment 1 as an example.
> >
> > ```verilog
> >module lamp_Ctr1(s1, s2, s3, F);
> > 	//Some declarations
> > 	decoder_3_8 Decoder3_8(C, B, A, G, G2A,G2B, Y);
> > 	nand node(F, Y[1], Y[2], Y[4] , Y[7]);
> > endmodule
> > ```
> > 
> > <img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191101152709025.png" alt="image-20191101152709025" style="zoom:67%;" />
> >
> > <center>Example of combinational circuit</center>
> >#### Realize Address Decoding by Variable Decoder
> > 
> ><img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191101153437116.png" alt="image-20191101153437116" style="zoom:50%;" />
> > 
> ><center>Example of memory bank</center>
> 
> ### 2.3 Note
> 
> > * The logic function of the module we use during this experiment is <font color=red>**NEGATIVE**</font>.
> > * Naming rules:
>>   * First character of the file name can **<font color=red>not</font>** be numbers;
> >   * All the variables within the project must <font color=red>**not**</font> contain any **hyphens**, instead , we can use underline.



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
>   *  Internal storage: 11.7MB
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
> ![image-20191028000846060](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191028000846060.png)



## 4. Experiment Procedure

> ### Task1: Exp14-HCT138
>
> > #### Create a new project
> >
> > * `Name`: Exp05-138Decoder
> > * `Top-level source type`: Schematic or HDL
> > * `Family`: Kintex7
> > * `Device`: XC7K150T
> > * `Package`: FFG676
> > * `Speed`: -2L
> >
> > 
> >
> > #### Create Schematic
> >
> > Enter `File name`: Decoder_38_sch. 
> >
> > Some basic skills while drawing the schematic:
> >
> > * When an input / output is needed, use this tool <img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191101155246679.png" alt="image-20191101155246679" style="zoom: 80%;" /> to **add IO marker**.
> > * Use `Tools --> Check Schematic` to check the connection.
> > * <font color=red>*ATT: `Check Schematic` will not check the logic functionality*</font>
> >
> > Finish the schematic like the following:
> >
> > ![image-20191101155037712](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191101155037712.png)
> >
> > 
> >
> > #### Create 3-8 Decoder Symbol
> >
> > * Select **Decoder_38_sch** file in `Design` panel
> >   *  <img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191101155853366.png" alt="image-20191101155853366" style="zoom:50%;" />
> > * Double click `Create Schematic Symbol` in `Process` panel.
> >   * ![image-20191101160025136](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191101160025136.png)
> > * A file with expansion name `.sym` will be created in the project directory.
> >
> > 
> >
> > #### Design 74LS138
> >
> > Create a new schematic file named **HCT138_sch**. Right click it in `work` panel, select `Set as Top Module`.
> >
> > <img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191101160344524.png" alt="image-20191101160344524" style="zoom:67%;" />
> >
> > Draw the schematic like the following:
> >
> > ![image-20191101160455995](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191101160455995.png)
> >
> > Again, create a corresponding symbol.
> >
> > 
> >
> > #### Synthesize
> >
> > Synthesize is much like what we call **complie** in C language. Select the top module (HCT138_sch.sch), then double click `Synthesize-XST` in `Process` panel.
> >
> > 
> >
> > #### Simulation
> >
> > * Right click `Design` panel, select `New Source`.
> > * Select **Verilog Test Fixture** as source type.
> > * Enter `File name`: **Decoder_test**.
> > * Click next or finish till the code page appears.
> >
> > Enter the code below:
> >
> > ```verilog
> > `timescale 1ns / 1ps
> > module HCT138_test();
> > 
> > // Inputs
> > reg A;
> > reg B;
> > reg C;
> > reg G2A;
> > reg G2B;
> > reg G;
> > 
> > // Output
> > wire Y0;
> > wire Y1;
> > wire Y2;
> > wire Y3;
> > wire Y4;
> > wire Y5;
> > wire Y6;
> > wire Y7;
> > 
> > // Bidirs
> > 
> > // Instantiate the UUT
> > HCT138_sch UUT (
> > 		.A(A), 
> > 		.B(B), 
> > 		.C(C), 
> > 		.Y0(Y0), 
> > 		.Y1(Y1), 
> > 		.Y2(Y2), 
> > 		.Y3(Y3), 
> > 		.Y4(Y4), 
> > 		.Y5(Y5), 
> > 		.Y6(Y6), 
> > 		.Y7(Y7), 
> > 		.G2A(G2A), 
> > 		.G2B(G2B), 
> > 		.G(G)
> > );
> > 	
> > // Initialize Inputs
> > 
> > 	integer i;
> > 	initial begin
> > 	// Add stimulus here	
> > 	A=0;
> > 	B=0;
> > 	C=0;
> > 
> > 	G = 1;
> > 	G2A = 0;
> > 	G2B = 0;
> > 	
> > 	#50;
> > 	for (i=0; i<=7;i=i+1) begin
> > 	{C,B,A}={C,B,A}+1;
> > 	#50;
> > 	end
> > 	assign G = 0;
> > 	assign G2A = 0;
> > 	assign G2B = 0;
> > 	#50;
> > 	assign G = 1;
> > 	assign G2A = 1;
> > 	assign G2B = 0;
> > 	#50;
> > 	assign G = 1;
> > 	assign G2A = 0;
> > 	assign G2B = 1;
> > 	#50;
> > 	end
> > 	
> > endmodule
> > ```
> >
> > 
> >
> > Then click `Simulate Behavioral Model` in the `Processes` panel. The result should be like this:
> >
> > ![Decoder Simulation](C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab05\Decoder Simulation.PNG)
> >
> > #### Add Top Module
> >
> > The final test need a top module to realize the design.
> >
> > Create a new `verilog module` file and then enter the source code below:
> >
> > ```verilog
> > `timescale 1ns / 1ps
> > module Top_HCT138(input clk_100mhz,
> > 						
> > 				input A,B,C,G,G2A,G2B,
> > 				output wire ledclk,	
> > 				output wire ledsout,		
> > 				output wire ledclrn,		
> > 				output wire LEDEN,	
> > 				output [7:0] Y,		
> > 				);
> > 
> > 	wire [31:0] Div,PD;
> > 	wire [7:0] Y;
> > 	wire ny0,ny1,ny2,ny3,ny4,ny5,ny6,ny7;
> > 	
> > 	assign clk=clk_100mhz;			
> > 
> > 	HCT138_sch M5(A,B,C,G,G2A,G2B,ny0,ny1,ny2,ny3,ny4,ny5,ny6,ny7);
> > 	assign Y=~{ny7,ny6,ny5,ny4,ny3,ny2,ny1,ny0};
> > 
> > 	clkdiv U9(.clk(clk), .clkdiv(Div));
> > 	LEDP2S #(.DATA_BITS(16),.DATA_COUNT_BITS(4),.DIR(0))
> > 		U7(.clk(clk),
> > 			.rst(rst),
> > 			.Start(Div[20]),					
> > 			.PData({8'hFF,Y}),	
> > 			.sclk(ledclk),	
> > 			.sclrn(ledclrn),	
> > 			.sout(ledsout),	
> > 			.EN(LEDEN)	
> > 			);
> > 				
> > endmodule
> > ```
> >
> > 
> >
> > #### Add Auxiliary Module
> >
> > Create a new `verilog` source named **CLK**, the source code is listed below:
> >
> > ```verilog
> > `timescale 1ns / 1ps
> > module clkdiv(input clk,
> > 			output reg [31:0] clkdiv
> > 		);
> > 	always @ (posedge clk) begin
> > 		clkdiv <= clkdiv + 1'b1;
> > 	end
> > 	
> > endmodule
> > ```
> >
> > Then right click the `Design` panel, select `Add Copy of Source`, load file **LEDP2S.ngc** and **LEDP2S_IO.v** from the experiment material.
> >
> > ![image-20191102192308367](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102192308367.png)
> >
> > #### Add constraints File (For Physical Test)
> >
> > Add `.ucf` file to assign the pinout. 
> >
> > * Right click `Design` panel, select `New Source`
> >
> > * Select `Implementation Constraints File`.
> >
> > * Enter name **HCT138**, then step to the source code page
> >
> > * Enter the source code below:
> >
> > * ```vhdl
> > #System Clock
> > 	NET "clk_100mhz"		LOC = AC18      | IOSTANDARD = LVCMOS18 ;
> > 	NET "clk_100mhz"		TNM_NET = TM_CLK ;
> > TIMESPEC TS_CLK_100M = PERIOD "TM_CLK"  10 ns HIGH 50%;
> > #74HC138
> > #SWord
> > 	NET "ledclk"			LOC = N26	| IOSTANDARD = LVCMOS33 ;
> > 	NET "ledclrn"			LOC = N24   | IOSTANDARD = LVCMOS33 ;
> > 	NET "ledsout"			LOC = M26   | IOSTANDARD = LVCMOS33 ;
> > 	NET "LEDEN"				LOC = P18   | IOSTANDARD = LVCMOS33 ;     
> > #switch
> > 	NET "A"					LOC = AA10  | IOSTANDARD = LVCMOS15 ;#SW[0]
> > 	NET "B"					LOC = AB10  | IOSTANDARD = LVCMOS15 ;#SW[1]
> > 	NET "C"					LOC = AA13  | IOSTANDARD = LVCMOS15 ;#SW[2]
> > 	#NET "SW[3]"				LOC = AA12  | IOSTANDARD = LVCMOS15 ;
> > 	#NET "SW[4]"				LOC = Y13   | IOSTANDARD = LVCMOS15 ;
> > 	NET "G"					LOC = Y12   | IOSTANDARD = LVCMOS15 ;#SW[5]
> > 	NET "G2A"				LOC = AD11  | IOSTANDARD = LVCMOS15 ;#SW[6]
> > 	NET "G2B"				LOC = AD10  | IOSTANDARD = LVCMOS15 ;#SW[7]
> > 	#NET "SW[8]"				LOC = AE10  | IOSTANDARD = LVCMOS15 ;
> > 	#NET "SW[9]"				LOC = AE12  | IOSTANDARD = LVCMOS15 ;
> > 	#NET "SW[10]"			LOC = AF12  | IOSTANDARD = LVCMOS15 ;
> > 	#NET "SW[11]"			LOC = AE8   | IOSTANDARD = LVCMOS15 ;
> > 	#NET "SW[12]"			LOC = AF8   | IOSTANDARD = LVCMOS15 ;
> > 	#NET "SW[13]"			LOC = AE13  | IOSTANDARD = LVCMOS15 ;
> > 	#NET "SW[14]"			LOC = AF13  | IOSTANDARD = LVCMOS15 ;
> > 	#NET "SW[15]"			LOC = AF10  | IOSTANDARD = LVCMOS15 ;
> > 	NET "Y[0]" 		LOC = AB26  | IOSTANDARD = LVCMOS33 ;#LED[0]
> > 	NET "Y[1]" 		LOC = W24   | IOSTANDARD = LVCMOS33 ;#LED[1]
> > 	NET "Y[2]" 		LOC = W23   | IOSTANDARD = LVCMOS33 ;#LED[2]
> > 	NET "Y[3]" 		LOC = AB25  | IOSTANDARD = LVCMOS33 ;#LED[3]
> > 	NET "Y[4]" 		LOC = AA25  | IOSTANDARD = LVCMOS33 ;#LED[4]
> > 	NET "Y[5]" 		LOC = W21   | IOSTANDARD = LVCMOS33 ;#LED[5]
> > 	NET "Y[6]" 		LOC = V21   | IOSTANDARD = LVCMOS33 ;#LED[6]
> > 	NET "Y[7]" 		LOC = W26   | IOSTANDARD = LVCMOS33 ;#LED[7]
> > 	```
> >
> > The final hierarchy structure should be like this:
> >
> > ![image-20191102192401088](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102192401088.png)
> >
> > #### Physical Test
> >
> > * Select **Top_HCT138** module in `Design` panel.
> >
> > * Double click `Generate Programming File` in `Processes` Panel, a `.bit` file will be generated after all the steps are completed.
> >
> > <img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102153913936.png" alt="image-20191102153913936" style="zoom:67%;" />
> >
> > * Double click `Manage Configuration Project (iMPACT)` option, an *ISE iMPACT* window will appear.![image-20191102154320831](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102154320831.png)
> >
> > * Double click `Boundary Scan` to be ready for searching for available experiment box.
> >
> > * Right click the white board with some tips: *Right click to Add Device or Initialize JTAG chain*. Then click `Initialize Chain`.![image-20191102154554415](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102154554415.png)
> >
> > * Right click the experiment device, select `Assign New Configuration File` and select the `.bit` file generated before to download onto the experiment suit.
> >
> > * Right click the experiment device, select `Program`.
> >
> > * Cancel all other options emerged.
> >
> > When all are done, check with the design on the experiment device.
>
> 
>
> ### Task2: Exp16-Lamp138
>
> > In this task, we are going to re-realize the lamp control design in experiment 1 with *74LS138* decoder.
> >
> > #### Prerequisite
> >
> > * Create the project with the likewise procedure before, name the project **Exp16-Lamp138**, select **schematic** as the `Top-Level Source Type`.
> >
> > <img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102163824202.png" alt="image-20191102163824202" style="zoom:50%;" />
> >
> > * copy four files from the task1 directory to the directory of this project: **Decoder_38_sch.sch**, **Decoder_38_sch.sym**, **HCT138_sch.sch** and **HCT138_sch.sym**. `.sym` files are the symbol items, with which have each `.sch` or `.v` source file corresponds.<img src="C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102170028058.png" alt="image-20191102170028058" style="zoom:50%;" />
> >
> > #### Draw the Core Schematic
> >
> > Draw the schematic as the following image.![image-20191102170345364](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102170345364.png)
> >
> > #### Write Pinout Constraints File
> >
> > Create a `.ucf` file, enter the source code below:
> >
> > ```vhdl
> > NET "F"		LOC = U21	| IOSTANDARD = LVCMOS33;
> > NET "S1"	LOC = AA10  | IOSTANDARD = LVCMOS15;
> > NET "S2"	LOC = AB10  | IOSTANDARD = LVCMOS15; #SW[1]
> > NET "S3"	LOC = AA13  | IOSTANDARD = LVCMOS15; #SW[2]
> > ```
> >
> > #### Physical Test
> >
> > Same with the procedure before, after having downloaded onto the experiment box, check with the logic functionality.
>
> 
>
> ### Task3: Design $32\times 32$ bit RAM
>
> > <font color=red>**ATT**</font>: *This is not a complete experiment that can be verified on the circuit board. We shall observe the design procedure and think about what next should be done.*
> >
> > #### Prerequisite
> >
> > Create a new project named **Exp-bonus-RAM**. Select **Schematic** as the `Top-level source type`. Then create a **schematic** file to design the **2-4 Decoder** module.
> >
> > ![image-20191102192532385](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102192532385.png)
> >
> > #### Generate $8\times 16$ bit RAM Core
> >
> > * Right click the `Design` panel, select `New Source`.
> > * Select `IP (CORE Generator & Architecture Wizard)` as the source type.
> > * Enter file name **RAM_8_16**.
> >
> > ![image-20191102192853671](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102192853671.png)
> >
> > * Click `Next`, then select `Memories & Storage Elements`->`RAMs & ROMs`->`Block Memory Generator 7.3`, click `Next`.\
> >
> > ![image-20191102193206693](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102193206693.png)
> >
> > * Configure the core parameter: **Single Port RAM**
> >
> > ![image-20191102193311374](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102193311374.png)
> >
> > * Enter `Write Width`: **16**, `Write Depth`: **8**. Select`Use ENA Pin`.
> >
> > ![image-20191102193855564](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102193855564.png)
> >
> > * Click `Next`, then click `Generate` to finish.
> >
> > The IP core array should be like this:
> >
> > ![image-20191102194044748](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102194044748.png)
> >
> > #### Draw the $32\times 32$ bit RAM Bank
> >
> > Create a schematic named **MEM_BANK**, and then draw the schematic like this:
> >
> > ![image-20191102194401359](C:\Users\Raymond-Ziyue\AppData\Roaming\Typora\typora-user-images\image-20191102194401359.png)

## 5. Experiment Results and Analyses

> ### Task1: Exp14-HCT138
>
> > **First set SW[6] at "1" while both SW[7] and SW[8] at "0". With different combination of the states of 3 switches (*SW[1], SW[2], SW[3]*), the LED light numbered with the corresponding decoded result will be turned off.** Result will be like the following.
> >
> > <img src="C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab05\HCT138.jpg" alt="HCT138" style="zoom: 35%;" />
> >
> > Then if you turn **SW[6] at "0"** or **both SW[7] and SW[8] at "1"**, all eight lights will be turned on.
> >
> > ![HCT138-2](C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab05\HCT138-2.jpg)
> >
> > Thus, we have finished the design of *74LS138* decoder and fully verified the whole logic functionality.
>
> 
>
> ### Task2: Exp16-Lamp138
>
> > When all three switches SW[1], SW[2] and SW[3] is on, the light bulb looks blue. When exactly one switch is turned off, the light bulb will look red. And still blue when exactly one switch is turned on. Finally, if you shut down all the switches, the light bulb turns red.
> >
> > <img src="C:\Users\Raymond-Ziyue\Desktop\course\LCDF\Lab\Lab05\Lamp.jpg" alt="Lamp" style="zoom: 35%;" />

## 6. Discussion and Conclusion

> There is nothing special other than getting us more familiar with using *ISE* to design a whole project. We just finish the project with the instruction. During the experiment, I concluded several useful skills:
>
> * Check all the module and source file, ISE will automatically **calculate the module and instantiation** and establish the hierarchy structure.
> * Each `.sym` file need a source file support. For example, `.sch`, `.v` or `.ngc` file. But `.ngc` is a completely encapsulated file which cannot be modified by *ISE*.
>
> Finally, about the addition task to design a memory bank. It cannot work because 4 buses are connect together, which go against the circuit design standard. **What is really needed is a 4-to-1 MUX, which will soon be seen in the future lab tasks.**
