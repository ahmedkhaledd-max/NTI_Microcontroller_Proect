# Step 1 Submission: Project Overview & Module Assignment

---

## 1. Executive Summary & Project Description

### 1.1 Project Title
**Smart Elevator Controller**

### 1.2 Overview
This project implements a four-floor elevator controller using an ATmega32A MCU. The system handles hall calls and car calls, controls the hoist and door motors, drives a seven-segment floor display, and provides a service LCD and serial telemetry. Safety-critical features include emergency stop, door obstruction reversal, overload inhibition, fire-service recall, and fault logging.

### 1.3 Objectives
- Implement efficient floor dispatch using the LOOK algorithm.
- Build a trapezoidal motion profile for smooth arrival and levelling.
- Read 16 buttons through chained 74HC165 and drive a 74HC595 display.
- Manage safety and fault conditions with immediate overrides and persistent logging.
- Provide a service console and LCD status display.

---

## 2. Technical Stack Overview

| Layer | Technologies / Tools |
| :--- | :--- |
| **MCU** | ATmega32A @ 8 MHz |
| **Peripherals** | GPIO, ADC, SPI, I2C, Timer/PWM, External Interrupts, UART |
| **Input Devices** | 74HC165 button chain, pushbuttons, switches |
| **Output Devices** | 74HC595 7-seg display, 16×2 LCD, LEDs, buzzer, motors |
| **Software** | C, modular HAL/MCL architecture, state-machine logic |

---

## 3. Project Modules

The system is divided into six modules with distinct responsibilities. This supports parallel development and a clear separation between hardware, control, safety, and service.

### Module 1: Peripheral Abstraction
- GPIO driver and pin control
- ADC sampling and conversion
- SPI master transfer and device strobes
- I2C/TWI LCD communication
- Timer setup and PWM generation
- External interrupt handling
- UART serial interface

Provides raw MCU peripheral services used by higher-level modules.

### Module 2: Input & Display Hardware
- 74HC165 button acquisition and debounce logic
- 74HC595 floor display update and direction arrows
- 16×2 LCD service display formatting and refresh
- Buzzer / tone generation for arrival and alarms

Encapsulates the physical input/output devices and their timing requirements.

### Module 3: Position & Motion Control
- ADC-based car position measurement and floor mapping
- Motion profile computation (departure, slowdown, creep, levelling)
- Hoist PWM control and floor arrival handling
- Door PWM control and automatic open/close sequence

Manages the moving parts of the elevator and ensures smooth, accurate floor arrival.

### Module 4: Dispatch & Call Management
- Button-to-call bitmap mapping
- Call registration and duplicate suppression
- LOOK dispatch algorithm and direction decision
- Automatic parking and fire-service recall
- Call rejection during emergency stop and fire service

Handles how the elevator decides where to go next and which calls to serve.

### Module 5: Safety & Fault Handling
- Emergency stop and INT0 response
- Door obstruction reversal and door jam detection
- Overload inhibit and overcurrent monitoring
- Travel timeout, over-travel, position sensor fault handling
- Fault logging and persistent fault ring buffer

Implements safety rules, fault detection, and service state transitions.

### Module 6: Service, Telemetry & Persistence
- Main system initialization and task coordination
- Serial command parser and telemetry frame output every 2 s
- LCD status pages, fault and bitmap reporting
- EEPROM persistence for trips, door cycles, and faults
- Test command support and event logging

Integrates control, safety, and hardware into the final application and provides service interfaces.

---

## 4. Developer Responsibilities

### Developer Function Table

| Developer | Modules | Primary Functions |
| :--- | :--- | :--- |
| **Developer 1** | Module 1: Peripheral Abstraction<br>Module 2: Input & Display Hardware | - MCU peripheral drivers<br>- SPI/I2C and ADC integration<br>- Button acquisition and debouncing<br>- Seven-segment and LCD display control<br>- Buzzer/tone generation and timing |
| **Developer 2** | Module 3: Position & Motion Control<br>Module 4: Dispatch & Call Management<br>Module 5: Safety & Fault Handling<br>Module 6: Service, Telemetry & Persistence | - Motion profile and floor levelling<br>- LOOK dispatch and call bitmap logic<br>- Safety interrupts, overload, and fault handling<br>- Service console, telemetry, and persistent logging |

### Developer 1: Hardware & Driver Implementation
- Develop Module 1: Peripheral Abstraction
- Develop Module 2: Input & Display Hardware
- Manage SPI / I2C device timing and peripheral integration
- Verify button acquisition, display refresh, and LCD frame timing

### Developer 2: Control Logic & Safety Integration
- Develop Module 3: Position & Motion Control
- Develop Module 4: Dispatch & Call Management
- Develop Module 5: Safety & Fault Handling
- Develop Module 6: Service, Telemetry & Persistence
- Implement elevator state machines, LOOK algorithm, and fault responses

---

## 5. Collaboration Notes

- Both developers agree on pin assignments, shared data structures, and call/position bitmaps.
- Developer 1 provides stable hardware interfaces; Developer 2 consumes them in control logic.
- Joint testing covers button scanning, display behavior, motion profiling, and safety overrides.
- Shared verification includes the acceptance criteria for FR-01 through FR-21.

---

*Submitted by: Elevator Control Project Team*  
*Submission Stage: Step 1 — Project & Module Proposal*
