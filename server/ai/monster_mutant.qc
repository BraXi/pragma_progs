/*QUAKED monster_mutant (1 .5 0) (-32 -32 -24) (32 32 32) Ambush Trigger_Spawn Sight

mutant.
*/

/*
idea:
vector animstate;
_x - animindex
_y - animframe
_z - animevent
*/

void() sub_null = {};

void( float a, string b ) anim_notetrack = {};
float( float a, float b ) anim_getnotetrack = { return 0; };

void(float move) ai_stand = {};
void(float move) ai_walk = {};
void(float move) ai_run = {};
void(float move) ai_charge = {};
void(float move) ai_move = {};

void() mutant_step;
void() mutant_hit_left = {};
void() mutant_hit_right = {};
void() mutant_check_refire = {};
void() mutant_jump_takeoff = {};
void() mutant_check_landing = {};

// sounds
float sound_mutant_swing, sound_mutant_hit, sound_mutant_hit2, sound_mutant_death, sound_mutant_idle, sound_mutant_pain1, sound_mutant_pain2, sound_mutant_sight, sound_mutant_search, sound_mutant_step1, sound_mutant_step2, sound_mutant_step3, sound_mutant_thud;

// animations
float anim_mutant_idle, anim_mutant_walk, anim_mutant_start_walk, anim_mutant_run;
float anim_mutant_attack1, anim_mutant_attack2;
float anim_mutant_pain1, anim_mutant_pain2, anim_mutant_pain3;
float anim_mutant_death1, anim_mutant_death2;

// animation events
float MUTANT_EV_IDLE_LOOP		= 0;
float MUTANT_EV_STEP			= 1;
float MUTANT_EV_HIT_LEFT		= 2;
float MUTANT_EV_HIT_RIGHT		= 3;
float MUTANT_EV_CHECK_REFIRE	= 4;
float MUTANT_EV_JUMP_TAKEOFF	= 5;
float MUTANT_EV_CHECK_LANDING	= 6;



/*
QUAKE 1:
case OP_STATE:
	ed = PROG_TO_EDICT(QC_VM->globals->self);
	ed->v.nextthink = QC_VM->globals->time + 0.1;
	if (a->_float != ed->v.frame)
	{
		ed->v.frame = a->_float;
	}
	ed->v.think = b->function;
	break;
			
OP_STATE is:	void() func = [ ent.frame, ent.think ] { self.nextthink = time + 0.1; .... };


PRAGMA:
case OP_STATE:
	ed = PROG_TO_EDICT(QC_VM->globals->self);

	ed->anim.index = 0; //g_anims[]
	ed->anim.frame = 0;
	ed->anim.startTime = 0;
	
	if (a->_float != ed->v.frame)
	{
		ed->anim.frame = a->_float;
	}
	ed->v.nextthink = QC_VM->globals->time + 0.1;
	ed->v.think = b->function;
	break;
			
OP_STATE is:	void() func = [ ent.animationFrame, ent.think ] { self.nextthink = time + 0.1; .... };
*/

/*void() anim_idle = [ anim_mutant_idle, sub_null ] {};
void() anim_walk = [ anim_mutant_walk, sub_null ] {};
void() anim_start_walk = [ anim_mutant_start_walk, sub_null ] {};
void() anim_run = [ anim_mutant_run, sub_null ] {};
void() anim_attack1 = [ anim_mutant_attack1, sub_null ] {};
void() anim_attack2 = [ anim_mutant_attack2, sub_null ] {};
void() anim_pain1 = [ anim_mutant_pain1, sub_null ] {};
void() anim_pain2 = [ anim_mutant_pain2, sub_null ] {};
void() anim_pain3 = [ anim_mutant_pain3, sub_null ] {};
void() anim_death1 = [ anim_mutant_death1, sub_null ] {};
void() anim_death2 = [ anim_mutant_death2, sub_null ] {};*/

