/*QUAKED viewthing (0 .5 .8) (-8 -8 -8) (8 8 8)

Just for the debugging level.  Don't use
SPAWNS ONLY WHEN DEVELOPER_SCRIPT IS SET ENABLED
*/

void() viewthing_think
{
	self.animframe = (self.animframe + 1) % 7;
	self.nextthink = time + frameTime;
}

float() SP_viewthing
{
	local float mdl;	
	
	if( !developer_script )
		return FALSE; // G_FreeEdict(self)
	
	if( (mdl = modelindex("objects/banner/tris")) == 0 )
		return FALSE;
	
	self.movetype = MOVETYPE_NONE;
	self.solid = SOLID_BBOX;
	self.renderfx = RF_FRAMELERP;
	
	setsize( self, '-16 -16 -24', '16 16 32' );
	setmodelindex( self, modelindex("objects/banner/tris") );
//	setmodel( self, "objects/banner/tris" );
	
	self.nextthink = time + 0.5;
	self.think = viewthing_think;
	
	dprint( "viewthing spawned\n" );	
	return TRUE; //spawned succesfuly
}