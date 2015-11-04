#define		PREFIX 			rbc
#define		COMPONENT		loot
//#define DEBUG_MODE_FULL 

#include "\x\cba\addons\main\script_macros_common.hpp"


#define FLOOR10(x) (floor(x*10)/10)


#ifdef DEBUG_MODE_FULL
#define TEST_MARKER(x,y,z) \
	[(x),(y),(z)] call rbc_fnc_debugMarker;

#else 
#define TEST_MARKER(x,y,z) \
	[(x),(y),(z)] call {};
	

#endif