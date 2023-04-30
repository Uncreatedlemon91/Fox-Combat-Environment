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
	_x removeItem "ItemRadio";
	_x removeItem "ItemGPS";

	_attachments = primaryWeaponItems _x;
	_approvedAttachments = ["CUP_optic_Aimpoint_5000", "optic_mrco", "ace_acc_pointer_green"];
	_player = _x;
	{
		
		if (_x in _attachments) then {} else {
			_player removePrimaryWeaponItem _x;
		};
		sleep 0.5;
	} forEach _attachments;

	if (alive player) then {
		_status = _x getVariable "ACE_isUnconcious";
		if (_status) then {
			profileNameSpace setVariable ["PlayerKit", nil];
			profileNameSpace setVariable ["PlayerPosition", nil];
			profileNameSpace setVariable ["PlayerDirection", nil];
		};
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