// DO. NOT. EDIT.
// defines in here must match q_shared.h !


// --------------------------------------
// shared by both client and server:
// --------------------------------------

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


// entity_state_t->effects
// Effects are things handled on the client side (lights, particles, frame animations)
// that happen constantly on the given entity.
// An entity that has effects will be sent to the client even if it has a zero index model.
float EF_ROTATE			= 0x00000001;		// rotate (bonus items)
float EF_GIB			= 0x00000002;		// leave a trail
float EF_BLASTER		= 0x00000008;		// redlight + trail
float EF_ROCKET			= 0x00000010;		// redlight + trail
float EF_GRENADE		= 0x00000020;
float EF_HYPERBLASTER	= 0x00000040;
float EF_BFG			= 0x00000080;
float EF_COLOR_SHELL	= 0x00000100;
float EF_POWERSCREEN	= 0x00000200;
float EF_ANIM01			= 0x00000400;	// automatically cycle between frames 0 and 1 at 2 hz
float EF_ANIM23			= 0x00000800;	// automatically cycle between frames 2 and 3 at 2 hz
float EF_ANIM_ALL		= 0x00001000;	// automatically cycle through all frames at 2hz
float EF_ANIM_ALLFAST	= 0x00002000;	// automatically cycle through all frames at 10hz
float EF_FLIES			= 0x00004000;
float EF_QUAD			= 0x00008000;
float EF_PENT			= 0x00010000;
float EF_TELEPORTER		= 0x00020000;	// particle fountain
float EF_FLAG1			= 0x00040000;
float EF_FLAG2			= 0x00080000;
float EF_IONRIPPER		= 0x00100000; // begin RAFAEL
float EF_GREENGIB		= 0x00200000;
float EF_BLUEHYPERBLASTER = 0x00400000;
float EF_SPINNINGLIGHTS	= 0x00800000;
float EF_PLASMA			= 0x01000000;
float EF_TRAP			= 0x02000000; // end RAFAEL
float EF_TRACKER		= 0x04000000; //begin ROGUE
float EF_DOUBLE			= 0x08000000;
float EF_SPHERETRANS	= 0x10000000;
float EF_TAGTRAIL		= 0x20000000;
float EF_HALF_DAMAGE	= 0x40000000;
float EF_TRACKERTRAIL	= 0x80000000; //end ROGUE
//ROGUE

// entity_state_t->renderfx flags
float RF_MINLIGHT		= 1;			// allways have some light (viewmodel)
float RF_VIEWERMODEL	= 2;			// don't draw through eyes, only mirrors
float RF_WEAPONMODEL	= 4;			// only draw through eyes
float RF_FULLBRIGHT		= 8;			// allways draw full intensity
float RF_DEPTHHACK		= 16;			// for view weapon Z crunching
float RF_TRANSLUCENT	= 32;
float RF_FRAMELERP		= 64;
float RF_BEAM			= 128;
float RF_CUSTOMSKIN		= 256;			// skin is an index in image_precache
float RF_GLOW			= 512;			// pulse lighting for bonus items
float RF_SHELL_RED		= 1024;
float RF_SHELL_GREEN	= 2048;
float RF_SHELL_BLUE		= 4096;
float RF_IR_VISIBLE		= 0x00008000;	// 32768 -- begin ROGUE
float RF_SHELL_DOUBLE	= 0x00010000;	// 65536
float RF_SHELL_HALF_DAM	= 0x00020000;
float RF_USE_DISGUISE	= 0x00040000;	// end ROGUE

// braxi - @fixme - move these to aproppriate files? its not good place here, these could have been in weapon/ai/player defs
//
// muzzle flashes / player effects
//
float MZ_BLASTER			= 0;
float MZ_MACHINEGUN			= 1;
float MZ_SHOTGUN			= 2;
float MZ_CHAINGUN1			= 3;
float MZ_CHAINGUN2			= 4;
float MZ_CHAINGUN3			= 5;
float MZ_RAILGUN			= 6;
float MZ_ROCKET				= 7;
float MZ_GRENADE			= 8;
float MZ_LOGIN				= 9;
float MZ_LOGOUT				= 10;
float MZ_RESPAWN			= 11;
float MZ_BFG				= 12;
float MZ_SSHOTGUN			= 13;
float MZ_HYPERBLASTER		= 14;
float MZ_ITEMRESPAWN		= 15;
float MZ_IONRIPPER			= 16;	/* begin RAFAEL */
float MZ_BLUEHYPERBLASTER 	= 17;
float MZ_PHALANX			= 18;
float MZ_SILENCED			= 128;	/* end RAFAEL */	// bit flag ORed with one of the above numbers
float MZ_ETF_RIFLE			= 30; 	/* begin ROGUE */
float MZ_UNUSED				= 31;
float MZ_SHOTGUN2			= 32;
float MZ_HEATBEAM			= 33;
float MZ_BLASTER2			= 34;
float MZ_TRACKER			= 35;
float MZ_NUKE1				= 36;
float MZ_NUKE2				= 37;
float MZ_NUKE4				= 38;
float MZ_NUKE8				= 39; 	/* end ROGUE */

