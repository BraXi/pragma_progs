// DO. NOT. EDIT.
// structures shared with engine
// this must be the first file to compile into server progs!

//
// globalvars_t
//

	// function parameters, vectors occupy 3 params for x,y,z
	// used to store
	float		parm1, parm2, parm3, parm4, parm5, parm6, parm7, parm8, parm9, parm10, parm11, parm12, parm13, parm14, parm15, parm16;

	entity		self;				// self is always the entity the function ws called on
	entity		other;				// other could be entity that touched/used something, etc.

	float		time;				// current server time
	float		frameNum;			// current server frame
	float		frameTime;			// time it took to process frame

	// used by anglevectors() builtin
	vector		v_forward, v_up, v_right;

	// used by trace*() builtins
	float		trace_allsolid, trace_startsolid, trace_fraction, trace_plane_dist;
	vector		trace_endpos, trace_plane_normal;
	entity		trace_ent;

	void()		main;				// called during level init after BSP entities have spawned
	void()		StartFrame;			// runs at the beginning of server frame
	void()		EndFrame;			// runs at the end of each server frame

	void() 		ClientBeginServerFrame;
	void() 		ClientBegin;
	float()		ClientConnect;		// called when player connects to server
	void()		ClientDisconnect;	// when client disconnects from server
	void()		ClientSpawn;		// called when player connects to server
	
void		end_sys_globals; // end of struct



//
// entvars_t
//
	// many vars are hidden in engine, these are the only changable cvars via script
	.vector		absmin;
	.vector		absmax;
	
	.float		movetype;		// float MOVETYPE_NONE etc
	.float		solid;			// SOLID_NOT etc
	
	.float		animframe;		// @FIXME -- UNUSED, WILL BE REMOVED

	.void()		prethink;		// called before physics
	.void()		think;			// called in phyics
	.float		nextthink;		// when to run .think again

	.void()		touch;			// when two entities touch
	.void()		blocked;		// when mover is blocked, other = blocker
	
	.void()		pain;			// when entity receives damage
	.void()		die;			// when entity dies
	
	.vector		origin;			
	.vector		velocity;		// motion velocity
	.vector		angles;			// current angles
	.vector		avelocity;		// rotation velocity

	.string		classname;		
	.string		model;			// model name
	
	.float		mass;
	
	.float		takedamage;
	.float 		health, max_health, gib_health;
	.float		deadflag;
	
	.float		pain_debounce_time;
	
	.float		renderfx;
	.float		skinnum;
	
	.void(float index, float frame, float event) OnAnim;	
	
void		end_sys_fields; // end of struct

float difficulty; // cvar 'skill'


// g_local.h: deadflag
float DEAD_NO			= 0;
float DEAD_DYING		= 1;
float DEAD_DEAD			= 2;
float DEAD_RESPAWNABLE	= 3;

// g_local.h: typedef enum damage_t
float DAMAGE_NO			= 0;
float DAMAGE_YES		= 1; // will take damage if hit
float DAMAGE_AIM		= 2; // auto targeting recognizes this

// game.h : edict->movetype values
// typedef enum float MOVETYPE_t
float MOVETYPE_NONE			= 0;	// never moves
float MOVETYPE_NOCLIP		= 1;	// origin and angles change with no interaction
float MOVETYPE_PUSH			= 2;	// no clip to world, push on box contact
float MOVETYPE_STOP			= 3;	// no clip to world, stops on box contact
float MOVETYPE_WALK			= 4;	// gravity
float MOVETYPE_STEP			= 5;	// gravity, special edge handling
float MOVETYPE_FLY			= 6;
float MOVETYPE_TOSS			= 7;	// gravity
float MOVETYPE_FLYMISSILE 	= 8;	// extra size to monsters
float MOVETYPE_BOUNCE		= 9;

// game.h : typedef enum solid_t;
float SOLID_NOT			= 0;	// no interaction with other objects
float SOLID_TRIGGER		= 1;	// only touch when inside, after moving
float SOLID_BBOX		= 2;	// touch on edge
float SOLID_BSP			= 3;	// bsp clip, touch on edge
	
	

// defines from q_shared.h

// typedef enum multicast_t
float MULTICAST_ALL 	= 0;
float MULTICAST_PHS		= 1;
float MULTICAST_PVS		= 2;
float MULTICAST_ALL_R	= 3;
float MULTICAST_PHS_R	= 4;
float MULTICAST_PVS_R	= 5;

// pmove flags
float PMF_DUCKED			= 1;
float PMF_JUMP_HELD			= 2;
float PMF_ON_GROUND			= 4;
float PMF_TIME_WATERJUMP	= 8; 	// pm_time is waterjump
float PMF_TIME_LAND			= 16;	// pm_time is time before rejump
float PMF_TIME_TELEPORT		= 32;	// pm_time is non-moving time
float PMF_NO_PREDICTION		= 64;	// temporarily disables prediction (used for grappling hook)

