void() main =
{
	// on level init
	print("server frame");
//	developer = getcvarfloat("developer");
//	developer_script = getcvarfloat("developer_script");
	
//	difficulty = ceil(cvar_asfloat("skill"));
};

void() StartFrame =
{
	print("server frame: ");
	print(ftos(frameNum));
	print("\n");
};

/*
void OnEntitySpawn()
Called when new entity spawns
*/
/*void() OnEntitySpawn =
{
};*/
