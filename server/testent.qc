/*
	void		(*think)(edict_t *self);
	void		(*blocked)(edict_t *self, edict_t *other);	//move to moveinfo?
	void		(*touch)(edict_t *self, edict_t *other, cplane_t *plane, csurface_t *surf);
	void		(*use)(edict_t *self, edict_t *other, edict_t *activator);
	void		(*pain)(edict_t *self, edict_t *other, float kick, int damage);
	void		(*die)(edict_t *self, edict_t *inflictor, edict_t *attacker, int damage, vec3_t point);
*/
void(entity ent) delete = {};
void() F_RemoveMe = { delete(self); };


void() func_test_load = 
{
//	precachemodel( "test.md2" );
};

void() func_test = 
{	
	func_test_load();	
//	setmodel( self, "test.md2" );	
	self.solid = 0;
};


//	.prethink callback
//	called on entity each server frame before physics
//	
//	self - the entity this is called on
//
void() new_prethink = {};


//	.think callback
//	this is the usual *brain* of entity and is run at intervals set in .nextthink (executed when self.nextthink is equal* to servertime)	
//	When engine calls .think the .nextthink is zeroed and must be set to future in order to .think again
//	
//	[global: self - the entity this is called on]
//
void() new_think = 
{
	self.think = new_think;
	self.nextthink = time + 0.1;
};


//	.blocked callback
//	called when entity (usually a mover) wants to move or rotate but is being blocked by something
//
//	[global: self - the entity that's blocked]
//	[global: other - the entity that blocked it]
//
void() test_blocked = 
{
//		if( strok(other.classname) /*other.classname && other.classname != ""*/ )
//		{
//			print( "blocked by " );
//			print( other.classname );
//		}
}; 	


//	.use callback
//	called when entity is used by something, be it a trigger firing its targets or player action
//	
//	[global: self - the entity this is called on]
//	[global: other - the used entity]
//	activator - the entity that caused this
//
void( entity activator ) test_use = 
{
};


//	.pain callback
//	called each time entity receives damage
//	
//	[global: self - the victim]
//	[global: other - attacker entity]
//	inflictor - the entity that dealt damage (grenade etc)
//	damage - how much points to take
//	dir - from where did damage come from
//
void( entity inflictor, float damage, vector dir ) test_pain = 
{
};

//	.damagemod callback
//	this is the damage modifier in which you decide to apply damage or not to an entity
//	returns damage points that will be applied, this is handy when you want something to take more/less/none damage depending on your preference
// 	.pain will not be triggered if this returns 0
//	
//	[global: self - the victim]
//	[global: other - attacker entity]
//	inflictor - the entity that dealt damage (grenade etc)
//	damage - how much points to take
// 	dmgflags - DMG_BULLET etc flags
//
float( entity inflictor, float damage, float dmgflags ) test_damagemod = 
{
	return damage;
};


//	.die callback
//	called when entity dies (health is negative)
//	
//	[global: self - the victim]
//	[global: other - attacker entity]
//	inflictor - the entity that dealt damage (grenade etc)
//	damage - how much points to take
//	dir - vector from where damage came from
//
void( entity inflictor, float damage, vector dir ) test_die = 
{
	self.think = F_RemoveMe;
	self.nextthink = time + 1.0;
}; 


void() build_anims = 
{
	// fixme: anim fps can be now only 5, 10 or 20, default = 20
	local float anim;
	
	if( findanim( "move_updown" ) != 0 )
		return; // already created anim
	
	// createanimation( name, firstFrame, numFrames, fps )
	// build sv.anims[], negative fps is the default animation fps
	anim = createanimation( "move_updown", 0, 20, 10 );
	
	// markanimevent( animationId, frame, eventName )
	markanimevent( anim, 20, "hitground" ); //  mark last frame as an "hitground" event
	
	anim = createanimation( "move_up", 0, 10, 10 );	
	anim = createanimation( "move_down", 11, 20, 10 );		
}; 

void() play_anim =
{
	// playanim( ent, animationName );
	playanim( self, "move_updown" );

//	playanimloop( self, "move_updown" );	
};

void( string event ) anim_event_listener =
{
	// called when animationframe is marked as event, event is the string given to frame
	if( event == "hitground" )
	{
		sound(self, CHAN_BODY, "misc/rubble.wav", 1, ATTN_NORM);	
//		stopanim( ent ); // if it's looping then stop it		
		self.nextthink = time + g_frameTime; // g_frameTime is 1.0/serverfps
		self.think = play_anim;
	}
};

void() sp_test_anim =
{
	// spawn sphere that will animate 50 units up and 50 down
	// make it use anim event lister and play animation

	if( !gameInit ) //not spawning at map start
	{
		self = spawn( '0 0 0', '0 0 0' );
	}
	
	build_anims();
	
	setmodel( self, "test/anim_sphere" );
	setsolid( self, SOLID_NOT );
	
	self.OnAnimEvent = anim_event_listener;	
	
	self.nextthink = time + 3.0;
	self.think = play_anim;
};



	