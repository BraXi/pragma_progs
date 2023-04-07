void() ClientConnect =
{
	//self
	bprint(PRINT_MEDIUM, "ClientConnect()");
};

void() ClientDisconnect =
{
	//self
	bprint(PRINT_MEDIUM, "ClientDisconnect()");
};

void() ClientSpawn =
{
	//self
	bprint(PRINT_MEDIUM, "ClientSpawn()");
};

/*//unused for now
void() ClientSpectatorSpawn =
{
	bprint(PRINT_MEDIUM, "ClientSpectatorSpawn()");
};

void() ClientDamage =
{
	//self, other, iDamage, point, direction, iMOD
};
void() ClientKilled =
{
	//self, other, iDamage, point, direction, iMOD
};

void() SavePersistentData =
{
	//saves all client data to cl->parms for level transitions
};

void() RestorePersistentData =
{
	// restores client parms
};
*/
