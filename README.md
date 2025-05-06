# Signed-SPM

##  Overview
This project implements a **sequential 8×8 signed Serial-Parallel Multiplier (SPM)** using Verilog on the **Basys 3 FPGA board (Artix-7)**. The design allows users to input two signed 8-bit binary numbers using switches, multiply them using an FSM-based serial-parallel approach, and view the signed decimal result on the 7-segment display.

---

## Features
- Serial-parallel multiplication for 8-bit **signed** numbers (two's complement).
- Minimal hardware complexity with sequential processing.
- User inputs via **toggle switches (SW15–SW0)**.
- Output (product) displayed as a **signed decimal value** on the 4-digit 7-segment display.
- Scroll through digits using **BTNL** and **BTNR**.
- **BTNC** to start multiplication.
- **LD0 LED** lights when multiplication is done.

## I/O Pin 

| Component     | Pins         | Function                             |
|---------------|--------------|--------------------------------------|
| SW7–SW0       | Input        | 8-bit signed multiplier              |
| SW15–SW8      | Input        | 8-bit signed multiplicand            |
| BTNC          | Input        | Start multiplication                 |
| BTNL, BTNR    | Input        | Scroll result digits left/right      |
| LD0           | Output       | Lights up when multiplication done   |
| 7-segment     | Output       | Shows signed decimal result          |

---

## Functional Description

1. **User sets:**
   - Multiplier using `SW7–SW0`
   - Multiplicand using `SW15–SW8`

2. **User presses BTNC to start.**

3. The **SPM core**:
   - Loads multiplicand in parallel.
   - Processes multiplier bit-by-bit (serial).
   - Performs signed multiplication using FSM.

4. The result:
   - Displayed on 7-segment with sign on left digit.
   - Scroll using BTNL (left) and BTNR (right).

5. **LD0** turns ON when multiplication is complete.

---

##  How to Run

1. Install **Vivado Design Suite** from Xilinx.
2. Create a new Vivado project targeting the **Basys 3 board** (Artix-7, `xc7a35tcpg236-1`).
3. Add the project files.
4. Synthesize, implement, and generate the bitstream.
5. Connect your **Basys 3 FPGA board** via USB.
7. Use the toggle switches to input values and observe the product on the 7-segment display.


---

## Contributing

Contributions are welcome! If you'd like to improve or extend the project:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature-name`.
3. Commit your changes: `git commit -m "Add feature"`.
4. Push to your branch: `git push origin feature-name`.
5. Open a pull request and describe your changes.
