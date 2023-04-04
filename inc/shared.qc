// globals used by both client and server

// you can add new globals here

float FALSE = 0;
float TRUE = 1;

string string_null = "";
vector vec_null = '0 0 0';

// print levels
float PRINT_LOW		= 0;	// pickup messages
float PRINT_MEDIUM	= 1;	// death messages
float PRINT_HIGH	= 2;	// critical messages
float PRINT_CHAT	= 3;	// chat message

// contents
float CONTENTS_SOLID		= 1; 	// an eye is never valid in a solid
float CONTENTS_WINDOW		= 2;	// translucent, but not watery
float CONTENTS_AUX			= 4;
float CONTENTS_LAVA			= 8;
float CONTENTS_SLIME		= 16;
float CONTENTS_WATER		= 32;
float CONTENTS_MIST			= 64;
float CONTENTS_AREAPORTAL	= 32768;
float CONTENTS_PLAYERCLIP	= 65536;
float CONTENTS_MONSTERCLIP	= 131072;
float CONTENTS_MONSTER		= 33554432;		// should never be on a brush, only in game
float CONTENTS_DEADMONSTER	= 67108864;
float CONTENTS_DETAIL		= 134217728;	// brushes to be added after vis leafs
float CONTENTS_TRANSLUCENT	= 268435456;	// auto set if any surface has trans
float CONTENTS_LADDER		= 536870912;

// conntent masks
float MASK_ALL				= -1;
float MASK_SOLID			= (CONTENTS_SOLID|CONTENTS_WINDOW);
float MASK_PLAYERSOLID		= (CONTENTS_SOLID|CONTENTS_PLAYERCLIP|CONTENTS_WINDOW|CONTENTS_MONSTER);
float MASK_DEADSOLID		= (CONTENTS_SOLID|CONTENTS_PLAYERCLIP|CONTENTS_WINDOW);
float MASK_MONSTERSOLID		= (CONTENTS_SOLID|CONTENTS_MONSTERCLIP|CONTENTS_WINDOW|CONTENTS_MONSTER);
float MASK_WATER			= (CONTENTS_WATER|CONTENTS_LAVA|CONTENTS_SLIME);
float MASK_OPAQUE			= (CONTENTS_SOLID|CONTENTS_SLIME|CONTENTS_LAVA);
float MASK_SHOT				= (CONTENTS_SOLID|CONTENTS_MONSTER|CONTENTS_WINDOW|CONTENTS_DEADMONSTER);