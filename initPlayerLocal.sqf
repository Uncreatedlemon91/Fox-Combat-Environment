_name = name player;
_uid = getPlayerUID player;

[_name, _uid] remoteExec ["fce_fnc_clientDeadQ", 2];
[_name, _uid, clientOwner] remoteExec ["fce_fnc_DbToClient", 2];

while {true} do {
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

	if (alive player) then {
		_kit = getUnitLoadout player;
		_pos = getPosASL player;
		_dir = getDir player;

		profileNameSpace setVariable ["PlayerKit", _kit];
		profileNameSpace setVariable ["PlayerPosition", _pos];
		profileNameSpace setVariable ["PlayerDirection", _dir];

		_name = name player;
		_uid = getPlayerUID player;
		_clientID = clientOwner;
		[_kit, _pos, _dir, _name, _uid, _clientID] remoteExec ["fce_fnc_clientToDb", 2];
	} else {
		_name = name player;
		_uid = getPlayerUID player;
		profileNameSpace setVariable ["PlayerKit", nil];
		profileNameSpace setVariable ["PlayerPosition", nil];
		profileNameSpace setVariable ["PlayerDirection", nil];
		[_name, _uid] remoteExec ["fce_fnc_deadPlayer", 2];
	};

	sleep 2;
};