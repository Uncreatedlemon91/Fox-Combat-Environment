params ["_mkr"];

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
		};
    } else
    {
        _mkr setMarkerColor "COLORRED";
		[_mkr] execVM "NewSpawns\DespawnAI.sqf";
    };
    sleep 5;
};