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

## Module 1 — Input & Display Hardware

**Files**
```
io.c
io.h
```

### Responsibility
Reads operator inputs and controls all user interface devices.

### Functions

#### Buttons
```c
void Buttons_Init(void);
void Buttons_Read(void);
void Buttons_Debounce(void);
uint8_t Button_GetEvent(uint8_t id);
```

#### LCD
```c
void LCD_Init(void);
void LCD_Update(void);
void LCD_ShowStatus(void);
void LCD_ShowFault(void);
```

#### LEDs
```c
void LED_UpdateDirection(void);
void LED_UpdateOverload(void);
```

#### Buzzer
```c
void Gong_Up(void);
void Gong_Down(void);
void Alarm_Beep(void);
```

---

# Module 2 — Position & Motion Control

**Files**
```
motion.c
motion.h
```

### Responsibility
Controls elevator movement and door motion.

### Functions

#### Position
```c
void Position_Update(void);
uint16_t Position_GetCm(void);
uint8_t Position_GetFloor(void);
```

#### Motion
```c
void Motion_Start(uint8_t floor);
void Motion_Stop(void);
void Motion_Update(void);
void Motion_Profile(void);
```

#### Levelling
```c
void Leveling_Update(void);
bool Leveling_Done(void);
```

#### Door
```c
void Door_Open(void);
void Door_Close(void);
void Door_Stop(void);
void Door_Update(void);
```

---

# Module 3 — Dispatch & Call Management

**Files**
```
dispatch.c
dispatch.h
```

### Responsibility
Processes requests and decides the next destination.

### Functions

#### Calls
```c
void Calls_Register(uint8_t floor,uint8_t type);
void Calls_Clear(uint8_t floor);
bool Calls_Exist(void);
```

#### LOOK Algorithm
```c
void Dispatch_LOOK(void);
uint8_t Dispatch_GetNextFloor(void);
```

#### Fire Service
```c
void FireService_Update(void);
```

#### Parking
```c
void Parking_Update(void);
```

---

# Module 4 — Safety & Fault Handling

**Files**
```
safety.c
safety.h
```

### Responsibility
Monitors all safety conditions and handles faults.

### Functions

#### Emergency
```c
void Emergency_Stop(void);
void Emergency_Reset(void);
```

#### Monitoring
```c
void Safety_CheckOverload(void);
void Safety_CheckCurrent(void);
void Safety_CheckPosition(void);
void Safety_CheckDoor(void);
void Safety_CheckTimeouts(void);
```

#### Faults
```c
void Fault_Set(uint8_t id);
void Fault_Clear(uint8_t id);
bool Fault_IsActive(void);
```

---

# Module 5 — System, Telemetry & Persistence

**Files**
```
system.c
system.h
```

### Responsibility
Coordinates the whole project.

### Functions

#### System
```c
void System_Init(void);
void System_Update(void);
```

#### Scheduler
```c
void Scheduler_10ms(void);
void Scheduler_20ms(void);
void Scheduler_100ms(void);
void Scheduler_250ms(void);
void Scheduler_2s(void);
```

#### Console
```c
void Console_Process(void);
void Console_Command(char *cmd);
```

#### Telemetry
```c
void Telemetry_Send(void);
```

#### Statistics
```c
void Statistics_Update(void);
void LogFault(uint8_t fault);
```

---

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
