params ["_pos", "_gear", "_dir", "_roles"];
player setPosATL _pos;
player setUnitLoadout _gear;
player setDir _dir;
player setVariable ["Roles", _roles];

systemChat format ["Qualified Roles: %1", _roles];

systemChat format ["Welcome back %1!", name player];
sleep 2;
systemChat "Your profile has been loaded!";