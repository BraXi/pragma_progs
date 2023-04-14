/*
============
CanDamage

Returns true if the inflictor can directly damage the targ.  
Used for explosions and melee attacks.
============
*/

float(entity targ, entity inflictor) CanDamage =
{
	// brushmodels need special checking because their origin is 0,0,0
	if (targ.movetype == MOVETYPE_PUSH)
	{
		traceline(inflictor.origin, 0.5 * (targ.absmin + targ.absmax), inflictor, MASK_SOLID);	
		if(trace_fraction == 1.0 || trace_ent == targ)
			return true;
		return false;
	}
	
	// fixme -- braxi
	// this is quite evil and too prone to exploits but that code is straight from Q2 where it worked
	// code below does 5 traces, one straight from/to origins, then next four from inflictors origin to 4 target corners
	// !BUT! it assumes corners are 15 units from origin, a target bigger than [30,30,30] could be immune to 
	// damage in quite many situations i can think of
	traceline(inflictor.origin, targ.origin, inflictor, MASK_SOLID);
	if(trace_fraction == 1.0)
		return true;

	traceline(inflictor.origin, targ.origin + '15 15 0', inflictor, MASK_SOLID);
	if(trace_fraction == 1.0)
		return true;

	traceline(inflictor.origin, targ.origin + '15 -15 0', inflictor, MASK_SOLID);
	if(trace_fraction == 1.0)
		return true;

	traceline(inflictor.origin, targ.origin + '-15 15 0', inflictor, MASK_SOLID);
	if(trace_fraction == 1.0)
		return true;

	traceline(inflictor.origin, targ.origin + '-15 -15 0', inflictor, MASK_SOLID);
	if(trace_fraction == 1.0)
		return true;

	return false;
};