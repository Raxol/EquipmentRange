while {true} do 
{
	while {spawnTimeout > 0} do 
	{
		spawnTimeout = spawnTimeout - 1;
		publicVariable "elapsedSpawnTimeout";
		sleep 1;
	};
}