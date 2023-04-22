// 
_getData = profileNameSpace getVariable "Pos";
if (isNil "_getData") then {
	player setPos position ace_arsenal;
} else {
	_pos = profileNameSpace getVariable "Pos";
	_dir = profileNameSpace getVariable "Dir";
	_kit = profileNameSpace getVariable "Kit";

	player setPosASL _pos;
	player setDir _dir;
	player setUnitLoadout _kit;
};

sleep 10;

while {true} do {
	if (alive player) then {
		_pos = getPosASL player;
		_dir = getDir player;
		_kit = getUnitLoadout player;

		profileNameSpace setVariable ["Pos", _pos];
		profileNameSpace setVariable ["Dir", _dir];
		profileNameSpace setVariable ["Kit", _kit];
	} else {
		profileNameSpace setVariable ["Pos", nil];
		profileNameSpace setVariable ["Dir", nil];
		profileNameSpace setVariable ["Kit", nil];
	};

	sleep 10;
};