

# Lab2--Basic Switch Circuit 

<center>姓名：<u>潘子曰</u>     学号：<u>3180105354</u>     专业：<u>计算机科学与技术</u>
<center>课程名称：<u>逻辑与计算机设计基础实验</u>   同组学生姓名：<u>张佳文</u>
    <center>试验时间：<u>2019-09-19</u>    实验地点：<u>紫金港东4-509</u>  指导老师：<u>洪奇军</u>

## 1. Objectives & Requirements

> 1. Gain the general knowing of basic switch circuit;
> 2. Understand the concept of turn-on and cut-off state of diode;
> 3. Construct single logic gate circuits with diodes and triodes;
> 4. Gain the understanding of the composition of the primary logic gate circuit;



## 2. Contents & Principles

> ### 2.1 Contents
>
> > Use the diode to construct an **<font color=red>AND gate</font>**, measure the input and output voltage and analyze its logic function;
> >
> > Use the diode to construct an **<font color=red>OR gate</font>**, measure the input and output voltage and analyze its logic function;
> >
> > Construct the **positive-logic <font color=red>NOT gate</font>**, measure the input and output voltage and analyze its logic function;
> >
> > Construct the **<font color=red>NAND gate</font>** with the **AND gate** and **NOT gate** completed previously, measure the input and output voltage and analyze its logic function;
> >
> > Test the **polarity** of the triode.
>
> ### 2.2 Principles
>
> > | **logic level** | **$V_{CC} (V)$** | **$V_{OH} (V)$** | **$V_{OL} (V)$** | **$V_{IH} (V)$** | **$V_{IL} (V)$** |      **remark**       |
> > | :-------------: | :--------------: | :--------------: | :--------------: | :--------------: | :--------------: | :-------------------: |
> > |     **TTL**     |       5.0        |    $\ge 2.4$     |    $\le 0.4$     |    $\ge 2.0$     |    $\le 0.8$     | Default is high level |
> > |    **LVTTL**    |       3.3        |    $\ge 2.4$     |    $\le 0.4$     |    $\ge 2.0$     |    $\le 0.8$     | when the output plug  |
> > |    **LVTTL**    |       2.5        |    $\ge 2.0$     |    $\le 0.2$     |    $\ge 1.7$     |    $\le 0.7$     |     is suspended      |
> > |    **CMOS**     |       5.0        |    $\ge 4.45$    |    $\le 0.5$     |    $\ge 3.5$     |    $\le 1.5$     |   Output impedance    |
> > |   **LVCMOS**    |       3.3        |    $\ge 3.2$     |    $\le 0.1$     |    $\ge 2.0$     |    $\le 0.7$     |     is extremely      |
> > |   **LVCMOS**    |       2.5        |    $\ge 2.0$     |    $\le 0.1$     |    $\ge 1.7$     |    $\le 0.7$     |         high          |
> > |    **RS232**    | $\pm 12\sim 15$  |   $-3\sim -15$   |    $3\sim 15$    |   $-3\sim -15$   |    $3\sim 15$    |    negative logic     |
> >
> > This is the general logic level standard. Each time we read a group of data (voltage) we judge its logic level compare to this sheet;
> >
> > More detailed circuit principle will be stated below:
> >
> > #### AND Gate
> >
> > >  Construct the circuit as the image below shows.
> > >
> > >  <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1569082305538.png" alt="1569082305538" style="zoom: 50%;" />
> > >
> > >  When each input into A, B and C is high level, all the diodes are cut off. Then the output F is high level.
> > >
> > >  When any of A, B and C is connected to the ground, the corresponding diode is turned on. Then the output F is low level.
> > >
> > >  The relationship between F and A, B, C is $F=ABC$
> >
> > #### OR Gate
> >
> > > Construct the circuit as the image below shows.
> > >
> > > <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1569109717492.png" alt="1569109717492" style="zoom: 50%;" />
> > >
> > > When each input into A, B and C is connected to the ground, the output F is low level.
> > >
> > > When any of the input into A, B and C is high level, the output F is high level.
> > >
> > > The relationship between F and A, B, C is $F=A+B+C$
> >
> > #### NOT Gate
> >
> > > Construct the circuit as the image below shows.
> > >
> > > <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1569109922475.png" alt="1569109922475" style="zoom:50%;" />
> > >
> > > When the input into A is high level, triode $T_1$ is in saturation state, $V_{CE}\approx 0.3V$, and the output F is low level.
> > >
> > > When A is connected to the ground, $I_B\approx0$, and there is nearly no voltage drop on $R_C$. Therefore, triode $T_1$ is cut off and the output F is approximately the same with $V_{CC}$, which is high level.
> >
> > #### NAND Gate
> >
> > > We join the **AND** gate with the **NOT** Gate to construct a **NAND** Gate.
> > >
> > > <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1569110430373.png" alt="1569110430373" style="zoom: 50%;" />
> > >
> > > When the input A, B and C are all connected to high level, the node $F_1$ is high level and triode $T_1$ is turned on. According to the principle of **NOT** gate, output F is low level. Otherwise, F is high level.
> > >
> > > The relationship between F and A, B, C is $F=\overline{ABC}$.
> 
> ### 2.3 Note
> 
> > Must remember that in our ***SWORD*** experiment box, the switch has been connected to the power supply and the ground, which means we don't need to construct the part of the circuit in the red frame. Or we will get another branch from the switch to the power supply. 
> > 
> > Sometimes it can cause a big mistake. For example, if you want to measure the voltage level on a switch, and since the resistance inside the ***SWORD*** experiment box is a bit of lower than what we have used in the circuit ($10K\Omega$), then we get a low level. But in fact it should be high level <font color=black>(And it does after we proceed all the experiments all again)</font>.
>



