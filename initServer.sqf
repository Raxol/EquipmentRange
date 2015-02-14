"spawnPacket" addPublicVariableEventHandler 
{
	if (!isNil "spawnedVeh") then
	{
		{
			if (side _x == east) then {deleteVehicle _x};
		} forEach allUnits;
		
		deleteVehicle (spawnedVeh select 0);
	};
	
	_typeVal = (_this select 1) select 0;
	_speedVal = (_this select 1) select 1;
	
	vehType = "O_MRAP_02_F";
	waypointSpeedVal = "LIMITED"; 
	
	switch (_typeVal) do 
	{ 
		case "Car": { vehType = "O_MRAP_02_F"; }; 
		case "BTR": { vehType = "O_APC_Tracked_02_cannon_F" };
		case "MBT": { vehType = "O_MBT_02_cannon_f" };
		case "Transport Heli": { vehType = "O_Heli_Transport_04_covered_F" };
		case "Attack Heli": { vehType = "O_Heli_Attack_02_F" };
	};
	
	switch (_speedVal) do 
	{ 
		case "Slow": { waypointSpeedVal = "LIMITED"; }; 
		case "Medium": { waypointSpeedVal = "NORMAL"; };
		case "Fast": { waypointSpeedVal = "FULL"; };
	};
	
	vehGroup = createGroup (createCenter east);
	
	spawnedVeh = [getMarkerPos "vehSpawn", 0, vehType, vehGroup] call BIS_fnc_spawnVehicle;

	(spawnedVeh select 0) setVehicleAmmo 0;

	_wp = vehGroup addWaypoint [getMarkerPos "vehWaypoint", 0];
	[vehGroup, 1] setWaypointBehaviour "CARELESS";
	[vehGroup, 1] setWaypointBehaviour "MOVE";
	[vehGroup, 1] setWaypointCombatMode "BLUE";
	[vehGroup, 1] setWaypointCompletionRadius 0;
	[vehGroup, 1] setWaypointFormation "NO CHANGE";
	[vehGroup, 1] setWaypointSpeed waypointSpeedVal;
	[vehGroup, 1] setWaypointStatements["true", ""];
	
	spawnTimeout = 30;
};

stt = [] execVM "spawnTimeout.sqf";