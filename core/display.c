//M3TIOR 2015

//stuff
#include "global.h"
#include "config.h"
#include "modloader.h"

int graphics(const unsigned char* data){
	//unified graphics handler.
	int l=0;
	while(data[l]){
		switch(data[0]){
			
			//
			default:break;;break;
		}
		l++;
	}
}

int set_resolution(){
	
}



//ascii functions.

void __init_tty(){
	//preserve exactly one kilobyte for our buffer zone.
	//oh, and don't let the compiler screw with it.
	volatile static unsigned char buffer[1028];
}
//MAY DEPRICATE LATTER!

void TTY_FORCE_OUT_STREAM(){
	
}
