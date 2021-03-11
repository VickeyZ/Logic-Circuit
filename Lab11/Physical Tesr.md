

**Step 2**: Check the values. (Set `WE` to 0)

|     Binary Code     | Hexadecimal Code |                Behavior                 |
| :-----------------: | :--------------: | :-------------------------------------: |
| xx00 xxxx x000 x001 |       0001       | Check the output of **Reg[0] & Reg[1]** |
| xx00 xxxx x010 x011 |       0023       | Check the output of **Reg[2] & Reg[3]** |
| xx00 xxxx x100 x101 |       0045       | Check the output of **Reg[4] & Reg[5]** |
| xx00 xxxx x110 x111 |       0067       | Check the output of **Reg[7] & Reg[8]** |

**Step3**: Set the following parameters:

* SW[4:2] = 010
* Ai = 3D
* Binary Code of Bi: xx01 x000 x000 x000
* Hexadecimal Code of Bi: 1000
* Behavior: Write 3D into reg[0], while Addr_B and Addr_A are both reg[0]



**Step4**: Set the following parameters:

* SW[4:2] = 010 (Add)
* Binary Code of Bi: xx11 x001 x001 x000
* Hexadecimal Code of Bi: 3110
* Behavior: Add the value from Reg[0] and from Reg[0] then write the result (7A) into Reg[1]. Addr_B is Reg[1], Addr_A is Reg[0].



**Step5**: Set the following parameters:

* SW[4:2] = 110
* Ai = ABCD EF00
* Binary Code of Bi: xx01 x010 x000 x010
* Hexadecimal Code of Bi: 1202
* Behavior: Ai - Reg[1] and store the result (ABCDEE86) into Reg[2]. Addr_A is Reg[0], Addr_B is Reg[2].



