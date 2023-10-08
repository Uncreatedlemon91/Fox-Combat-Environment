// Load player data and apply it to the player unit 
params ["_pos", "_gear", "_dir", "_roles", "_curRole", "_kit"];

// player setPosATL _pos;
player setUnitLoadout _gear;

// player setDir _dir;
player setVariable ["roleLoadout", _curRole];
player setVariable ["fox_loadout_kit", _kit];

// Add a respawn point to the map
[player, _pos, "Last Known Location"] call BIS_fnc_addRespawnPosition;