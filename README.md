# Digital Design of Computer Systems
Hello! Welcome to the comprehensive guide to Digital Design by [aligholamee](www.github.com/aligholamee).
Let's get down to business.

## Table of Contents



## LUT(Lookup Table)
In general terms is basically a table that determines what the output is for any given input. In the context of **Combinational Logic**, it is the **truth table**. It defines how your combinational logic behaves. Every behavior you get by interconnecting some **gates** (like AND, OR, XOR, etc.), can be implmented by a LUT.
**FPGA**s typically implement the combinational logic using **LUT**s. When an **FPGA** is configured, it just fills in the table output values, called **LUT-Mask**, and is physically composed of SRAM bits.
So the same physical LUT can implement **Y=AB** and **Y=AB'**, but the LUT-Mask is different.
For example, the **LUT** for an **XOR** gate is:

```
Address In([1:0])       Output
    0   0                 0
    0   1                 1
    1   0                 1
    1   1                 0
```