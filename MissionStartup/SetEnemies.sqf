_countAI = round (random [1000, 1300, 1500]);

for "_i" from 1 to _countAI do {
	_pos = [["Base"], []] call BIS_fnc_randomPos;
	_mkrtype = selectRandom ["O_INF", "O_ARMOR", "O_MOTOR_INF", "O_AIR", "O_ART", "O_MECH_INF", "O_MORTAR"];

	_mkr = createMarker [format ["%1 - %2", _pos, _mkrType]];
	_mkr setMarkerType _mkrType;
	_mkr setMarkerSize [0.7, 0.7];

	_trg = createTrigger ["EmptyDetector", _pos, true];
	_trg setTriggerArea [800, 800, 0, false];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trg setTriggerStatements ["this", "_mkr = thisTrigger getvariable 'grpMkr'; [_mkr] call fce_fnc_spawnmkrgrp", ""];
	
}
