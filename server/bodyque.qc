
float BODY_QUEUE_SIZE = 8;
float body_que;

void SP_bodyque = {}; //just so callspawn doesn't complain

void InitBodyQue =
{
	local float		i;
	local entity 	ent;

	body_que = 0;
	for( i = 0; i < BODY_QUEUE_SIZE; i++ )
	{
		ent = CallSpawn("bodyque");
	}
}

void(float inflictor, float attacker, float damage, vector point) body_die =
{
	int	n;

	if (self.health < -40)
	{
		playsound( self, CHAN_BODY, soundindex("misc/udeath.wav"), 1, ATTN_NORM, 0 );
//		for( n = 0; n < 4; n++ )
//			ThrowGib (self, "models/objects/gibs/sm_meat/tris.md2", damage, GIB_ORGANIC);
		
		self.origin_z -= 48;
//		ThrowClientHead (self, damage);
		self.takedamage = DAMAGE_NO;
	}
};

void() CopyToBodyQue =
{
};