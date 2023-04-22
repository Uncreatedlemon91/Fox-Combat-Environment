// 

_kit = profileNameSpace getVariable "Kit";

player setUnitLoadout _kit;

sleep 10;

while {true} do {
	if (alive player) then {
		_kit = getUnitLoadout player;
		profileNameSpace setVariable ["Kit", _kit];
	} else {
		profileNameSpace setVariable ["Kit", nil];
	};

	sleep 10;
};