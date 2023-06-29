params ["_pos", "_gear", "_dir", "_roles", "_medData"];
player setPosATL _pos;
player setUnitLoadout _gear;
player setDir _dir;
player setVariable ["Roles", _roles];

{
	// Current result is saved in variable _x
	player setVariable _x;
} forEach _medData;

sleep 2;
systemChat "Your profile has been loaded!";
sleep 5;
systemChat format ["Welcome back %1!", name player];