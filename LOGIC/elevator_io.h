#ifndef ELEVATOR_IO_H
#define ELEVATOR_IO_H

#include <stdint.h>
#include "../Service/STD_Types.h"

#define IO_BUTTON_COUNT      16u
#define IO_BUTTON_ID_NONE    0xFFu

void IO_Init(void);
void IO_Update(void);
uint8_t IO_GetButtonEvent(uint8_t id);

void LCD_ShowStatus(void);
void LCD_ShowFault(void);

void Gong_Play(uint8_t type);

#endif /* ELEVATOR_IO_H */
