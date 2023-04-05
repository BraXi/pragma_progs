/*QUAKED monster_mutant (1 .5 0) (-32 -32 -24) (32 32 32) Ambush Trigger_Spawn Sight

mutant.
*/

void() ai_stand = {};
// sounds
float ai_mutant_snd_swing, ai_mutant_snd_hit, ai_mutant_snd_hit2, ai_mutant_snd_death, ai_mutant_snd_idle, ai_mutant_snd_pain1, ai_mutant_snd_pain2, ai_mutant_snd_sight, ai_mutant_snd_search, ai_mutant_snd_step1, ai_mutant_snd_step2, ai_mutant_snd_step3, ai_mutant_snd_thud;


$frame stand1 stand2 stand3 stand4 stand5 stand6 stand7 stand8 stand9
$frame stand10 stand11 stand12 stand13 stand14 stand15 stand16 stand17 stand18 
$frame stand19
$frame stand20 stand21 stand22 stand23 stand24 stand25 stand26 stand27 stand28 stand29
$frame stand30 stand31 stand32 stand33 stand34 stand35 stand36 stand37 stand38 stand39
$frame stand40 stand41 stand42 stand43 stand44 stand45 stand46 stand47 stand48 stand49 
$frame stand50

// -------------------------------------------------------------------
// the oldschool way
// -------------------------------------------------------------------
void() mutant_stand1 = [ $stand1, mutant_stand2 ] {ai_stand();};
void() mutant_stand2 = [ $stand2, mutant_stand3 ] {ai_stand();};
void() mutant_stand3 = [ $stand3, mutant_stand4 ] {ai_stand();};
void() mutant_stand4 = [ $stand4, mutant_stand5 ] {ai_stand();};
void() mutant_stand5 = [ $stand5, mutant_stand6 ] {ai_stand();};
void() mutant_stand6 = [ $stand6, mutant_stand7 ] {ai_stand();};
void() mutant_stand7 = [ $stand7, mutant_stand8 ] {ai_stand();};
void() mutant_stand8 = [ $stand8, mutant_stand9 ] {ai_stand();};
void() mutant_stand9 = [ $stand9, mutant_stand10 ] {ai_stand();};
void() mutant_stand10 = [ $stand10, mutant_stand11 ] {ai_stand();};
void() mutant_stand11 = [ $stand11, mutant_stand12 ] {ai_stand();};
void() mutant_stand12 = [ $stand12, mutant_stand13 ] {ai_stand();};
void() mutant_stand13 = [ $stand13, mutant_stand14 ] {ai_stand();};
void() mutant_stand14 = [ $stand14, mutant_stand15 ] {ai_stand();};
void() mutant_stand15 = [ $stand15, mutant_stand16 ] {ai_stand();};
void() mutant_stand16 = [ $stand16, mutant_stand17 ] {ai_stand();};
void() mutant_stand17 = [ $stand17, mutant_stand18 ] {ai_stand();};
void() mutant_stand18 = [ $stand18, mutant_stand19 ] {ai_stand();};
void() mutant_stand19 = [ $stand19, mutant_stand20 ] {ai_stand();};
void() mutant_stand20 = [ $stand20, mutant_stand21 ] {ai_stand();};
void() mutant_stand21 = [ $stand21, mutant_stand22 ] {ai_stand();};
void() mutant_stand22 = [ $stand22, mutant_stand23 ] {ai_stand();};
void() mutant_stand23 = [ $stand23, mutant_stand24 ] {ai_stand();};
void() mutant_stand24 = [ $stand24, mutant_stand25 ] {ai_stand();};
void() mutant_stand25 = [ $stand25, mutant_stand26 ] {ai_stand();};
void() mutant_stand26 = [ $stand26, mutant_stand27 ] {ai_stand();};
void() mutant_stand27 = [ $stand27, mutant_stand28 ] {ai_stand();};
void() mutant_stand28 = [ $stand28, mutant_stand29 ] {ai_stand();};
void() mutant_stand29 = [ $stand29, mutant_stand30 ] {ai_stand();};
void() mutant_stand30 = [ $stand30, mutant_stand31 ] {ai_stand();};
void() mutant_stand31 = [ $stand31, mutant_stand32 ] {ai_stand();};
void() mutant_stand32 = [ $stand32, mutant_stand33 ] {ai_stand();};
void() mutant_stand33 = [ $stand33, mutant_stand34 ] {ai_stand();};
void() mutant_stand34 = [ $stand34, mutant_stand35 ] {ai_stand();};
void() mutant_stand35 = [ $stand35, mutant_stand36 ] {ai_stand();};
void() mutant_stand36 = [ $stand36, mutant_stand37 ] {ai_stand();};
void() mutant_stand37 = [ $stand37, mutant_stand38 ] {ai_stand();};
void() mutant_stand38 = [ $stand38, mutant_stand39 ] {ai_stand();};
void() mutant_stand39 = [ $stand39, mutant_stand40 ] {ai_stand();};
void() mutant_stand40 = [ $stand40, mutant_stand41 ] {ai_stand();};
void() mutant_stand41 = [ $stand41, mutant_stand42 ] {ai_stand();};
void() mutant_stand42 = [ $stand42, mutant_stand43 ] {ai_stand();};
void() mutant_stand43 = [ $stand43, mutant_stand44 ] {ai_stand();};
void() mutant_stand44 = [ $stand44, mutant_stand45 ] {ai_stand();};
void() mutant_stand45 = [ $stand45, mutant_stand46 ] {ai_stand();};
void() mutant_stand46 = [ $stand46, mutant_stand47 ] {ai_stand();};
void() mutant_stand47 = [ $stand47, mutant_stand48 ] {ai_stand();};
void() mutant_stand48 = [ $stand48, mutant_stand49 ] {ai_stand();};
void() mutant_stand49 = [ $stand49, mutant_stand50 ] {ai_stand();};
void() mutant_stand50 = [ $stand50, mutant_stand1 ] {ai_stand();};


