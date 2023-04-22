// Get player information 

// Player Information 
_name = name player;
_uid = getPlayerUID player;
_id = clientOwner;

[_name, _uid, _id] call fce_fnc_CheckPlayerDB;
sleep 60;
while {alive Player} do {
	sleep 10;
	_pos = getPosASL player;
	_dir = getDir player;
	_kit = getUnitLoadout player

	[_name, _uid, _id, _pos, _dir, _kit] remoteExec ["fce_fnc_playerDatatoDB", 2];
};