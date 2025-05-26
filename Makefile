all: os.img

mbr.bin: mbr.asm
	nasm -f bin mbr.asm -o mbr.bin

kernel.o: kernel.c
	gcc -c -m32 -fno-pie -fno-stack-protector -nostdlib kernel.c -o kernel.o

kernel.bin: kernel.o kernel.ld
	ld -m elf_i386 -T kernel.ld kernel.o -o kernel.bin

os.img: mbr.bin kernel.bin
	dd if=/dev/zero of=os.img bs=512 count=2880
	dd if=mbr.bin of=os.img conv=notrunc
	dd if=kernel.bin of=os.img seek=1 conv=notrunc

clean:
	rm -f *.bin *.o os.img