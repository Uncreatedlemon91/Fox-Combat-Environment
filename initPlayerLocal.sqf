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
	player removeItem "ItemRadio";
	player removeItem "ItemGPS";

	_attachments = primaryWeaponItems player;
	_approvedAttachments = ["CUP_optic_Aimpoint_5000", "optic_mrco", "ace_acc_pointer_green", "ace_optic_lrps_pip", "cup_bipod_harris_1a2_l_blk"];

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
		profileNameSpace setVariable ["PlayerKit", nil];
		profileNameSpace setVariable ["PlayerPosition", nil];
		profileNameSpace setVariable ["PlayerDirection", nil];
	};

	sleep 2;
};