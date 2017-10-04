# VHSIC Hardware Description Language
It is a hardware description language used in electronic design automation to describe digital and mixed-signal systems such as field-programmable gate arrays and integrated circuits. VHDL can also be used as a general purpose parallel programming language.

## VHDL Structural Elements
* **Entity**: Interface
* **Architecture**: Implementation, behavior, function
* **Configuration**: Model chaining, structure, hierarchy
* **Process**: Concurrency, event controlled
* **Package**: Modular design, standard solution, data types, constants
* **Library**: Compilation, object code

## Notes on the Structural Elements
1. Each **entity** can have multiple architectures.
2. Linking between the ports is done via **Port Signals**. You have to be careful about their **Type**, **Width** and **Direction**.
3. Entity ports are available as **signals** through the architecture.
4. Architecture consists of two major parts: **Declarative** part and **Statement** part.
5. Declarative part contains: data types, constants, intermediate signals, component declarations and etc.
6. Statement part(after 'begin') contains: Signal assignments, processes, component instantiations, concurrent statements