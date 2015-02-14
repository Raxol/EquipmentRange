waitUntil {time > 0};
["Preload"] call BIS_fnc_arsenal;
_nul = [vehSpawnController] execVM "spawnVehicleActions.sqf";