## 3. Major Experiment Instruments

> | **Qty** |           **Equipment**            |
> | :-----: | :--------------------------------: |
> |    1    | Digital oscilloscope *RIGOL-DS162* |
> |    1    |    Function generator *YB1638*     |
> |    1    |         Digital Multimeter         |
> |    1    |     *Sword* circuit design box     |
> |  some   |      Common electronic device      |
> |    3    |           Diode *IN4001*           |
> |    1    |           Triode *9013*            |
> |    1    |     Light Emitting Diode (LED)     |
> |    5    |       $10K\Omega$ resistance       |
> |    3    |      $5.1K\Omega$ resistance       |
> |    5    |       $1K\Omega$ resistance        |



## 4. Experiment Procedure

> ### AND Gate
>
> > Construct the circuit according to the image below. Be careful <font color=red>do not</font> construct the part inside the red frame.
> >
> > <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1569116037244.png" alt="1569116037244" style="zoom:50%;" />
> >
> > Connect the $V_{CC}$ with the 5V DC power supply. 
> >
> > Use the voltage meter and multimeter to measure the voltage levels of A, B and F. Verify the logic relationship between F and A, B.
>
> ### OR Gate
>
> > Construct the circuit according to the image below. Be careful <font color=red>do not</font> construct the part inside the red frame.
> >
> > <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1569116114384.png" alt="1569116114384" style="zoom:50%;" />
> >
> > Change the resistance to $0K\Omega$ and $10\Omega$ and do the experiment again.
> >
> > Use the voltage meter and multimeter to measure the voltage levels of A, B and F. Verify the logic relationship between F and A, B.
>
> ### NOT Gate
>
> > Construct the circuit according to the image below. Be careful <font color=red>do not</font> construct the part inside the red frame.
> >
> > <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1569116287825.png" alt="1569116287825" style="zoom:50%;" />
> >
> > Change the resistance to $5\Omega$ and do the experiment again.
> >
> > Use the voltage meter and multimeter to measure the voltage levels of A and F. Verify the logic relationship between F and A.
>
> ### NAND Gate
>
> > Construct the circuit according to 3 different images and do the experiment separately.
> >
> > ![1569116564109](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1569116564109.png)
> >
> > Use the voltage meter and multimeter to measure the voltage levels of A, B and F. Verify the logic relationship between F and A, B.
>
> ### **Polarity** Of the Triode
>
> > Plug the red cable of the multimeter into $V\Omega mA$ hub and the black cable into the $COM$ hub.
> >
> > First with the polarity of the triode. Switch the multimeter to the **hFE** mode. Plug the triode into the NPN hub. If there's reading on the screen then that is done. Or plug the triode into the PNP hub and recheck. Then read the **hFE value**. If the value is bigger than that's done. Or reverse the c and e anode and recheck.
> >
> > Then with the base electrode b. Switch the multimeter to the mode with the <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1569117284752.png" alt="Test Image" style="width:15px;display:inline"> sign. If the triode is **PNP type**, plug the black electric pen into one hub and plug the red into the other two respectively. If both the two hubs can be turned on, then the hub into which is plugged by the black pen is the base electrode b. If the triode is **NPN type**, plug the red electric pen into one hub and plug the black into the other two respectively. If both the two hubs can be turned on, then the hub into which is plugged by the red pen is the base electrode b. 



