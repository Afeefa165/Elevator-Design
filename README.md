# Elevator Management System Using Verilog

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)

## Introduction
The Elevator Management System is a hardware design project implemented in Verilog. It aims to efficiently manage the operations of elevators in a multi-story building, ensuring optimal performance, reducing wait times, and enhancing the user experience.

## Features
- Efficient elevator allocation algorithm
- Real-time monitoring and reporting
- User-friendly interface

## Installation
To work with the Elevator Management System, you need to have a Verilog simulator and synthesis tool installed. Follow these steps to set up your environment:

1. **Clone the repository:**
    ```sh
    git clone https://github.com/Afeefa165/Elevator-Design.git
    cd elevator-management-system
    ```

2. **Set up your Verilog simulator:**
   - You can use simulators like ModelSim, Vivado, or any other Verilog-compatible simulator.

3. **Compile the Verilog files:**
    ```sh
    vlog src/elevator.v
    ```

4. **Run the simulation:**
    ```sh
    vsim -c -do "run -all" test_bench/elevator_tb.v
    ```

## Usage
The project includes the main Verilog module for the elevator control logic and a testbench for simulation.

- **Elevator control logic:** `src/elevator.v`
- **Testbench:** `test_bench/elevator_tb.v`

To simulate a specific scenario, you can modify the testbench file located in the `testbench` directory and run the simulation commands as mentioned above.
