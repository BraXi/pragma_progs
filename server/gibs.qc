void(float damage, vector v) VelocityForDamage =
{
	v_x = 100.0 * crandom();
	v_y = 100.0 * crandom();
	v_z = 200.0 + 100.0 * random();

	if (damage < 50)
		v = v * 0.7;
	else 
		v = v * 1.2;
};

void() ClipGibVelocity =
{
	if (self.velocity_x < -300)			self.velocity_x = -300;
	else if (self.velocity_x > 300)		self.velocity_x = 300;
	
	if (self.velocity_y < -300)			self.velocity_y = -300;
	else if (self.velocity_y > 300)		self.velocity_y = 300;
	
	if (self.velocity_z < 200)			self.velocity_z = 200;	// always some upwards
	else if (self.velocity_z > 500)		self.velocity_z = 500;
};


/*
=================
gibs
=================
*/
void() gib_think =
{
	self.animFrame++;
	self.nextthink = levelTime + FRAMETIME;

	if (self.animFrame == 10)
	{
		self.think = SUB_Remove;
		self.nextthink = levelTime + 8 + random(10);
	}
};

void(entity other) gib_touch =
{
	local vector	normal_angles, right;

	if(!self.groundentity)
		return;

	self.touch = SUB_Null;

	if(plane_hit)
	{
		playsound(self, CHAN_VOICE, soundindex("misc/fhit3.wav"), 1, ATTN_NORM, 0);
		
		normal_angles = vectoangles(plane_normal);
		anglevectors(normal_angles);
		self.angles = vectoangles(v_right);
		
		if (self.modelindex == sm_meat_index)
		{
			self.animFrame++;
			self.think = gib_think;
			self.nextthink = levelTime + FRAMETIME;
		}
	}
};

void(entity inflictor, entity attacker, float damage, vector point) gib_die =
{
	remove(self);
};


void() SP_gib =
{
	self.solid = SOLID_NOT;
	self.effects |= EF_GIB;
	self.flags |= FL_NO_KNOCKBACK;
	self.takedamage = DAMAGE_YES;
	self.die = gib_die;	
};

void(string gibname, float damage, float type) ThrowGib =
{
	local entity gib;
	local vector vd, pos, size;
	float vscale;
	local entity oldself;

	gib = spawn("gib");

	size = self.size * 0.5;
	pos = self.absmin * size;
	
	gib.origin_x = pos_x + crandom() * size_x;
	gib.origin_y = pos_y + crandom() * size_y;
	gib.origin_z = pos_z + crandom() * size_z;

	setmodel(gib, gibname);
	
	if(type == GIB_ORGANIC)
	{
		gib.movetype = MOVETYPE_TOSS;
		gib.touch = gib_touch;
		vscale = 0.5;
	}
	else
	{
		gib.movetype = MOVETYPE_BOUNCE;
		vscale = 1.0;
	}

	VelocityForDamage(damage, vd);
	VectorMA(self.velocity, vscale, vd, gib.velocity);
	
	self = gib; //for ClipGibVelocity
	ClipGibVelocity();
	self = oldself;
	
	gib.avelocity_x = random()*600;
	gib.avelocity_y = random()*600;
	gib.avelocity_z = random()*600;

	gib.think = SUB_Remove;
	gib.nextthink = levelTime + 10 + random(10);

//	linkentity (gib); //setmodel links
}