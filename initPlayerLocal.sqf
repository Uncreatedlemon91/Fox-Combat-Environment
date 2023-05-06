_name = name player;
_uid = getPlayerUID player;

[_name, _uid, clientOwner] remoteExec ["fce_fnc_clientDeadQ", 2];
[_name, _uid, clientOwner] remoteExec ["fce_fnc_DbToClient", 2];

while {true} do {
	_specs = [] call ace_spectator_fnc_players;
	player removeItem "ItemRadio";
	player removeItem "ItemGPS";

	_attachments = primaryWeaponItems player;
	_approvedAttachments = ["CUP_optic_Aimpoint_5000", "ace_acc_pointer_green", "ace_optic_lrps_pip", "cup_bipod_harris_1a2_l_blk", "cup_muzzle_snds_kzrzp_ak545"];

	{
		if (_x in _approvedAttachments) then {} else {	
			player removePrimaryWeaponItem _x;
		};
		sleep 0.5;
	} forEach _attachments;

	if ((alive player) && !(_name in _specs)) then {
		_kit = getUnitLoadout player;
		_pos = getPosATL player;
		_dir = getDir player;

		_name = name player;
		_uid = getPlayerUID player;
		_clientID = clientOwner;
		[_kit, _pos, _dir, _name, _uid, _clientID] remoteExec ["fce_fnc_clientToDb", 2];
	} else {
		_name = name player;
		_uid = getPlayerUID player;
		_kit = [];
		_pos = [874.92,3012.66,0.0999985];
		_dir = random 360;
		_clientID = clientOwner;

		[_kit, _pos, _dir, _name, _uid, _clientID] remoteExec ["fce_fnc_clientToDb", 2];
		[_name, _uid] remoteExec ["fce_fnc_deadPlayer", 2];
	};

	sleep 2;
};