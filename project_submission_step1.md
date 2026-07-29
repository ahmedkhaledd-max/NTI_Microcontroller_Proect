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

The software is divided into five independent modules. Each module has a single
responsibility, enabling parallel development, easier testing, and clear
separation between hardware drivers, control algorithms, safety logic, and
system services.

---

# Project Modules

---

## Module 1 — Input & Display Hardware

**Files**
```text
elevator_io.c
elevator_io.h
```

### Responsibility
Handles all user inputs and visual/audio outputs.

### Public Functions

```c
void IO_Init(void);
void IO_Update(void);
uint8_t IO_GetButtonEvent(uint8_t id);

void LCD_ShowStatus(void);
void LCD_ShowFault(void);

void Gong_Play(uint8_t type);
```

---

## Module 2 — Position & Motion Control

**Files**
```text
elevator_motion.c
elevator_motion.h
```

### Responsibility
Controls elevator movement, position measurement, levelling, and door operation.

### Public Functions

```c
void Motion_Init(void);
void Motion_Update(void);

void Motion_GoToFloor(uint8_t floor);
void Motion_Stop(void);

uint16_t Motion_GetPosition(void);
uint8_t Motion_GetFloor(void);

void Door_Open(void);
void Door_Close(void);
```

---

## Module 3 — Dispatch & Call Management

**Files**
```text
elevator_dispatch.c
elevator_dispatch.h
```

### Responsibility
Processes elevator requests and determines the next destination.

### Public Functions

```c
void Dispatch_Init(void);
void Dispatch_Update(void);

void Call_Register(uint8_t floor, uint8_t type);
void Call_Clear(uint8_t floor);

uint8_t Dispatch_GetNextFloor(void);
```

---

## Module 4 — Safety & Fault Handling

**Files**
```text
elevator_safety.c
elevator_safety.h
```

### Responsibility
Monitors safety conditions and manages system faults.

### Public Functions

```c
void Safety_Init(void);
void Safety_Update(void);

void Emergency_Stop(void);

void Fault_Set(uint8_t id);
void Fault_Clear(uint8_t id);
bool Fault_IsActive(void);
```

---

## Module 5 — System, Telemetry & Persistence

**Files**
```text
elevator_system.c
elevator_system.h
```

### Responsibility
Coordinates all modules, scheduling, telemetry, and persistent storage.

### Public Functions

```c
void System_Init(void);
void System_Update(void);

void Console_Process(void);
void Telemetry_Send(void);

void Statistics_Save(void);
void LogFault(uint8_t fault);
```

### 4. Developer Responsibilities

### Developer Function Table

| Developer | Modules | Primary Responsibilities |
| :--- | :--- | :--- |
| **Developer 1 (Ahmed)** | **Module 1:** Input & Display Hardware<br>**Module 5:** System, Telemetry & Persistence | Button acquisition, LCD, LEDs, buzzer, system initialization, scheduler, telemetry, console commands, statistics and logging. |
| **Developer 2 (Mohammed)** | **Module 2:** Position & Motion Control<br>**Module 3:** Dispatch & Call Management<br>**Module 4:** Safety & Fault Handling | Motion control, floor detection, LOOK dispatch algorithm, call management, fire service, parking, safety monitoring, fault handling and emergency responses. |

---

### Developer 1 (Ahmed): User Interface & System Services

Responsible for all user interaction, display devices, communication services, and system coordination.

#### Module 1 — Input & Display Hardware

##### Buttons
```c
void Buttons_Init(void);
void Buttons_Read(void);
void Buttons_Debounce(void);
uint8_t Button_GetEvent(uint8_t id);

## 5. Collaboration Notes

- Both developers agree on pin assignments, shared data structures, and call/position bitmaps.
- Developer 1 provides stable hardware interfaces; Developer 2 consumes them in control logic.
- Joint testing covers button scanning, display behavior, motion profiling, and safety overrides.
- Shared verification includes the acceptance criteria for FR-01 through FR-21.

---

*Submitted by: Elevator Control Project Team*  
*Submission Stage: Step 1 — Project & Module Proposal*
