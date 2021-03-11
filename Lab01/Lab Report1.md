



# Lab1--The Utilization of Common Electronic Instruments 

<center>姓名：<u>潘子曰</u>     学号：<u>3180105354</u>     专业：<u>计算机科学与技术</u>
<center>课程名称：<u>逻辑与计算机设计基础实验</u>   同组学生姓名：<u>欧阳皓东</u>
    <center>试验时间：<u>2019-09-12</u>    实验地点：<u>紫金港东4-509</u>  指导老师：<u>洪奇军</u>

## 1. Objectives & Requirements

> 1. Gain the general knowing of common electronic instruments;
> 2. Understand how to use the **digital oscilloscope**, **digital signal generator (function generator)**, **DC regulated power supply**, **multimeter** and some other common electronic instruments;
> 3. Learn how to use the digital oscilloscope to measure the waveform of pulse and its parameters like amplitude and frequency;
> 4. Learn how to use the digital oscilloscope to measure the parameters of pulse time-sequence like rising and falling edge and delays;
> 5. Know how to use multimeter to measure the voltage and the judgement on whether there is an open circuit on the resistance and diode;

## 2. Contents & Principles

> ### 2.1 Contents
>
> > Set the frequency of the sine wave from the function generator to **100Hz**, **10KHz** and **100KHz** respectively and use the oscilloscope to measure the period and frequency of the signal. Verify the accuracy of the function generator;
> >
> > Set the frequency and voltage peak value of the sine wave from the function generator to **1KHz** and **4V-6V** (*the virtual value is measure under the alternating current mode by the multimeter*), use the oscilloscope to measure its amplitude. Calculate the related voltage value and compare with the virtual value.
>
> ### 2.2 Principles
>
> > <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1570369065183.png" alt="1570369065183" style="zoom: 50%;" />
>
> ### 2.3 Relevant Contents
>
> > The multimeters produced in out country is all calibrated and adjusted according to 50Hz alternating current, which means that any measurement on the AC over 50Hz can only be treated as the reference instead of the basis. The measuring error is much larger with higher frequency, and finally almost no react to extreme high frequencies.



## 3. Major Experiment Instruments

> | **Qty** |           **Equipment**            |
> | :-----: | :--------------------------------: |
> |    1    | Digital oscilloscope *RIGOL-DS162* |
> |    1    |    Function generator *YB1638*     |
> |    1    |         Digital Multimeter         |
> |    1    |     *Sword* circuit design box     |
> |  some   |      Common electronic device      |

## 4. Experiment Procedure

> ### Get knowing the basic electronic devices
>
> > By carefully reading the manual from experiment materials, we know the basic operation on the function generator, digital oscilloscope and multimeter.
> >
> > #### *YB1638* Function Generator
> >
> > > By clicking buttons where there are different frequencies printed, we can switch different range of the output frequency.
> > >
> > > We can also select a waveform from one of the triangle, rectangle and sine wave.
> > >
> > > <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1569026604524.png" alt="The function generator" title="The function generator" style="zoom:25%;" />
> >
> > #### *RIGOL-DS162* Digital Oscilloscope
> >
> > > By rotating the **scale knob**, we can adjust to the **scaling** (both vertical and horizontal) of the wave;
> > >
> > > By rotating the **position knob**, we can adjust to the **position** (both vertical and horizontal) of the frame through which we observe the wave;
> > >
> > > By clicking the **Acquire button**, we can call the acquire menu and change the **sampling pattern**;
> > >
> > > By clicking the **Display button**, we can call the display menu and change the **display pattern**;
> > >
> > > By clicking the **Measure button**, we can activate/deactivate auto-measure mode or change the parameters shown on the screen;
> > >
> > > The **Auto button** enables the oscilloscope to set automatically;
> > >
> > > <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1568994504211.png" alt="1568994504211" style="zoom:33%;" />
> > >
> > > 
>
> ### Measure the sine signal by oscilloscope
>
> > First adjust to the position and the scaling value by rotating the knob on the control panel, till the peak of sine wave is perfectly arranged on the vertex of lattices.
> >
> > Then count the number of the lattices alongside the Y axis (representing the height of the sine wave). Multiple the voltage scale value to get the amplitude.
> >
> > The formula is $Amplitude(V)=Y(div)\times Scale(V/div)$
> >
> > Next count the number of the lattices alongside the X axis (representing the wave-length of the sine wave). Multiple the period scale value to calculate the period and frequency of the wave.
> >
> > The formula is $Period(s)=X(div)\times Scale(s/div)$ and $Frequency(Hz)=1/Period(s)$
>
> ### Measure the output voltage of the *YB1638* function generator
>
> > Set the output of the function generator to $1KHz$ (Best $50Hz$), $V_{p-p}$ and $4V-6V$. Connect the function generator to the oscilloscope with the cable and measure its amplitude.
> >
> > Pin the current probe into the electrical clip and measure the amplitude with the AC range.
> >
> > Convert the effective value from the reading from the oscilloscope and compare to that from the multimeter.
> >
> > The conversion formula is $Effective\ Value(V)=V_{P-P}/2\sqrt{2}$
>
> ### Measure the parameters of the DC power supply of the *Sword* experiment box
>
> > Connect **<font color=red>red</font>** the cable into $V\Omega mA$ hub and **<font color=black>black</font>** cable into $COM$ hub on the multimeter.  
> >
> > Pin the **<font color=red>red</font>** probe into $Vcc\ 5V$ hub and the **<font color=black>black</font>** probe into $GND$ hub and switch to the DC range.
> >
> > Clamp the clips of the oscilloscope to the corresponding probe.
> >
> > Measure a group of DC power supply output.
>
> ### Verify the single directional conductivity of the diode
>
> > Connect **<font color=red>red</font>** the cable into $V\Omega mA$ hub and **<font color=black>black</font>** cable into $COM$ hub on the multimeter.  Switch the multimeter to the mode with the <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1569117284752.png" alt="Test Image" style="width:15px;display:inline"> sign. Stick the two electric pins into two hubs of the diode. If the reading on the screen is a digit between 0.6 and 0.7, then the diode is turned-on. The red cable is connected to the positive electrode and the black is negative electrode. And the digit is the voltage of **PN** node.
> >
> > If the digit is <font color=red>*1.*</font>, the diode is cut-off. The red cable is connected to the negative electrode and the black is positive electrode.



