/*
=================
void main()
Called once at level init after BSP entities spawned
=================
*/
void() main =
{
	dprint("main()\n");

//	developer = getcvarfloat("developer");
//	developer_script = getcvarfloat("developer_script");
};


/*
=================
void StartFrame()

Called at the beginning of each server frame
=================
*/
void() StartFrame =
{	
/*	if( frameNum == 50 )
	{
		qcvmtest();
	}*/
		
//	print(PRINT_LOW,"server frame: ");
//	print(PRINT_LOW,ftos(frameNum));
//	print(PRINT_LOW,"\n");
};


/*
=================
void EndFrame()

Called at the end of each server frame
=================
*/
void() EndFrame =
{
};

