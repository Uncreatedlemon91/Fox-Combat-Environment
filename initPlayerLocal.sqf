// 
_kit = profileNameSpace getVariable "PlayerKit";
_dir = profileNameSpace getVariable "PlayerDirection";
_pos = profileNameSpace getVariable "PlayerPosition";

if (isNil "_kit") then {} else {
	player setUnitLoadout _kit;
	player setDir _dir;
	player setPosASL _pos;

	player setPos position Ace_Arsenal;
};

sleep 10;

while {true} do {
	if (alive player) then {
		_kit = getUnitLoadout player;
		_pos = getPosASL player;
		_dir = getDir player;

		profileNameSpace setVariable ["PlayerKit", _kit];
		profileNameSpace setVariable ["PlayerPosition", _pos];
		profileNameSpace setVariable ["PlayerDirection", _dir];
	} else {
		profileNameSpace setVariable ["PlayerKit", nil];
		profileNameSpace setVariable ["PlayerPosition", nil];
		profileNameSpace setVariable ["PlayerDirection", nil];
	};

	sleep 2;
};