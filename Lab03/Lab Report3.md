



# Lab3--The Function of Integrated Logical Circuit and Parameter Measurement 

<center>姓名：<u>潘子曰</u>     学号：<u>3180105354</u>     专业：<u>计算机科学与技术</u>
<center>课程名称：<u>逻辑与计算机设计基础实验</u>   同组学生姓名：<u>张佳文</u>
    <center>试验时间：<u>2019-09-26</u>    实验地点：<u>紫金港东4-509</u>  指导老师：<u>洪奇军</u>


## 1. Objectives & Requirements


> 1. Gain the general knowing of the function of logical circuit, external electrical characteristics and special utilization of logical function.
> 2. Gain the general knowing of the encapsulation of **TTL NAND** gate and the **MOS NAND** Gate and the function of the pin grid array.
> 3. Master how to measure the main parameters and static characteristics and further understand the meanings of different parameters.
> 4. Further build up the concept that time delay exists in the signal transmission.
> 5. Further know about the utilization of the the devices like oscilloscope and function generator.

## 2. Contents & Principles

> ### 2.1 Contents
>
> > 1. Testify the **NAND** logical function of the *74LS00* integrated circuit.
> > 2. Testify the **NOR** logical function of the *CD4001* integrated circuit.
> > 3. Measure the time delay $t_{pd}$ of the logical gate of *74LS00* integrated circuit.
> > 4. Measure the time delay $t_{pd}$ of the logical gate of *CD4001* integrated circuit.
> > 5. Measure the transmission characteristic and threshold level $V_{ON}$ and $V_{OFF}$ of *74LS00* integrated circuit.
>
> ### 2.2 Principles
>
> > During this experiment, we are assigned to measure the following parameters:
> >
> > | No.  |  Symbol   |            Specification            |
> > | :--: | :-------: | :---------------------------------: |
> > |  1   |   $N_o$   |         fan-out coefficient         |
> > |  2   | $V_{oH}$  |          high level output          |
> > |  3   | $V_{oL}$  |          low level output           |
> > |  4   |     \     | voltage transmission characteristic |
> > |  5   | $V_{OFF}$ |         off threshold level         |
> > |  6   | $V_{ON}$  |         on threshold level          |
> > |  7   |     \     |           noise immunity            |
> > |  8   | $t_{pd}$  |   average transmission time delay   |
> > |  9   | $I_{iL}$  |       low level input current       |
> > |  10  | $I_{iH}$  |      high level input current       |
> > |  11  | $P_{ON}$  |       no-load conduction loss       |
> > |  12  | $P_{OFF}$ |        no-load cut-off loss         |
> >
> > Some key parameter descriptions are presented below:
> >
> > #### Voltage Transmission Characteristic
> >
> > > Voltage transmission characteristic is the relation of how output voltage change according to different input voltage. It clearly presents us that the logical gate transition is a continuous process.
> > >
> > > <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571238064227.png" alt="1571238064227" style="zoom: 80%;" />
> > >
> > > **$V_{OFF}$ of *74LS00* NAND gate**: The input voltage when the output voltage decrements to the lowest high level ($2.4V$).
> > >
> > > **$V_{ON}$ of *74LS00* NAND gate**: The input voltage when the output voltage decrements to the highest low level ($0.4V$).
> >
> > #### Average Transmission Time Delay $t_{pd}$
> >
> > > Transmission time delay is a dynamic parameter. It includes two part:
> > >
> > > * The time lag $t_{PHL}$ from high level to low level
> > > * The time lag $t_{PLH}$ from low level to high level
> > >
> > > <img src="C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571238800718.png" alt="1571238800718" style="zoom: 80%;" />
> > >
> > > The average transmission time delay generally takes the middle point of the maximum and minimum voltage as the time reference point, calculating the average value after measuring $t_{PHL}$ and $t_{PLH}$.
> > >
> > > $t_{pd}=(t_{PHL}+t_{PLH})/2$
> > >
> > > In order to raise the measurement accuracy, we calculate the transmission time delay on the oscillation circuit: assuming the time delay of each gate is all same, thus the oscillation period $T=6t_{pd}$, $t_{pd}=T/6$.
> > >
> > > ![1571242142417](C:\Users\XXX\AppData\Roaming\Typora\typora-user-images\1571242142417.png)
>
> ### 2.3 Note
>
> > Pay attention: it is allowed to customize the number of the gates constructing the oscillation circuit only if the number ought to be odd (or it won't cause a level transmission).

## 3. Major Experiment Instruments

> | **Qty** |           **Equipment**            |
> | :-----: | :--------------------------------: |
> |    1    | Digital oscilloscope *RIGOL-DS162* |
> |    1    |         Digital Multimeter         |
> |    1    |     *Sword* circuit design box     |
> |    1    |     2-input NAND gate *74LS00*     |
> |    1    |     2-input NOR gate *CD4001*      |
> |    1    |     $4.7K\Omega$ potentiometer     |
> |    1    |   $100\Omega\ /\ 1KW$ resistance   |

## 4. Experiment Procedure

> ### Testify the **NAND** logical function of the *74LS00* integrated circuit
>
> > 1. Insert the *74LS00* chip into the IC hub in the experiment box (pay attention to the direction of the chip).
> > 2. Construct the circuit according to the diagram, connect $V_{CC}$ to 5V source.
> > 3. The logic level will be generated from switch $S14/S15/S16/S17$.
> > 4. Traverse the input A and B by sequence of truth table and measure the input and output voltage.
>
> ### Testify the **NOR** logical function of the *CD4001* integrated circuit
>
> > 1. Insert the *CD4001* chip into the IC hub in the experiment box (pay attention to the direction of the chip).
> > 2. Construct the circuit according to the diagram, connect $V_{CC}$ to 5V source.
> > 3. The logic level will be generated from switch $S14/S15/S16/S17$.
> > 4. Traverse the input A and B by sequence of truth table and measure the input and output voltage.
> > 5. Redo procedure 3~4, check the functionality of the other 3 gates.
>
> ### Measure the time delay $t_{pd}$ of the logical gate of *74LS00* integrated circuit
>
> > 1. Insert the *74LS00* chip into the IC hub in the experiment box (pay attention to the direction of the chip).
> > 2. Construct the circuit according to the diagram, connect $V_{CC}$ to 5V source.
> > 3. Connect the oscilloscope to one of the input or output terminal of the oscillator.
> > 4. Adjust the frequency, measure the wave shape of $V_o$, period $T$ and calculate $t_{pd}$ (generally $30\sim 60ns$)
> >
> > **Note**: *one of the pins of each NAND gate ought to be connected to the high level, the other pins should be in series*.
>
> ### Measure the time delay $t_{pd}$ of the logical gate of *CD4001* integrated circuit
>
> > 1. Insert the *CD4001* chip into the IC hub in the experiment box (pay attention to the direction of the chip).
> > 2. Construct the circuit according to the diagram, connect $V_{CC}$ to 5V source.
> > 3. Connect the oscilloscope to one of the input or output terminal of the oscillator.
> > 4. Adjust the frequency, measure the wave shape of $V_o$, period $T$ and calculate $t_{pd}$ (generally $500\sim 1000ns$)
> >
> > **Note**: *one of the pins of each NOR gate ought to be connected to the ground, the other pins should be in series*.
>
> ### Measure the transmission characteristic and threshold level $V_{ON}$ and $V_{OFF}$ of *74LS00* integrated circuit
>
> > 1. Insert the *CD4001* chip into the IC hub in the experiment box (pay attention to the direction of the chip).
> > 2. Construct the circuit according to the diagram.
> > 3. Connect the DC voltmeter to the terminal A and the output terminal $2Y$ of the **NAND** gate.
> > 4. Adjust the potentiometer W from terminal b to a slowly, observe $V_i$, $V_o$ and make a record.
> > 5. Plot the curve according to the data and find out $V_{ON}$ and $V_{OFF}$.

## 5. Experiment Results and Analyses

> ### Testify the **NAND** logical function of the *74LS00* integrated circuit
>
> > ![NAND](C:\Users\XXX\Desktop\course\LCDF\Lab\Lab03\NAND.jpg)
> >
> > I got the result as the following sheet presents:
> >
> > | $V_B(V)$ | $V_A(V)$ | $V_F(V)$ |
> > | :------: | :------: | :------: |
> > |   0.00   |   0.0    |   4.8    |
> > |   5.12   |   0.0    |   4.7    |
> > |   0.00   |   4.6    |   4.8    |
> > |   5.18   |   4.6    |   0.0    |
> >
> > Clearly the NAND logic functionality has been verified.
>
> ### Testify the **NOR** logical function of the *CD4001* integrated circuit
>
> > ![NOR](C:\Users\XXX\Desktop\course\LCDF\Lab\Lab03\NOR.jpg)
> >
> > The result is presented in the following sheet:
> >
> > | $V_B(V)$ | $V_A(V)$ | $V_F(V)$ |
> > | :------: | :------: | :------: |
> > |   4.92   |   0.0    |   0.7    |
> > |   0.00   |   4.6    |   0.7    |
> > |   0.00   |   0.0    |   4.0    |
> > |   4.97   |   4.6    |   1.7    |
> >
> > **ATT**: It is worth noticing that 3 output voltages are greater than the maximum low level voltage according to the TTL standard.
> >
> > The experiment material is over dated that some devices (like the diodes inside the chip) have been aging, which arouses the increment of the resistance inside the chip or the circuit board.
>
> ### Measure the time delay $t_{pd}$ of the logical gate of *74LS00* integrated circuit
>
> > ![74LS00](C:\Users\XXX\Desktop\course\LCDF\Lab\Lab03\74LS00.jpg)
> >
> > The wave form is presented in the figure.
> >
> > $T=8(div)\times 10.00(ns/div)=80.00(ns)$, $t_{pd}=T/6=13.33(ns)$
>
> ### Measure the time delay $t_{pd}$ of the logical gate of *CD4001* integrated circuit
>
> > ![CD4001](C:\Users\XXX\Desktop\course\LCDF\Lab\Lab03\CD4001.jpg)
> >
> > $T=2.9(div)\times 100.0(ns/div)=290.0(ns)$, $t_{pd}=T/6=48.33(ns)$
>
> ### Measure the transmission characteristic and threshold level $V_{ON}$ and $V_{OFF}$ of *74LS00* integrated circuit
>
> > All the data are listed below.
> >
> > | $V_{in}$ | $V_{out}$ |
> > | :------: | :-------: |
> > |   0.20   |   4.93    |
> > |   ...    |    ...    |
> > |   2.20   |   4.93    |
> > |   2.40   |   3.65    |
> > |   2.60   |   3.08    |
> > |   2.80   |   2.97    |
> > |   3.00   |   2.83    |
> > |   3.20   |   2.69    |
> > |   3.40   |   2.53    |
> > |   3.60   |   2.33    |
> > |   3.80   |   2.06    |
> > |   4.00   |   0.02    |
> > |   4.20   |   0.02    |
> > |   4.40   |   0.02    |
> > |   4.44   |   0.01    |
> >
> > I've fit the curve with *python* and *matplotlib*. The voltage transfer curve for the NAND gate is presented below. 
> >
> > ![Figure_1](C:\Users\XXX\Desktop\course\LCDF\Lab\Lab03\Figure_1.png)
> >
> > According to the curve, $V_{OFF}=3.53V$, $V_{ON}=3.96V$.
> >
> > **It is quite obviously that 

## 6. Discussion and Conclusion

> During this experiment, I've reviewed on the utilization of the digital oscilloscope and the logic circuit. We learned the concept of voltage transmission characteristic and time delay.
>
> But we've met some problems and confusions:
>
> 1. The output voltage of low logic level of *CD4001* is a bit of higher than the maximum voltage defined in TTL standard.
> 2. The transmission delay of both the *74LS00* and *CD4001* gate is lower than the reference value. 
>
> However, we can't find out the exact reason for these uncommon sense since we haven't learned enough electric-concerned knowledge. Out conjectural perspective is that the first problem is aroused by some aging inside the chip or circuit board. And maybe we are using some different chip models so that their time delay is much smaller, according to our Lab professor.

 