void( float animIndex, float animFrame, float animEvent ) anim_mutant_event_listener =
{
	local float forwardmove = anim_getnotetrack( animIndex, animFrame );
	
	switch( animIndex )
	{
	case anim_mutant_idle:
		ai_stand(0);
		break;
		
	case anim_mutant_walk:
	case anim_mutant_start_walk:
		ai_walk( forwardmove );
		break;
		
	case anim_mutant_run:
		ai_run( forwardmove );
		if( animEvent == MUTANT_EV_STEP )
			mutant_step();
		break;	
		
	case anim_mutant_attack1:
		ai_charge( forwardmove );
		
		if( animEvent == MUTANT_EV_HIT_LEFT )
			mutant_hit_left();
		else if( animEvent == MUTANT_EV_HIT_RIGHT )
			mutant_hit_right();
		else if( animEvent == MUTANT_EV_CHECK_REFIRE )
			mutant_check_refire();	
		break;
		
	case anim_mutant_attack2:
		ai_charge( forwardmove );
		
		if( animEvent == MUTANT_EV_JUMP_TAKEOFF )
			mutant_jump_takeoff();
		else if( animEvent == MUTANT_EV_CHECK_LANDING )
			mutant_check_landing();
		break;

	case anim_mutant_pain1:
	case anim_mutant_pain2:
	case anim_mutant_pain3:	
		ai_move( forwardmove );
		break;
		
	case anim_mutant_death1:
	case anim_mutant_death2:
		break;
	}
};

void() mutant_animations =
{
	// idle
	anim_mutant_idle = anim_build( "mutant_idle", 113, 125 );
	anim_addevent( anim_mutant_idle, MUTANT_EV_IDLE_LOOP, 6 );
	
	// walk
	anim_mutant_walk = anim_build( "mutant_walk", 130, 141 );	
	anim_notetrack( anim_mutant_walk, "3;1;5;10;13;10;0;5;6;16;15;6" );
		
	// start_walk
	anim_mutant_start_walk = anim_build( "mutant_start_walk", 126, 129 );	
	anim_notetrack( anim_mutant_start_walk, "5 5 -2 1" );
	
	// run
	anim_mutant_run = anim_build( "mutant_run", 56, 61 );
	
	anim_notetrack( anim_mutant_run, "40;40;24;5;17;10" );
	anim_addevent( anim_mutant_run, 1, MUTANT_EV_STEP );
	anim_addevent( anim_mutant_run, 3, MUTANT_EV_STEP );
	
	// attack
	anim_mutant_attack1 = anim_build( "mutant_attack", 8, 14 ); //ai_charge
	
	anim_notetrack( anim_mutant_attack1, "0;0;0;0;0;0;0" );
	
	anim_addevent( anim_mutant_attack1, 3, MUTANT_EV_HIT_LEFT );
	anim_addevent( anim_mutant_attack1, 6, MUTANT_EV_HIT_RIGHT );
	anim_addevent( anim_mutant_attack1, 7, MUTANT_EV_CHECK_REFIRE );
		
	// jump
	anim_mutant_attack2 = anim_build( "mutant_attack_jump", 0, 7 );
	
	anim_notetrack( anim_mutant_attack2, "0;17;15;15;15;0;3;0" );
	
	anim_addevent( anim_mutant_attack2, 3, MUTANT_EV_JUMP_TAKEOFF );
	anim_addevent( anim_mutant_attack2, 5, MUTANT_EV_CHECK_LANDING );
		
	// pain1
	anim_mutant_pain1 = anim_build( "mutant_pain1", 34, 38 );
	anim_notetrack( anim_mutant_pain1, "4;-3;-8;2;5" );

	// pain2
	anim_mutant_pain2 = anim_build( "mutant_pain2", 39, 44 );
	anim_notetrack( anim_mutant_pain2, "-24;11;5;-2;6;4" );
	
	// pain3
	anim_mutant_pain3 = anim_build( "mutant_pain3", 45, 55 );	
	anim_notetrack( anim_mutant_pain3, "-22;3;3;2;1;1;6;3;2;0;1" );
	
	// death1
	anim_mutant_death1 = anim_build( "mutant_death1", 15, 23 );
	
	// death2
	anim_mutant_death2 = anim_build( "mutant_death2", 24, 33 );	
};

void() mutant_stand =
{
	if( !anim_find( "mutant_idle" ) )
		mutant_animations();
	 
//	self.OnAnimEvent = anim_mutant_event_listener;
	anim_play( self, anim_mutant_idle );
};

void() mutant_step =
{
	local float r;
	r = (1 + random(3));
	if (r == 0)
		playsound (self, CHAN_VOICE, sound_mutant_step1, 1, ATTN_NORM, 0);		
	else if (r == 1)
		playsound (self, CHAN_VOICE, sound_mutant_step2, 1, ATTN_NORM, 0);
	else
		playsound (self, CHAN_VOICE, sound_mutant_step3, 1, ATTN_NORM, 0);
};

void() mutant_sight =
{
	playsound(self, CHAN_VOICE, sound_mutant_sight, 1, ATTN_NORM, 0);
};

void() mutant_search =
{
	playsound(self, CHAN_VOICE, sound_mutant_search, 1, ATTN_NORM, 0);
};

