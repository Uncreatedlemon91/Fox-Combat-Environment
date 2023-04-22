//
_getData = profileNameSpace getVariable "Position";
if ("_getData" isNil) then {
	while {true} do {
	_pos = getPosASL player;
	_dir = getDir player;
	_kit = getUnitLoadout player;

	profileNameSpace setVariable ["Position", _pos];
	profileNamespace setVariable ["Direction", _dir];
	profileNameSpace setVariable ["Kit", _kit];

	saveProfileNamespace;
	sleep 3;
} else {
	_getPos = profileNameSpace getVariable "Position";
	_getDir = profileNameSpace getVariable "Direction";
	_getKit = profileNameSpace getVariable "Kit";

	player setPosASL _getPos;
	player setDir _getDir;
	player setUnitLoadout _getKit;

	while {true} do {
		_pos = getPosASL player;
		_dir = getDir player;
		_kit = getUnitLoadout player;

		profileNameSpace setVariable ["Position", _pos];
		profileNamespace setVariable ["Direction", _dir];
		profileNameSpace setVariable ["Kit", _kit];

		saveProfileNamespace;
		sleep 3;
	};
};
