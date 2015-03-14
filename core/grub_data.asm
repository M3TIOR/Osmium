%comment
	;below is the multiboot code for integration with grub
	;
	;it should include the standard calls for the standard bootloader.
%endcomment

MBOOT_PAGE_ALIGN    equ 1<<0    ; Load kernel and modules on a page boundary
MBOOT_MEM_INFO      equ 1<<1    ; Provide your kernel with memory info
MBOOT_HEADER_MAGIC  equ 0x1BADB002 ; Multiboot Magic value
MBOOT_HEADER_FLAGS  equ MBOOT_PAGE_ALIGN | MBOOT_MEM_INFO
MBOOT_CHECKSUM      equ -(MBOOT_HEADER_MAGIC + MBOOT_HEADER_FLAGS)

;some of this is copied directly from http://www.jamesmolloy.co.uk tutorial_html/2.-Genesis.html
;because even though copyright and shtuff. some code is already optimized to the point of pure op-ness
;and besides. the most of what I'm copying in this is the multiboot headers for grub...

[BITS 32]                       ; All instructions should be 32-bit.

[GLOBAL mboot]                  ; Make 'mboot' accessible from C.
[EXTERN code]                   ; Start of the '.text' section.
[EXTERN bss]                    ; Start of the .bss section.
[EXTERN end]                    ; End of the last loadable section.

multi_boot:
  dd  MBOOT_HEADER_MAGIC        ; GRUB will search for this value on each
                                ; 4-byte boundary in your kernel file
  dd  MBOOT_HEADER_FLAGS        ; How GRUB should load your file / settings
  dd  MBOOT_CHECKSUM            ; To ensure that the above values are correct
   
  dd  multi_boot                ; Location of this descriptor
  dd  code                      ; Start of kernel '.text' (code) section.
  dd  bss			; End of kernel '.data' section.
  dd  end                       ; End of kernel.
  dd  start			; Kernel entry point (initial EIP).

[GLOBAL start]                  ; Kernel entry point.
[EXTERN main]                   ; This is the entry point of our C code

start:
  push    ebx                   ; Load multiboot header location

  ; Execute the kernel:
  cli				; Disable interrupts.
  call main			; call our main() function.
  jmp $				; Enter an infinite loop, to stop the processor
       				; executing whatever rubbish is in the memory
  				; after our kernel!
