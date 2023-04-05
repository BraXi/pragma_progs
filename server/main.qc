void() main =
{
	// on level init
	
	developer = ceil( cvar_asfloat("developer") );
	developer_script = ceil( cvar_asfloat("developer_script") );
	
	difficulty = ceil(cvar_asfloat("skill"));
};

void() StartFrame =
{
//	print(PRINT_LOW, "server frame: " );
//	print(PRINT_LOW, ftos(frameNumber) );
//	print(PRINT_LOW, "\n" );
};

/*
void OnEntitySpawn()
Called when new entity spawns
*/
/*void() OnEntitySpawn =
{
};*/