## 5. Experiment Results and Analyses

> ### AND Gate
>
> > | $V_A(V)$ | $V_B(V)$ | $V_F(V)$ | **Logic Level of A** | **Logic Level of B** | **Logic Level of F** |
> > | :------: | :------: | :------: | :------------------: | :------------------: | :------------------: |
> > |   0.00   |   0.0    |   0.4    |          0           |          0           |          0           |
> > |   4.98   |   0.0    |   0.4    |          1           |          0           |          0           |
> > |   0.00   |   4.8    |   0.4    |          0           |          1           |          0           |
> > |   4.96   |   4.8    |   4.7    |          1           |          1           |          1           |
> >
> > ![AND1](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\AND1.jpg)
> >
> > ![AND2](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\AND2.jpg)
>
> ### OR Gate
>
> > #### The resistance between F and the ground is <font color=red>$0K\Omega$</font>
> >
> > > | $V_A(V)$ | $V_B(V)$ | $V_F(V)$ | **Logic Level of A** | **Logic Level of B** | **Logic Level of F** |
> > > | :------: | :------: | :------: | :------------------: | :------------------: | :------------------: |
> > > |   0.0    |   0.0    |   0.0    |          0           |          0           |          0           |
> > > |   4.90   |   0.0    |   4.4    |          1           |          0           |          1           |
> > > |   0.00   |   4.7    |   4.4    |          0           |          1           |          1           |
> > > |   4.91   |   4.7    |   4.5    |          1           |          1           |          1           |
> > >
> > > ![OR1](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\OR1.jpg)
> > >
> > > ![OR2](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\OR2.jpg)
> >
> > 
> >
> > #### The resistance between F and the ground is <font color=red>$10K\Omega$</font>
> >
> > > | $V_A(V)$ | $V_B(V)$ | $V_F(V)$ | **Logic Level of A** | **Logic Level of B** | **Logic Level of F** |
> > > | :------: | :------: | :------: | :------------------: | :------------------: | :------------------: |
> > > |   0.00   |   0.0    |   0.0    |          0           |          0           |          0           |
> > > |   4.90   |   0.0    |   4.3    |          1           |          0           |          1           |
> > > |   0.00   |   4.7    |   4.2    |          0           |          1           |          1           |
> > > |   4.92   |   4.7    |   4.3    |          1           |          1           |          1           |
> > >
> > > ![OR3](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\OR3.jpg)
> > >
> > > ![OR4](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\OR4.jpg)
> >
> > #### The resistance between F and the ground is <font color=red>$20K\Omega$</font>
> >
> > > | $V_A(V)$ | $V_B(V)$ | $V_F(V)$ | **Logic Level of A** | **Logic Level of B** | **Logic Level of F** |
> > > | :------: | :------: | :------: | :------------------: | :------------------: | :------------------: |
> > > |   0.00   |   0.0    |   0.0    |          0           |          0           |          0           |
> > > |   4.90   |   0.0    |   4.2    |          1           |          0           |          1           |
> > > |   0.00   |   4.7    |   4.2    |          0           |          1           |          1           |
> > > |   4.92   |   4.8    |   4.2    |          1           |          1           |          1           |
> > >
> > > ![OR5](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\OR5.jpg)
> > >
> > > ![OR6](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\OR6.jpg)
>
> ### NOT Gate
>
> > #### The resistance between A and B is <font color=red>$10K\Omega$</font>
> >
> > > | $V_A(V)$ | $V_F(V)$ | **Logic Level of A** | **Logic Level of F** |
> > > | :------: | :------: | :------------------: | :------------------: |
> > > |   3.3    |   0.0    |          1           |          0           |
> > > |   0.0    |   4.7    |          0           |          1           |
> > >
> > > ![NOT10](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\NOT10.jpg)
> >
> > #### The resistance between A and B is <font color=red>$5K\Omega$</font>
> >
> > > | $V_A(V)$ | $V_F(V)$ | **Logic Level of A** | **Logic Level of F** |
> > > | :------: | :------: | :------------------: | :------------------: |
> > > |   2.6    |   0.0    |          1           |          0           |
> > > |   0.0    |   4.8    |          0           |          1           |
> > >
> > > **It is worth noticing that the input voltage is much close to the lower threshold value of the logical level 1, which just caused our confusion.**
> > >
> > > ![NOT5](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\NOT5.jpg)
>
> ### NAND Gate
>
> > #### $R_b$ is <font color=red>$10K\Omega$</font>,  $R_c$ is <font color=red>$5.1K\Omega$</font> and the resistance between $F_1$ and $T_1$ is <font color=red>$5.1K\Omega$</font>
> >
> > > | $V_A(V)$ | $V_B(V)$ | $V_F(V)$ | **Logic Level of A** | **Logic Level of B** | **Logic Level of F** |
> > > | :------: | :------: | :------: | :------------------: | :------------------: | :------------------: |
> > > |   0.0    |   0.00   |   4.7    |          0           |          0           |          1           |
> > > |   4.8    |   0.00   |   4.5    |          1           |          0           |          1           |
> > > |   0.0    |   4.96   |   4.5    |          0           |          1           |          1           |
> > > |   4.8    |   4.96   |   0.0    |          1           |          1           |          0           |
> > >
> > > ![NAND1](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\NAND1.jpg)
> > >
> > > ![NAND2](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\NAND2.jpg)
> >
> > #### $R_b$ is <font color=red>$10K\Omega$</font>,  $R_c$ is <font color=red>$10K\Omega$</font> and the resistance between $F_1$ and $T_1$ is <font color=red>$5.1K\Omega$</font>
> >
> > > | $V_A(V)$ | $V_B(V)$ | $V_C(V)$ | **Logic Level of A** | **Logic Level of B** | **Logic Level of F** |
> > > | :------: | :------: | :------: | :------------------: | :------------------: | :------------------: |
> > > |   0.0    |   0.00   |   4.6    |          0           |          0           |          1           |
> > > |   4.8    |   0.00   |   4.4    |          1           |          0           |          1           |
> > > |   0.0    |   4.96   |   4.5    |          0           |          1           |          1           |
> > > |   4.8    |   4.96   |   0.0    |          1           |          1           |          0           |
> > >
> > > ![NAND3](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\NAND3.jpg)
> > >
> > > ![NAND4](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\NAND4.jpg)
> >
> > #### $R_b$ is <font color=red>$15.1K\Omega$</font>,  $R_c$ is <font color=red>$5.1K\Omega$</font> and the resistance between $F_1$ and $T_1$ is <font color=red>$5.1K\Omega$</font>
> >
> > > | $V_B(V)$ | $V_B(V)$ | $V_F(V)$ | **Logic Level of A** | **Logic Level of B** | **Logic Level of F** |
> > > | :------: | :------: | :------: | :------------------: | :------------------: | :------------------: |
> > > |   0.0    |   0.00   |   4.8    |          0           |          0           |          1           |
> > > |   4.8    |   0.00   |   4.7    |          1           |          0           |          1           |
> > > |   0.0    |   4.96   |   4.7    |          0           |          1           |          1           |
> > > |   4.8    |   4.96   |   0.0    |          1           |          1           |          0           |
> > >
> > > ![NAND5](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\NAND5.jpg)
> > >
> > > ![NAND6](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\NAND6.jpg)
>
> ### Polarity Of the Triode
>
> > From the first 2 images we get to know that our triode is **NPN type** and the c and e anode is corresponded to the anodes on the multimeter.
> >
> > Then we find that the base is the anode where the red pen sticks in, in other words, the middle one.
> >
> > ![TRIODE1](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\TRIODE1.jpg)
> >
> > ![TRIODE2](C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab02\TRIODE2.jpg)
>



## 6. Discussion and Conclusion

> We build **AND**, **OR**, **NOT**, and **NAND** gates according to the experiment manual and testify all their functionalities. But when the first time we construct the circuit, we ignored that the *SWORD* box has integrate the **switch** with the **VCC power supply** and the **safeguard-resistor**. Therefore, we build the whole circuit and cause a redundancy in the circuit. At first, all the gate functionality seemed all perfect until we proceeded to the **NAND** gate. To be more specific, a voltage level is 0 while it should have been over 2.6V. We consulted our instructor and realized that we had much like done a fruitless work.
>
> Then we came back the other time and redo all the experiments. This time, we find that **all our outcomes live up to the expectance**. The only confusion is that why the input voltage is almost lower than the threshold voltage value.
>
> We think it could be that **a somehow high resistance (slightly lower than the resistance we used in the circuit) exists as the safeguard-resistor which is integrated with the switch**. And our conjectural thinking is confirmed by our instructor.

