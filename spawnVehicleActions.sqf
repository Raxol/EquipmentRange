_obj = _this select 0;

AMICurrent = _obj addAction [format ["<t color='#6ad8b9'>Current Selection:</t> <t color='#009DD8'>%1</t> on <t color='#C5405B'>%2</t>", typeVal, speedVal], {}];

_obj addAction ["<t color='#009DD8'>Type:</t> Car", {typeVal = "Car"; publicVariable "typeVal";}, nil, 1, false, false, "", "typeVal == 'Attack Heli'"];
_obj addAction ["<t color='#009DD8'>Type:</t> BTR", {typeVal = "BTR"; publicVariable "typeVal";}, nil, 1, false, false, "", "typeVal == 'Car'"]; 
_obj addAction ["<t color='#009DD8'>Type:</t> MBT", {typeVal = "MBT"; publicVariable "typeVal";}, nil, 1, false, false, "", "typeVal == 'BTR'"];
_obj addAction ["<t color='#009DD8'>Type:</t> Transport Heli", {typeVal = "Transport Heli"; publicVariable "typeVal";}, nil, 1, false, false, "", "typeVal == 'MBT'"];
_obj addAction ["<t color='#009DD8'>Type:</t> Attack Heli", {typeVal = "Attack Heli"; publicVariable "typeVal";}, nil, 1, false, false, "", "typeVal == 'Transport Heli'"];

_obj addAction ["<t color='#C5405B'>Speed:</t> Slow", {speedVal = "Slow"; publicVariable "speedVal";}, nil, 1, false, false, "", "speedVal == 'Fast'"]; 
_obj addAction ["<t color='#C5405B'>Speed:</t> Medium", {speedVal = "Medium"; publicVariable "speedVal";}, nil, 1, false, false, "", "speedVal == 'Slow'"]; 
_obj addAction ["<t color='#C5405B'>Speed:</t> Fast", {speedVal = "Fast"; publicVariable "speedVal";}, nil, 1, false, false, "", "speedVal == 'Medium'"];


_obj addAction ["<t color='#00FF7F'>Spawn</t>", { spawnPacket = [typeVal, speedVal]; publicVariableServer "spawnPacket";}, nil, 1, false, false, "", "spawnTimeout <= 0"];
AMITimeout = _obj addAction [format ["<t color='#ff5757'>Spawn (%1)</t>", spawnTimeout], {}, nil, 1, false, false, "", "spawnTimeout > 0"];

call 
{
	while {true} do 
	{
		_obj setUserActionText [AMICurrent, format ["<t color='#6ad8b9'>Current Selection:</t> <t color='#009DD8'>%1</t> on <t color='#C5405B'>%2</t>", typeVal, speedVal]];
		_obj setUserActionText [AMITimeout, format ["<t color='#ff5757'>Spawn (%1)</t>", spawnTimeout]];
	}
}