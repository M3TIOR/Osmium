// M3TIOR 2015

#include "debug.h"
#include "display.h"

// built-in debug module

stack stacktrace(){
	asm volatile (
		//assembly template
		
		//so this is where
		#ifdef BITS_16
		""
		#ifdef BITS_32
		""
		#ifdef BITS_64
		""
		:
		
		//ouput operands
		""
		:
		
		//input operands
		""
		:
		
		//clobbers
		""
		
	);
}
