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

## 3. # Project Modules

The software is divided into six independent modules. Each module has a single
responsibility, enabling parallel development, easier testing, and clear
separation between hardware drivers, control algorithms, safety logic, and
system services.

---

## Module 1: Peripheral Abstraction

Responsible for configuring and accessing the ATmega32 hardware peripherals.

### Responsibilities

- GPIO configuration and digital I/O
- ADC sampling and conversion
- Timer initialization
- PWM generation for hoist and door motors
- External interrupt configuration (INT0, INT1)
- LCD low-level interface
- Buzzer control

Provides low-level MCU services used by all higher-level modules.

---

## Module 2: Input & Display

Responsible for reading user inputs and updating visual and audio indicators.

### Responsibilities

- Hall-call and car-call button acquisition
- Door Open / Door Close buttons
- Emergency Alarm and Emergency Stop inputs
- Button debouncing and edge detection
- Floor indicator LEDs
- Direction LEDs (UP / DOWN)
- Overload indicator LED
- 16×2 LCD status display
- Arrival gong and alarm buzzer

Encapsulates all operator inputs and user interface devices.

---

## Module 3: Position & Motion Control

Responsible for elevator movement and door control.

### Responsibilities

- Car position measurement from ADC
- Floor detection and position filtering
- Motion profile generation
- Hoist motor PWM control
- Door motor PWM control
- Automatic door open/close sequence
- Levelling at the destination floor

Manages all mechanical movement while ensuring smooth and accurate positioning.

---

## Module 4: Dispatch & Call Management

Responsible for processing requests and selecting the next destination.

### Responsibilities

- Button-to-call mapping
- Hall and car call registration
- Duplicate call suppression
- LOOK dispatch algorithm
- Direction selection
- Automatic parking
- Fire-service recall
- Call rejection during Emergency Stop and Fire Service

Determines where the elevator should travel next according to system requests.

---

## Module 5: Safety & Fault Handling

Responsible for monitoring unsafe conditions and protecting the system.

### Responsibilities

- Emergency Stop handling (INT0)
- Door safety edge monitoring (INT1)
- Door obstruction recovery
- Door timeout detection
- Overload monitoring
- Over-current monitoring
- Position sensor fault detection
- Over-travel protection
- Travel timeout detection
- Door-open-while-moving interlock
- Fault management and fault logging

Implements all safety functions and manages fault transitions.

---

## Module 6: System & Service Management

Responsible for coordinating all software modules and providing system services.

### Responsibilities

- System initialization
- Main scheduler and task execution
- LCD service pages
- Statistics management
- Trip counter
- Door cycle counter
- Console command processing
- Telemetry transmission
- Event logging
- Diagnostic and maintenance functions

Integrates all software modules into a complete elevator control application.

## 4. Developer Responsibilities

### Developer Function Table

| Developer | Modules | Primary Functions |
| :--- | :--- | :--- |
| **Developer 1** | Module 1: Peripheral Abstraction<br>Module 2: Input & Display Hardware | - MCU peripheral drivers<br>- SPI/I2C and ADC integration<br>- Button acquisition and debouncing<br>- Seven-segment and LCD display control<br>- Buzzer/tone generation and timing |
| **Developer 2** | Module 3: Position & Motion Control<br>Module 4: Dispatch & Call Management<br>Module 5: Safety & Fault Handling<br>Module 6: Service, Telemetry & Persistence | - Motion profile and floor levelling<br>- LOOK dispatch and call bitmap logic<br>- Safety interrupts, overload, and fault handling<br>- Service console, telemetry, and persistent logging |

### Developer 1(Ahmed): Hardware & Driver Implementation
- Develop Module 1: Peripheral Abstraction
- Develop Module 2: Input & Display Hardware
- Manage SPI / I2C device timing and peripheral integration
- Verify button acquisition, display refresh, and LCD frame timing

### Developer 2 (Mohammed): Control Logic & Safety Integration
- Develop Module 3: Position & Motion Control
- Develop Module 4: Dispatch & Call Management
- Develop Module 5: Safety & Fault Handling
- Develop Module 6: Service, Telemetry & Persistence
- Implement elevator state machines, LOOK algorithm, and fault responses

---

## 5. Shared Work

- Define and document pin assignments, signal names, and shared data structures.
- Agree on call bitmap layout, motion state variables, and fault/event message formats.
- Co-design the serial command interface, LCD page content, and telemetry frame structure.
- Perform joint integration testing for button acquisition, display refresh, motion profiling, and safety overrides.
- Review each other’s code for timing-critical interactions and safety behavior.

---

## 6. Collaboration Notes

- Both developers agree on pin assignments, shared data structures, and call/position bitmaps.
- Developer 1 provides stable hardware interfaces; Developer 2 consumes them in control logic.
- Joint testing covers button scanning, display behavior, motion profiling, and safety overrides.
- Shared verification includes the acceptance criteria for FR-01 through FR-21.

---

*Submitted by: Elevator Control Project Team*  
*Submission Stage: Step 1 — Project & Module Proposal*
