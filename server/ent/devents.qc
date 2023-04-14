/*QUAKED test_solid (.5 .5 1) (-15 -15 -15) (15 15 15) 
30x30x30 solid box, DEVELOPER_SCRIPT must be enabled
*/


float() SP_test_solid =
{
	local float mdl;	
	
	if(!developer_script)
		return FALSE;
	if((mdl = modelindex("dev/box_30x30x30")) == 0)
		return FALSE;
	
	setmodelindex( self, mdl );
	setsize( self, '-15 -15 -15', '15 15 15' );
	setsolid( self, SOLID_BBOX );
		
	self.movetype = MOVETYPE_NONE;
	
	return TRUE;
};

// ----------------------------------------------------------------------

void() viewthing_think =
{
	self.animframe = (self.animframe + 1) % 7;
	self.nextthink = time + frameTime;
};

/*QUAKED viewthing (0 .5 .8) (-8 -8 -8) (8 8 8)
Place one in a level to serve as an animation and model viewer. DEVELOPER_SCRIPT must be enabled
*/
float() SP_viewthing =
{
	local float mdl;	
	
	if(!developer_script)
		return FALSE;
	if((mdl = modelindex("objects/banner/tris")) == 0)
		return FALSE; // G_FreeEdict(self)

	self.movetype = MOVETYPE_NONE;
	self.solid = SOLID_BBOX;
	self.renderfx = RF_FRAMELERP;
	
	setsize( self, '-16 -16 -24', '16 16 32' );
	setmodelindex( self, mdl );
	
	self.nextthink = time + 0.5;
	self.think = viewthing_think;
	
	dprint( "viewthing spawned\n" );	
	return TRUE; //spawned succesfuly
};