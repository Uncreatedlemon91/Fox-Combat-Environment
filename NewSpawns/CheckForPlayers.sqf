params ["_mkr"];

// RED = OPFOR 
// Green = Players 
// Blue = Friendly AI 


while {true} do
{
	_mkrPos = getMarkerPos _mkr;
    if ({_x distance _mkrPos < 1000} count allPlayers > 0) then
    {
		_color = getMarkerColor _mkr;
		if (_color == "COLORGREEN") then {

		} else {
			_mkr setMarkerColor "COLORGREEN";
			[_mkr] execVM "NewSpawns\SpawnAI.sqf";
			[_mkr] execVM "NewSpawns\CheckOwnership.sqf";
		};
    } else
    {
		_color = getMarkerColor _mkr;
		if (_color == "COLORRED") then {

		} else {
			_mkr setMarkerColor "COLORRED";
			[_mkr] execVM "NewSpawns\DespawnAI.sqf";
		};
    };
    sleep 5;
};