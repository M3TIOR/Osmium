;Temporary file for making the kernel bootable until I can make a bootloader
;Or get an installer up and running.

[BITS 16]	;force 16 bit machiene code output
[ORG  0x7c00]	;this defines where the program we are executing is loaded into memory.

jmp boot	; no Idea why this is here particularly...

boot:			;displays ! to the screen.
	mov al, '!'
	mov ah, 0x0e
	mov bh, 0x00
	mov bl, 0x07

	int 0x10
	jmp $
	
;NOTE:
;	this litte section at the end here needs to be at the very end of the mbr to make it bootable.
;	MAKE SURE THE OUTPUT BINARY IS EXACTLY 512 BYTES!

times 510-($-$$) db 0

db 0x55		;Tells the bios that this device is bootable.
db 0xaa		;In conjunction with prevoius db.