// -------------------------------------------------------------------
// the new method
// -------------------------------------------------------------------
float mutant_anim_stand;

float MUTANT_EV_STAND = 0;
float MUTANT_EV_STAND_END = 1;

void( float animIndex, float animEvent ) mutant_anim_event_listener =
{
	// events cannot overlap!!!!!!
	if( animIndex == mutant_anim_stand )
	{
		if( animEvent == MUTANT_EV_STAND )
		{
			ai_stand();
		}
		else if( animEvent == MUTANT_EV_STAND_END )
		{
			ai_stand();
	//		anim_play( self, anim_stand );
		}
	}
};

void() mutant_stand_init =
{
	mutant_anim_stand = anim_build( "mutant_stand", $stand1, $stand50 ); // stand frames [$stand1,$stand50]
	
	anim_addeventrange( mutant_anim_stand, MUTANT_EV_STAND, $stand1, 48 );
	anim_addevent( mutant_anim_stand, MUTANT_EV_STAND_END, $stand50 );
	
	anim_setlooping( mutant_anim_stand, TRUE );
};

void() mutant_stand =
{
	if( !anim_find( "mutant_stand" ) )
		 mutant_stand_init();
	 
	self.OnAnimEvent = mutant_anim_event_listener;
	anim_playindex( self, mutant_anim_stand );
};

void() mutant_step =
{
	local float r;
	r = (rand() + 1) % 3;
	if (r == 0)
		playsound (self, CHAN_VOICE, ai_mutant_snd_step1, 1, ATTN_NORM, 0);		
	else if (r == 1)
		playsound (self, CHAN_VOICE, ai_mutant_snd_step2, 1, ATTN_NORM, 0);
	else
		playsound (self, CHAN_VOICE,ai_mutant_snd_step3, 1, ATTN_NORM, 0);
};

void() mutant_sight =
{
	playsound(self, CHAN_VOICE, ai_mutant_snd_sight, 1, ATTN_NORM, 0);
};

void() mutant_search =
{
	playsound(self, CHAN_VOICE, ai_mutant_snd_search, 1, ATTN_NORM, 0);
};

void() mutant_swing =
{
	playsound(self, CHAN_VOICE, ai_mutant_snd_swing, 1, ATTN_NORM, 0);
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

	r = random();
	if (r < 0.33)
	{
		playsound(self, CHAN_VOICE, ai_mutant_snd_pain1, 1, ATTN_NORM, 0);
//		self->monsterinfo.currentmove = &mutant_move_pain1;
	}
	else if (r < 0.66)
	{
		playsound(self, CHAN_VOICE, ai_mutant_snd_pain2, 1, ATTN_NORM, 0);
//		self->monsterinfo.currentmove = &mutant_move_pain2;
	}
	else
	{
		playsound(self, CHAN_VOICE, ai_mutant_snd_pain1, 1, ATTN_NORM, 0);
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

	playsound(self, CHAN_VOICE, ai_mutant_snd_death, 1, ATTN_NORM, 0);
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
	
	ai_mutant_snd_swing = soundindex("mutant/mutatck1");
	ai_mutant_snd_hit = soundindex("mutant/mutatck");
	ai_mutant_snd_hit2 = soundindex("mutant/mutatck3");
	ai_mutant_snd_death = soundindex("mutant/mutdeth1");
	ai_mutant_snd_idle = soundindex("mutant/mutidle1");
	ai_mutant_snd_pain1 = soundindex("mutant/mutpain1");
	ai_mutant_snd_pain2 = soundindex("mutant/mutpain2");
	ai_mutant_snd_sight = soundindex("mutant/mutsght1");
	ai_mutant_snd_search = soundindex("mutant/mutsrch1");
	ai_mutant_snd_step1 = soundindex("mutant/step1");
	ai_mutant_snd_step2 = soundindex("mutant/step2");
	ai_mutant_snd_step3 = soundindex("mutant/step3");
	ai_mutant_snd_thud = soundindex("mutant/thud1");
	
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
