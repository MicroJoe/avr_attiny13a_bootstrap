PROGRAM=main.hex

all: $(PROGRAM)

$(PROGRAM): main.cpp
	avr-gcc -g -DF_CPU=9600000 -Wall -Os -mmcu=attiny13a -c -o main.o main.cpp
	avr-gcc -g -DF_CPU=9600000 -Wall -Os -mmcu=attiny13a -o main.elf main.o
	avr-objcopy -j .text -j .data -O ihex main.elf $(PROGRAM)

flash: $(PROGRAM)
	avrdude -p attiny13 -c stk500v1 -P /dev/ttyUSB0 -b 19200 -q -U \
		flash:w:$(PROGRAM)

clean:
	rm -f main.o main.elf

mrproper: clean
	rm -f $(PROGRAM)
