
float intermissiontime = 0;


void() PutClientInServer = {dprint("PutClientInServer()\n");};
void() MoveClientToIntermission = {dprint("MoveClientToIntermission()\n");};

void() ClientBeginServerFrame =
{
	if( IsPlayer(self) == 0 )
		Error("ClientBeginServerFrame: not a player\n");
	
	
	dprint("ClientBeginServerFrame(): for ent #");
	dprint( ftos(GetEntNum(self)) );
	dprint(" at frame ");
	dprint( ftos(frameNum) );
	dprint("\n");
	
};


/*
===========
ClientBegin

called when a client has finished connecting, and is ready
to be placed into the game.  This will happen every level load.
============
*/
void() ClientBegin =
{
	dprint("ClientBegin()\n");
	
	PutClientInServer();
	
	centerprint( self, "welcome to pragma engine!" );
	
	if (intermissiontime)
	{
		MoveClientToIntermission();
		return;
	}

	// send effect if in a multiplayer game
	if(GetCvarFloat("maxclients") > 1)
	{
		// braxi -- add net builtins
/*		WriteByte(svc_muzzleflash);
		WriteShort(GetEntNum(self));
		WriteByte(MZ_LOGIN);
		multicast(self.origin, MULTICAST_PVS);
*/
	}
};

/*
===========
ClientConnect

Called when a player begins connecting to the server.
Server progs can refuse entrance to a client by returning false.
If the client is allowed, the connection process will continue and eventually get to ClientBegin()
Changing levels will NOT cause this to be called again, but loadgames will.
============
*/
float() ClientConnect =
{
	dprint("ClientConnect()\n");
	return true;
};

/*
===========
ClientDisconnect

Called when a player drops from the server.
Will not be called between levels.
============
*/
void() ClientDisconnect =
{
	dprint("ClientDisconnect()\n");
	
/*	WriteByte( svc_muzzleflash );
	WriteShort( getentnum(self) );
	WriteByte( MZ_LOGOUT );
	MultiCast( self.origin, MULTICAST_PVS );*/
};

void() ClientSpawn =
{
	//self
	bprint(PRINT_MEDIUM, "ClientSpawn()");
};

/*
==============
InitClientPersistant

This is only called when the game first initializes in single player,
but is called after each death and level change in deathmatch
==============
*/
void() InitClientPersistant =
{
/*
	self.selected_item 	= 0;
	self.weapon 		= 0;

	self.health			= 100;
	self.max_health		= 100;

	self.max_bullets	= 200;
	self.max_shells		= 100;
	self.max_rockets	= 50;
	self.max_grenades	= 50;
	self.max_cells		= 200;
	self.max_slugs		= 50;
*/
};