## 5. Experiment Results and Analyses

> ### Measure the sine signal by oscilloscope
>
> > |                        | **output of the function generator** | **reading from the oscilloscope ** |    **scale**     |   **virtual value**    |
> > | :--------------------: | :----------------------------------: | :--------------------------------: | :--------------: | :--------------------: |
> > | **peak-to-peak value** |               $4.16V$                |              $6.2div$              |   $670mV/div$    |        $4.154V$        |
> > |  **period/frequency**  |              $100.8Hz$               |               $5div$               |  $2.000ms/div$   |    $10ms|  100.0Hz$    |
> > | **peak-to-peak value** |               $4.08V$                |              $5.9div$              |   $680mV/div$    |        $4.01V$         |
> > |  **period/frequency**  |               $10KHz$                |               $5div$               | $20.00\mu s/div$ | $100.00\mu s|10.00KHz$ |
> > | **peak-to-peak value** |               $4.14V$                |              $6.1div$              |   $680mV/div$    |        $4.15V$         |
> > |  **period/frequency**  |               $100KHz$               |               $5div$               |   $2.000\mu s$   | $10.000\mu s|100.0KHz$ |
> >
> > <img src="C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab01\img_0992.png" alt="img_0992" style="zoom: 20%;"  />
> >
> > <center>Diagram 1 100Hz</center>
> ><img src="C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab01\img_0993.png" alt="img_0993" style="zoom: 20%;" />
> > 
> ><center>Diagram 2 10KHz</center>
> > <img src="C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab01\img_0994.png" alt="img_0994" style="zoom: 20%;" />
> >
> > <center>Diagram 3 100Khz</center>
>
> ### Measure the output voltage of the *YB1638* function generator
>
> > | **output frequency of the function generator** | **reading from the oscilloscope** | **converted effective value** | **reading from the multimeter** |
> > | :--------------------------------------------: | :-------------------------------: | :---------------------------: | :-----------------------------: |
> > |                     $1KHz$                     |        $6.1div|600mV/div$         |           $1.423V$            |            $1.335V$             |
> > |                   $50.50Hz$                    |        $5.9div|670mV/div$         |           $1.398V$            |            $1.339V$             |
> > |                    $100KHz$                    |        $6.0div|680mV/div$         |           $1.442V$            |             $1.12V$             |
> >
> > <img src="C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab01\img_0995.png" alt="img_0995" style="zoom: 20%;" />
> >
> > <center>Diagram 4 1KHz</center>
> ><img src="C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab01\img_0996.png" alt="img_0996" style="zoom: 20%;" />
> > 
> ><center>Diagram 5 50Hz</center>
> > <img src="C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab01\img_0997.png" alt="img_0997" style="zoom: 20%;" />
> >
> > <center>Diagram 6 100KHz</center>
>
> ### Measure the parameters of the DC power supply of the *Sword* experiment box
>
> > | output of the DC power supply | reading of the oscilloscope | sensitivity | **converted value** | **reading of the multimeter** |
> > | :---------------------------: | :-------------------------: | :---------: | :-----------------: | :---------------------------: |
> > |             $+5V$             |           $5Div$            | $1.00V/Div$ |       $5.00V$       |            $5.00V$            |
> >
> > <img src="C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab01\测SWORD电压.jpg" alt="测SWORD电压" style="zoom: 10%;" />
> >
> > <img src="C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab01\示波器1.jpg" alt="示波器1" style="zoom: 10%;" />
> >
> > <img src="C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab01\示波器2.jpg" alt="示波器2" style="zoom:10%;" />
>
> ### Verify the single directional conductivity of the diode
>
> > According to the experiment result, the upper electrode should be the positive one and vice versa.
> >
> > It is worth noticing that the reading when the diode is conducted is a bit of lower than what has been indicated by our experiment manual. According to the instructor, this reading is actually much reasonable and extremely close to the preset value.
> >
> > <img src="C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab01\二极管1.jpg" alt="二极管1" style="zoom:10%;" />
> >
> > <img src="C:\Users\XXX\Desktop\course\数字逻辑设计\Lab Report\Lab01\二极管2.jpg" alt="二极管2" style="zoom:10%;" />



## 6. Discussion and Conclusion

> I learned basic utilization of the digital oscilloscope and the multimeter during this experiment.
>
> What we have concluded from the experiment result is that the out reading data from the oscilloscope almost matches the virtual value during each task: the sine signal, DC power supply and *YB1638* function generator.
>
> During the experiment I met with a confusion:
>
> **Why the effective value equals the peak=to-peak value divided $\sqrt2$**. 
>
> >  From Wikipedia I found my wanted answer:
> >
> > *Effective current is the value of AC (Alternating Current) that would give the same amount of heat (energy) as that of DC (Direct Current) at the same time interval.*
> >
> > Then it make sense to divide the peak-to-peak value by $\sqrt2$ to calculate the effective current.

 

