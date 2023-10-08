// Spawns AI Civilians and applies logic to them. 
params ["_trg"];

// Debug 
systemChat "Civilian Spawning!";

// Get the information from the trigger
_civData = _trg getVariable "CivData";

// Unpack the data 
_name = _civData select 0;
_face = _civData select 1;
_gear = _civData select 2;
_pos = _civData select 3;
_loyalty = _civData select 4;
_languages = _civData select 5;
_civ = _civData select 6;

// Spawn the AI unit 
_grp = createGroup civilian;
_unit = _grp createUnit [_civ, _pos, [], 20, "FORM"];
_unit setPosATL _pos;

_unit setVariable ["Fox_Loyalty", _loyalty];
_unit setVariable ["Fox_Lang", _languages];
_unit setVariable ["Fox_Loy", _loyalty];

_unit setName _name;
_unit setUnitLoadout _gear;
_unit setFace _face;

// Set AI to walk around 
[_grp, _pos, 200] call BIS_fnc_taskPatrol;