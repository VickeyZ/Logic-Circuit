





# Lab4--Utilization of EDA experiment platform

<center>姓名：<u>潘子曰</u>     学号：<u>3180105354</u>     专业：<u>计算机科学与技术</u>
<center>课程名称：<u>逻辑与计算机设计基础实验</u>   同组学生姓名：<u>张佳文</u>
    <center>试验时间：<u>2019-09-26</u>    实验地点：<u>紫金港东4-509</u>  指导老师：<u>洪奇军</u>

## 1 Installation of ISE 14.4 Suite

> ### 1.1 Requirement
>
> > **Platform**: win10 (64-bit)
> > **Storage space**: 20.0GB or more
>
> ### 1.2 Download and Installation
>
> > 1. Download the ISE 14.4 suite from mirror source. Unzip the setup program. 
> > 2. Run the program `xsetup.exe`.
> > 3. Install the program by default. **Pay attention to the addition program from `Jungo` and `Xilinx`**
> > 4. When calling for selecting a MATLAB installation, click `Ok` to skip. It doesn't have much to do with MATLAB.
>
> ### 1.3 Configuration for Dealing with the Crash on Win10 (Important)
>
> > 1. Direct to the source file directory **`\...\Xilinx\14.4\ISE_DS\ISE\lib\nt64`**, find two files **`libPortabilityNOSH.dll`** and **`libPortability.dll`**.
> > 2. Rename `libPortability.dll` file **`libPortability.dll.orig`**, make a copy of `libPortabilityNOSH.dll` and rename the copy **`libPortability.dll`**.
> > 3. Copy `libPortabilityNOSH.dll` to the directory **`\...\Xilinx\14.4\ISE_DS\common\lib\nt64`**. Again find two files `libPortabilityNOSH.dll` and `libPortability.dll` under this directory. Rename `libPortability.dll` file **`libPortability.dll.orig`** and rename `libPortabilityNOSH.dll` file  **`libPortability.dll`**.
>
> ### 1.4 Get license
>
> > We can download the license file from [license download](http://www.rsdown.cn/down/167104.html). Then run the ISE suite, open `Xilinx License Configuration Manager`, click `Manage Licenses` tab, click `Load Licese...` and load the license file.



## 2 Using ISE (Based on Lamp Control Example)

> ### 2.1 Question Description
>
> > 1. Now you are required to give a solution for 3 switches controlling 1 lamp. 
> > 2. Based on question 1, now you are required to add on a time delay control. If a lamp has been light on for a while, if shall be turned off.
> >
> > For question one, we can use a truth table to define the whole control rule:
> >
> > | $S_3$ | $S_2$ | $S_1$ |  F   |
> > | :---: | :---: | :---: | :--: |
> > |   0   |   0   |   0   |  0   |
> > |   0   |   0   |   1   |  1   |
> > |   0   |   1   |   0   |  1   |
> > |   0   |   1   |   1   |  0   |
> > |   1   |   0   |   0   |  1   |
> > |   1   |   0   |   1   |  0   |
> > |   1   |   1   |   0   |  0   |
> > |   1   |   1   |   1   |  1   |
> >
> > Then we can generate the schematic from the truth table.
> >
> > ![1571742745661](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571742745661.png)
> >
> > For question two, we can solve it with the concept of sequential circuit.
>
> ### 2.2 Build a New Project
>
> > Click `File` tab ---> `New Project...`
> >
> > 1. Set the basic information according to the sheet below:
> >
> > |             Item             |            Configuration             |                            Note                            |
> > | :--------------------------: | :----------------------------------: | :--------------------------------------------------------: |
> > |             Name             | <font color=blue>LampCtrl_HDL</font> |                                                            |
> > | Location & Working Directory |       *Your own customization*       | <font color=red>must not contain any Chinese letter</font> |
> > |    Top-level source type     |     <font color=blue>HDL</font>      |                                                            |
> >
> > ​		Click `Next`.
> >
> > ![1571743022856](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571743022856.png)
> >
> > 2. Set the device and design flow according to the sheet below:
> >
> > |  Item   |          Configuration           |
> > | :-----: | :------------------------------: |
> > | Family  | <font color=blue>Kintex7</font>  |
> > | Device  | <font color=blue>XC7K160T</font> |
> > | Package |  <font color=blue>FFG676</font>  |
> > |  Speed  |    <font color=blue>-1</font>    |
> >
> > ![1571743130986](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571743130986.png)
> >
> > 3. Then we have successfully create a new project.
>
> ### 2.3 Add *verilog* Source File
>
> > First we create a *verilog* source file whose extension name is *.v* .
> >
> > * Right click the `Design` directory, click `New Source`
> > * Select `Verilog Module` as the source type. Enter file name **LampCtrl**
> > * Don't forget select `Add to Project`
> > * Keep clicking `Finish` till the file has been created and opened.
> > * Enter the source code presented below.
> >
> > ```verilog
> > `timescale 1ns / 1ps		//Define the program timescale
> > module LampCtrl(			//Declare a module
> > 	input wire clk,			//input clock signal
> > 	input wire S1,
> > 	input wire S2,
> > 	input wire S3,
> > 	output wire F
> > 	);
> > 	
> > 	parameter C_NUM = 8;	//Declare an 8-bit parameter
> > 	parameter C_MAX = 8'hFF;
> > 	reg[C_NUM-1:0] count;
> > 	wire [C_NUM-1:0] c_next;
> >  
> > 	initial begin			//Initialization
> > 		count = C_MAX;		//Set count to the maximum
> > 	end
> > 	
> > 	//button pressed
> > 	assign w=S1^S2^S3;
> > 	
> > 	//lamp logic
> > 	assign F= (count < C_MAX) ? 1'b1 : 1'b0;
> > 	//count<C_MAX F=1
> > 	//count=C_MAX F=0
> > 	
> >  //count logic
> > 	always@(posedge clk)
> > 	begin
> > 		if(w == 1'b1)
> > 			count = 0;
> > 		else if(count < C_MAX)
> > 			count = c_next;
> > 	end
> >  
> > 	//next logic
> > 	assign c_next= count + 1'b1;
> > endmodule
> > ```
>
> ### 2.4 Simulation
>
> > #### Add TBW (ModelSim Test Bench Waveform) Source Code
> >
> > This time we will add a source file whose extension name is *.tbw*.
> >
> > - `New Source`
> > - Select `Verilog Text Fixture` as the source type.
> > - Enter file name `LampCtrl_sim`
> > - Don't forget to select `Add to Project`
> > - Click `Finish`
> > - Select `Simulation` as the view in `Design` panel.
> > - Enter the source code presented below
> >
> > ```verilog
> > module LampCtrl_sim;
> >  // Inputs
> >  reg clk;
> >  reg S1;
> >  reg S2;
> >  reg S3;
> >  
> >  // Outputs
> >  wire F;
> >  
> >  // Instantiate the Unit Under Test (UUT)
> >  LampCtrl UUT(
> >      .clk(clk),
> >      .S1(S1),
> >      .S2(S2),
> >      .S3(S3),
> >      .F(F)
> >      );
> >  
> >      initial begin
> >      // Initialize Inputs
> >      clk= 0;
> >      S1 = 0;
> >      S2 = 0;
> >      S3 = 0;
> >      #600 S1 = 1;		//# means delay
> >      #20 S1 = 0;
> >      #6000 S2 = 1;
> >      #20 S2 = 0;
> >      #6000 S3 = 1;
> >      #20 S3 = 0;
> >      end
> > 
> >      always begin
> >      #10 clk= 0;
> >      #10 clk= 1;
> >      end
> > 
> > endmodule
> > ```
> >
> > #### Simulation
> >
> > - Double click `Behavioral Check Syntax` to check syntax error in your simulation source code.
> > - If no syntax error found, double click `Simulate Behavioral Model` to perform simulation. A simulator program *iSim* will be opened.
> > - Click `Zoom to Full View` <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571743454235.png" alt="1571743454235" style="zoom: 67%;" />
> > - The wave form will be like this, which means that we have already done the simulation test successfully.
> > - ![1571743348671](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571743348671.png)
>
> ### 2.5 Physical Test
>
> >  #### Create Constraints File
> >
> >  Constraint file is to assign the **pinout** and create user time sequence.
> >
> >  * Click `New Source`
> >  * Select `Implementation Constraints File` as source type
> >  * Enter name **K7**
> >  * Don't forget to select `Add to Project`
> >
> >  <font color=red>MUST DO</font>: **Modify two parameters in `LampCtrl.v` source code as following:**
> >
> >  ```verilog
> >  parameter C_NUM = 28;
> >  parameter C_MAX = 28'hFFFF_FFF;
> >  ```
> >
> >  Then write the pinout file (`K7.ucf`) as following:
> >
> >  ```vhdl
> >  NET	"clk"	LOC = AC18	| IOSTANDARD=LVCMOS18;
> >  NET	"S1"	LOC = AA10	| IOSTANDARD=LVCMOS15;
> >  NET	"S2"	LOC = AB10 	| IOSTANDARD=LVCMOS15;
> >  NET	"S3"	LOC = AA13 	| IOSTANDARD=LVCMOS15;
> >  NET	"F"		LOC = AF24 	| IOSTANDARD=LVCMOS33;	#D8
> >  ```
> >
> >  In this constraints file, `LOC` is the physical pinout, and `NET` is the corresponding variable in the project.
> >
> >  #### Generate Implementation File
> >
> >  * Click `Synthesize` in `Processes` panel
> >  * If no error stated, click `Implement Design` in `Process` panel
> >  * If still no error stated, click `Generate Programming File` to generate a *.bit* file (in project directory).
> >  * ![1571747567349](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571747567349.png)
> >
> >  #### Programming *SWORD* experiment box
> >
> >  * Connect the *SWORD* experiment box to your computer through USB cable
> >  * Switch on the power supple of *SWORD* box and turn on all the switches.
> >  * Double click `Config Target Device`
> >  * Double click `Manage Configuration Project (iMPACT)`
> >  * Double click `Boundary Scan`, a *JTAG* window will jump out.
> >  * ![1571747621900](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571747621900.png)
> >  * Right click the window, click `Initialize Chain`, the system will search for connected development board.
> >  * Right click the *xc7k160t* chip, click `Assign New Configuration File`, load the *.bit* file generated.
> >  * If asked **Attach SPI or BPI PROM**, click `No`
> >
> >  Till now, a project has been completely created. You can test on the *SWORD* experiment box. By operating on the assigned pinout switch, the light will change accordingly.
> >
> >  ![IMG_0357_Moment](C:\Users\XXX\Desktop\course\LCDF\Lab\Lab04\IMG_0357_Moment.jpg)
> >
> >  ![IMG_0357_Moment2](C:\Users\XXX\Desktop\course\LCDF\Lab\Lab04\IMG_0357_Moment2.jpg)
> >
> >  ![IMG_0357_Moment3](C:\Users\XXX\Desktop\course\LCDF\Lab\Lab04\IMG_0357_Moment3.jpg)
>
> ### 2.6 Using Schematic to Create Logic Device
>
> > First we should create a new project.
> >
> > * Click `File` then click `New Project`
> > * Similarly, name the project **LampCtrl_sch**
> > * This time, we ought to select the Top-level source type: `Schemetic`
> > * All other configuration is much the same with **Step 2.2**
>
> ### 2.7 Add a Schematic
>
> > * `New source`
> > * Select **Schematic** as the `Source Type`
> > * Enter `File name` **LampCtrl**
> > * Draw the schematic by moving the components int the `Symbol` page in the design panel  (tt will be easier to use the `Symbol Name Filter`. For example, enter **INV** and the invertor will be presented to you at the first row.)
> > * ![1571748198614](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571748198614.png)
> > * Connect all the components with the `Wire Liner` ![1571748228174](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571748228174.png)
> > * The final schematic should be like this:
> > * ![1571748424543](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571748424543.png)
>
> ### 2.7 Simulation
>
> > #### Add TBW (ModelSim Test Bench Waveform) Source Code
> >
> > The operation is the same with **Step 2.4**.
> >
> > When having create a new source file, enter the code below:
> >
> > ```verilog
> > module LampCtrl_LampCtrl_sch_tb();
> > 	// Inputs
> > 	reg S1;
> > 	reg S2;
> > 	reg S3;
> > 	
> > 	// Output
> > 	wire F;
> > 	
> > 	// Bidirs
> > 	// Instantiate the UUT
> > 	LampCtrl UUT (
> > 	.S1(S1),
> > 	.S2(S2),
> > 	.S3(S3),
> > 	.F(F)
> > 	);
> > 	// Initialize Inputs
> > 	// `ifdefauto_init
> > 	integer i;
> > 	initial begin
> > 		for(i=0;i<=8;i=i+1) begin
> > 			{S3,S2,S1} <= i;
> > 			#50;
> > 		end
> > 	end
> > // `endif
> > 
> > endmodule
> > ```
> >
> > #### Simulation
> >
> > The same with **Step 2.4**
> >
> > ![1571748856098](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571748856098.png)
> >
> > #### Another Simulation Mode
> >
> > Modify the TBW sim file, enter the code below:
> >
> > ```verilog
> > module LampCtrl_LampCtrl_sch_tb();
> >     // Inputs
> >     reg S1;
> >     reg S2;
> >     reg S3;
> >     
> >     // Output
> >     wire F;
> >     
> >     // Bidirs
> >     // Instantiate the UUT
> >     LampCtrl UUT (
> >     .S1(S1),
> >     .S2(S2),
> >     .S3(S3),
> >     .F(F)
> >     );
> >     
> >     // Initialize Inputs
> >     // `ifdefauto_init
> >     integer i;
> >     initial begin
> >     for(i=0;i<=8;i=i+1) begin
> >     {S3,S2,S1} <= i;
> >     #50;
> >     end
> >     end
> >     // `endif
> > endmodule
> > ```
> >
> > Click `Zoom to Full View`, and the wave form should be like this:
> >
> > ![1571749148727](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571749148727.png)
>
> ### 2.8 Physical Test
>
> > #### Create Constraints File
> >
> > Constraint file is to assign the **pinout** and create user time sequence.
> >
> > - Click `New Source`
> > - Select `Implementation Constraints File` as source type
> > - Enter name **K7**
> > - Don't forget to select `Add to Project`
> >
> > Then write the pinout file (`K7.ucf`) as following:
> >
> > ```vhdl
> > NET"S1"	LOC=AA10 | IOSTANDARD=LVCMOS15;	
> > NET"S2"	LOC=AB10 | IOSTANDARD=LVCMOS15;
> > NET"S3"	LOC=AA13 | IOSTANDARD=LVCMOS15;
> > NET"F"	LOC=AF24 | IOSTANDARD=LVCMOS33 ;#D8
> > ```
> >
> > In this constraints file, `LOC` is the physical pinout, and `NET` is the corresponding variable in the project.
> >
> > #### Generate Implementation File
> >
> > - Click `Synthesize` in `Processes` panel
> > - If no error stated, click `Implement Design` in `Process` panel
> > - If still no error stated, click `Generate Programming File` to generate a *.bit* file (in project directory).
> > - ![1571747567349](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571747567349.png)
> >
> > #### Programming *SWORD* experiment box
> >
> > - Connect the *SWORD* experiment box to your computer through USB cable
> > - Switch on the power supple of *SWORD* box and turn on all the switches.
> > - Double click `Config Target Device`
> > - Double click `Manage Configuration Project (iMPACT)`
> > - Double click `Boundary Scan`, a *JTAG* window will jump out.
> > - ![1571747621900](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571747621900.png)
> > - Right click the window, click `Initialize Chain`, the system will search for connected development board.
> > - Right click the *xc7k160t* chip, click `Assign New Configuration File`, load the *.bit* file generated.
> > - If asked **Attach SPI or BPI PROM**, click `No`
> >
> > Till now, a project has been completely created. You can test on the *SWORD* experiment box. By operating on the assigned pinout switch, the light will change accordingly.



## 3 Note

> ### 3.1 The General Design Process
>
> 1. Realize the project design by either **verilog code** or **schematic** or **both**.
> 2. Be sure that all the module has been properly defined and instantiated, if the instantiation doesn't fit the module design, there will be <font color=red>warning signs</font> in `Design` panel.
> 3. The final check has two ways to go. One is simulation, another is physical test. Generally you can select either way to perform your design.
>
> ### 3.2 Some Useful Functionality
>
> #### Check RTL
>
> >
> > Select the top module in `Design` Panel, double click `View RTL Schematic`
> >
> > ![1571751285116](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571751285116.png)
> >
> > Then check the RTL schematic: 
> >
> > ![1571751334556](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571751334556.png)
>
> 
>
> #### Check HDL Functional Model
>
> > Select **LampCtrl.sch**, double click `Design Utilities`, and then `View HDL Functional Model`.
> >
> > ![1571751716170](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571751716170.png)
> >
> > 