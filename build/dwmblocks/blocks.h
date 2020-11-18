//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "volume",			                    	0,	    10},
	{"", "battery",			                    	10,		2},
	{"", "pacs",			                    	 0,		5},
	{"📅 ", "date +'%H:%M:%S-%d/%m/%C (%V)'",			10,		3},
	{"", "wifi",			                         5,		4},
	{"", "tmp",  			                         10,	6},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
