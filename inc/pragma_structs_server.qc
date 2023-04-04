// DO. NOT. EDIT.
// structures shared with engine
// this must be the first file to compile into server progs!

//
// globalvars_t
//

	// function parameters, vectors occupy 3 params for x,y,z
	// used to store
	float		parm1, parm2, parm3, parm4, parm5, parm6, parm7, parm8, parm9, parm10, parm11, parm12, parm13, parm14, parm15, parm16;
//	vector		parm_origin, parm_angles; // cross level transitions HL style

	entity		self;				// self is always the entity the function ws called on
	entity		other;				// other could be entity that touched/used something, etc.

	float		time;				// current server time
	float		frameNumber;		// current server frame
	float		frameTime;			// time it took to process frame

	// used by anglevectors() builtin
	vector		v_forward, v_up, v_right;

	// used by trace*() builtins
	float		trace_allsolid, trace_startsolid, trace_fraction, trace_plane_dist, trace_inopen, trace_inwater;
	vector		trace_endpos, trace_plane_normal;
	entity		trace_ent;

	void()		main;				// function to call during level init to precache assets
	void()		StartFrame;			// function that runs every frame

	void()		ClientConnect;		// called when player connects to server
	void()		ClientDisconnect;	// when client disconnects from server
	void()		ClientSpawn;		// called when player connects to server
	
void		end_sys_globals; // end of struct



//
// entvars_t
//

	.float		movetype;		// MOVETYPE_NONE etc
	.float		solid;			// SOLID_NOT etc

	.float		animframe;

	.void()		prethink;		// called before physics
	.void()		think;			// called in phyics
	.float		nextthink;		// when to run .think again

	.void()		touch;			// when two entities touch
	.void()		blocked;		// when mover is blocked, other = blocker

	.vector		origin;			
	.vector		velocity;		// motion velocity
	.vector		angles;			// current angles
	.vector		avelocity;		// rotation velocity

	.string		classname;		
	.string		model;			// model name
	
void		end_sys_fields; // end of struct