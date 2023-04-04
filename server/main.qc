void() main =
{
// on level init
	local vector pos;
	
	pos = '123 456 789';
	print(PRINT_HIGH, vtos(pos));
};

void() StartFrame =
{
	print(PRINT_LOW, "server frame: " );
	print(PRINT_LOW, ftos(frameNumber) );
	print(PRINT_LOW, "\n" );
	
	if( frameNumber > 100 )
		error( "forced error" );
};

/*
void OnEntitySpawn()
Called when new entity spawns
*/
/*void() OnEntitySpawn =
{
};*/
