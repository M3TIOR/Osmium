// M3TIOR 2015


//WARNING yet another security vulnerability!

//this setup is made to allow the programmer to make modules that interface with special devices
//and classify those special devices.
typedef struct {
	//for determining the execution bitwidth needed.
	
	//this allows us to have sepperate modules for different architectures.
	//so if we have 32bit code to run on a module and we only have a
	// 16 bit processor, we don't crash the kernel by running the code.
	unsigned int bytes:3; //zero is 1 byte. max execution size should be 8 bytes or 64 bit.
	
	unsigned int output:1;
	unsigned int intput:1;
	unsigned int analogue:1;
	unsigned int digital:1;
} module;
