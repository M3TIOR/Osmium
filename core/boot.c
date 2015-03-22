/* M3TIOR 2015 */

#include "config.h"

main(){
	// I know this looks bad now, but trust me this style of writing asm statements helps alot when looking for stuff...
	asm volatile (
		//assembly template
		#ifdef ENABLE_DEBUG
			#ifdef ARCH_x86
			#ifdef ARCH_x86_64
			#ifdef ARCH_arm32
			#ifdef ARCH_arm64
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
