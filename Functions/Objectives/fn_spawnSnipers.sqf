// Function spawns enemy snipers / recon members who will hunt down / stalk players within the vicinity. 
params ["_pos"];

// Variables 

// Get Classnames of the snipers and make a group 
_sniperTeamClasses = ["ACM_HDF_Soldier_LI_MR", "ACM_HDF_Soldier_LI_Expl", "ACM_HDF_Soldier_LI_CLS", "ACM_HDF_Soldier_LI_AT, ACM_HDF_Soldier_LI_AA"];
_sniperTeamCount = round (random [3, 5, 7]);

_grp = createGroup east;
for "_i" from 1 to _sniperTeamCount do {
	_unit = _grp createUnit [selectRandom _sniperTeamClasses, _pos, [], 10, "FORM"];
	_unit setVariable ["Regiment", "Ministry of Intelligence"];
	_unit setRank "COLONEL";
};

// Find nearest players and select a target from among them 
_pos = getPos leader _grp;
_playerList = allPlayers apply {[_pos distance _x, _x]};
_playerList sort true;
_closestPlayer = (_playerList select 0) param [1, objNull];
_dist = _closestPlayer distance2d _pos;

_loop = true;
while {_loop} do {
	[_grp] call lambs_wp_fnc_taskReset;
	_countGrp = { alive _x } count units _grp;
	if (_dist < 500) then {
		[_grp, 500] spawn lambs_wp_fnc_taskCreep;
		if (_countGrp < 2) then {
			_loop = false;
		};
	} else {
		[_grp, _pos, 50] call lambs_wp_fnc_taskCamp;
		if (_countGrp < 2) then {
			_loop = false;
		};
	};
	sleep 300;
};
