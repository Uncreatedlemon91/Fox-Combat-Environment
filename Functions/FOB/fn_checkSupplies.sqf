params ["_player"];

// Check the nearby area for supplies of a FOB. 
_supplyType = "B_CargoNet_01_ammo_F";
_nearObj = nearestObject [_player, _supplyType];
_dist = _player distance2D _nearObj;
_netID = netId _player;
_inBase = _player distance2D getMarkerPos "BASE";

// Check if there are supplies nearby. 
if (_inBase > 100) then {
	if (_dist < 30) then {
		// Remove the supply item 
		deleteVehicle _nearObj;
		[_nearObj] remoteExec ["fce_fnc_deleteItem", 2];
	} else {
		// Deny spawn, send player back to respawn menu 
		forceRespawn _player;
		"You are unable to spawn here...The base is out of supply!!" remoteExec ["SystemChat", _netID];
	};
};