// temp entity events
// typedef enum temp_event_t
// Temp entity events are for things that happen at a location seperate from any existing entity.
// Temporary entity messages are explicitly constructed and broadcast.
float TE_GUNSHOT				= 0;
float TE_BLOOD					= 1;
float TE_BLASTER				= 2;
float TE_RAILTRAIL				= 3;
float TE_SHOTGUN				= 4;
float TE_EXPLOSION1				= 5;
float TE_EXPLOSION2				= 6;
float TE_ROCKET_EXPLOSION		= 7;
float TE_GRENADE_EXPLOSION		= 8;
float TE_SPARKS					= 9;
float TE_SPLASH					= 10;
float TE_BUBBLETRAIL			= 11;
float TE_SCREEN_SPARKS			= 12;
float TE_SHIELD_SPARKS			= 13;
float TE_BULLET_SPARKS			= 14;
float TE_LASER_SPARKS			= 15;
float TE_PARASITE_ATTACK		= 16;
float TE_ROCKET_EXPLOSION_WATER = 17;
float TE_GRENADE_EXPLOSION_WATER = 18;
float TE_MEDIC_CABLE_ATTACK 	= 19;
float TE_BFG_EXPLOSION			= 20;
float TE_BFG_BIGEXPLOSION		= 21;
float TE_BOSSTPORT				= 22; // used as '22' in a map = ; so DON'T RENUMBER!!!
float TE_BFG_LASER				= 23;
float TE_GRAPPLE_CABLE			= 24;
float TE_WELDING_SPARKS			= 25;
float TE_GREENBLOOD				= 26;
float TE_BLUEHYPERBLASTER		= 27;
float TE_PLASMA_EXPLOSION		= 28;
float TE_TUNNEL_SPARKS			= 29;
float TE_BLASTER2				= 30; /* begin ROGUE */
float TE_RAILTRAIL2				= 31;
float TE_FLAME					= 32;
float TE_LIGHTNING				= 33;
float TE_DEBUGTRAIL				= 34;
float TE_PLAIN_EXPLOSION		= 35;
float TE_FLASHLIGH				= 36;
float TE_FORCEWALL				= 37;
float TE_HEATBEAM				= 38;
float TE_MONSTER_HEATBEAM		= 39;
float TE_STEAM					= 40;
float TE_BUBBLETRAIL2			= 41;
float TE_MOREBLOOD				= 42;
float TE_HEATBEAM_SPARKS		= 43;
float TE_HEATBEAM_STEAM			= 44;
float TE_CHAINFIST_SMOKE		= 45;
float TE_ELECTRIC_SPARKS		= 46;
float TE_TRACKER_EXPLOSION		= 47;
float TE_TELEPORT_EFFECT		= 48;
float TE_DBALL_GOAL				= 49;
float TE_WIDOWBEAMOUT			= 50;
float TE_NUKEBLAST				= 51;
float TE_WIDOWSPLASH			= 52;
float TE_EXPLOSION1_BIG			= 53;
float TE_EXPLOSION1_NP			= 54;
float TE_FLECHETTE				= 55; /* end ROGUE */

float SPLASH_UNKNOWN		= 0;
float SPLASH_SPARKS			= 1;
float SPLASH_BLUE_WATER		= 2;
float SPLASH_BROWN_WATER	= 3;
float SPLASH_SLIME			= 4;
float SPLASH_LAVA			= 5;
float SPLASH_BLOOD			= 6;

// sound channels
// channel 0 never willingly overrides
// other channels (1-7) allways override a playing sound on that channel
float CHAN_AUTO 			= 0;
float CHAN_WEAPON			= 1;
float CHAN_VOICE 			= 2;
float CHAN_ITEM				= 3;
float CHAN_BODY				= 4;
float CHAN_EXTRA1			= 5;
float CHAN_EXTRA2			= 6;
float CHAN_EXTRA3			= 7;

// modifier flags
float CHAN_NO_PHS_ADD		= 8;	// send to all clients, not just ones in PHS (ATTN 0 will also do this)
float CHAN_RELIABLE			= 16;	// send by reliable message, not datagram

// sound attenuation values
float ATTN_NONE				= 0;	// full volume the entire level
float ATTN_NORM				= 1;
float ATTN_IDLE				= 2;
float ATTN_STATIC			= 3;	// diminish very rapidly with distance

// player_state->stats[] indexes
float STAT_HEALTH_ICON		= 0;
float STAT_HEALTH			= 1;
float STAT_AMMO_ICON		= 2;
float STAT_AMMO				= 3;
float STAT_ARMOR_ICON		= 4;
float STAT_ARMOR			= 5;
float STAT_SELECTED_ICON	= 6;
float STAT_PICKUP_ICON		= 7;
float STAT_PICKUP_STRING	= 8;
float STAT_TIMER_ICON		= 9;
float STAT_TIMER			= 10;
float STAT_HELPICON			= 11;
float STAT_SELECTED_ITEM	= 12;
float STAT_LAYOUTS			= 13;
float STAT_FRAGS			= 14;
float STAT_FLASHES			= 15;	// cleared each frame, 1 = health, 2 = armor
float STAT_CHASE			= 16;
float STAT_SPECTATOR		= 17;

float MAX_STATS				= 32;

// entity_state_t->event values
// ertity events are for effects that take place reletive to an existing entities origin.
// Very network efficient. All muzzle flashes really should be converted to events...
// typedef enum entity_event_t
float EV_NONE				= 0;
float EV_ITEM_RESPAWN		= 1;
float EV_FOOTSTEP			= 2;
float EV_FALLSHORT			= 3;
float EV_FALL				= 4;
float EV_FALLFAR			= 5;
float EV_PLAYER_TELEPORT	= 6;
float EV_OTHER_TELEPORT		= 7;


// --------------------------------------
// server defines:
// --------------------------------------

// --------------------------------------
// client defines:
// --------------------------------------

// ====================================================
// end q_shared.h !!!
// ====================================================