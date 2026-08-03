PIO     = $(USERPROFILE)/.platformio/packages
CC      = $(PIO)/toolchain-atmelavr/bin/avr-gcc.exe
OBJCOPY = $(PIO)/toolchain-atmelavr/bin/avr-objcopy.exe
AVRDUDE = $(PIO)/tool-avrdude/avrdude.exe

MCU     = m32
F_CPU   = 16000000UL
CFLAGS  = -mmcu=atmega32 -DF_CPU=$(F_CPU) -std=c99 -Wall -Os
LDFLAGS = -mmcu=atmega32

# Auto-discover sources
C_SOURCES := \
    $(wildcard src/*.c) \
    $(wildcard App/*.c) \
    $(wildcard MCL/*.c) \
    $(wildcard MCL/*/*.c) \
    $(wildcard MCL/*/*/*.c) \
    $(wildcard HAL/*.c) \
    $(wildcard HAL/*/*.c) \
    $(wildcard HAL/*/*/*.c) \
    $(wildcard LOGIC/*.c) \
    $(wildcard LOGIC/*/*.c) \
    $(wildcard LOGIC/*/*/*.c)

OBJS   := $(patsubst %.c,build/%.o,$(C_SOURCES))
DEPS   := $(patsubst %.c,build/%.d,$(C_SOURCES))
TARGET := build/firmware

# Auto include folders
INCLUDE_DIRS := include src LOGIC Service \
    $(sort $(dir $(wildcard LOGIC/*.h)) $(dir $(wildcard LOGIC/*/*.h))) \
    $(sort $(dir $(wildcard MCL/*/*.h)) $(dir $(wildcard MCL/*/*/*.h))) \
    $(sort $(dir $(wildcard HAL/*/*.h)) $(dir $(wildcard HAL/*/*/*.h)))
CFLAGS += $(addprefix -I,$(INCLUDE_DIRS))

# دالة لإنشاء المجلدات بأمر متوافق مع نظام Windows
MKDIR = if not exist "$(subst /,\,$(1))" mkdir "$(subst /,\,$(1))"

all: $(TARGET).hex

$(TARGET).elf: $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@

$(TARGET).hex: $(TARGET).elf
	$(OBJCOPY) -O ihex -R .eeprom $< $@

# --- Build pipeline stages ---

build/%.i: %.c
	@$(call MKDIR,$(dir $@))
	$(CC) $(CFLAGS) -MMD -MP -MF $(@:.i=.d) -MT $@ -E $< -o $@

build/%.s: build/%.i
	@$(call MKDIR,$(dir $@))
	$(CC) $(CFLAGS) -S $< -o $@

build/%.o: build/%.s
	@$(call MKDIR,$(dir $@))
	$(CC) $(CFLAGS) -c $< -o $@

.SECONDARY:

-include $(DEPS)

clean:
	@if exist build rmdir /s /q build

flash: $(TARGET).hex
	$(AVRDUDE) -c usbasp -p $(MCU) -U flash:w:$<:i

.PHONY: all clean flash