void() mutant_swing =
{
	playsound(self, CHAN_VOICE, sound_mutant_swing, 1, ATTN_NORM, 0);
};

void() mutant_pain =
{
	local float	r;

	if (self.health < (self.max_health / 2))
		self.skinnum = 1; // bloody skin

	if (time < self.pain_debounce_time)
		return;

	self.pain_debounce_time = time + 3.0;

	if (difficulty == 3)
		return;	// no pain anims in nightmare

	r = random(100);
	if (r < 33)
	{
		playsound(self, CHAN_VOICE, sound_mutant_pain1, 1, ATTN_NORM, 0);
//		self->monsterinfo.currentmove = &mutant_move_pain1;
	}
	else if (r < 66)
	{
		playsound(self, CHAN_VOICE, sound_mutant_pain2, 1, ATTN_NORM, 0);
//		self->monsterinfo.currentmove = &mutant_move_pain2;
	}
	else
	{
		playsound(self, CHAN_VOICE, sound_mutant_pain1, 1, ATTN_NORM, 0);
//		self->monsterinfo.currentmove = &mutant_move_pain3;
	}	
};

void() mutant_die =
{
//	float	n;

	if (self.health <= self.gib_health)
	{
		playsound(self, CHAN_VOICE, soundindex("misc/udeath"), 1, ATTN_NORM, 0);
//		for (n= 0; n < 2; n++)
//			ThrowGib (self, "models/objects/gibs/bone/tris.md2", damage, GIB_ORGANIC);
//		for (n= 0; n < 4; n++)
//			ThrowGib (self, "models/objects/gibs/sm_meat/tris.md2", damage, GIB_ORGANIC);
//		ThrowHead (self, "models/objects/gibs/head2/tris.md2", damage, GIB_ORGANIC);
		self.deadflag = DEAD_DEAD;
		return;
	}

	if (self.deadflag == DEAD_DEAD)
		return;

	playsound(self, CHAN_VOICE, sound_mutant_death, 1, ATTN_NORM, 0);
	self.deadflag = DEAD_DEAD;
	self.takedamage = DAMAGE_YES;
	self.skinnum = 1;

/*
	if (random() < 0.5)
		self->monsterinfo.currentmove = &mutant_move_death1;
	else
		self->monsterinfo.currentmove = &mutant_move_death2;	
*/	
};


float() SP_monster_mutant =
{
	local float mdl;
	
	if( (mdl = modelindex("monsters/mutant/tris")) == 0 )
		return FALSE;
	
	sound_mutant_swing = soundindex("mutant/mutatck1");
	sound_mutant_hit = soundindex("mutant/mutatck");
	sound_mutant_hit2 = soundindex("mutant/mutatck3");
	sound_mutant_death = soundindex("mutant/mutdeth1");
	sound_mutant_idle = soundindex("mutant/mutidle1");
	sound_mutant_pain1 = soundindex("mutant/mutpain1");
	sound_mutant_pain2 = soundindex("mutant/mutpain2");
	sound_mutant_sight = soundindex("mutant/mutsght1");
	sound_mutant_search = soundindex("mutant/mutsrch1");
	sound_mutant_step1 = soundindex("mutant/step1");
	sound_mutant_step2 = soundindex("mutant/step2");
	sound_mutant_step3 = soundindex("mutant/step3");
	sound_mutant_thud = soundindex("mutant/thud1");
	
	self.movetype = MOVETYPE_STEP;
	self.solid = SOLID_BBOX;
	
	setmodelindex( self, mdl );	
	setsize( self, '-32 -32 -24', '32 32 48' );

	self.health = 300;
	self.gib_health = -120;
	self.mass = 300;

	self.pain = mutant_pain;
	self.die = mutant_die;
	
	mutant_stand();
	
	return TRUE;

/*	self->monsterinfo.stand = mutant_stand;
	self->monsterinfo.walk = mutant_walk;
	self->monsterinfo.run = mutant_run;
	self->monsterinfo.dodge = NULL;
	self->monsterinfo.attack = mutant_jump;
	self->monsterinfo.melee = mutant_melee;
	self->monsterinfo.sight = mutant_sight;
	self->monsterinfo.search = mutant_search;
	self->monsterinfo.idle = mutant_idle;
	self->monsterinfo.checkattack = mutant_checkattack;

	gi.linkentity (self);
	
	self->monsterinfo.currentmove = &mutant_move_stand;

	self->monsterinfo.scale = MODEL_SCALE;
	walkmonster_start (self);
*/	
}
