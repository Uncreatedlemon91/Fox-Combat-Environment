// Get all locations on the map 
[] remoteExec ["fce_fnc_Objectives", 2];

// Add artillery around the map 
_count = round (random [15, 25, 35]);
[_count] remoteExec ["fce_fnc_spawnArtillery", 2];

// Add SAM and AA Sites around the map 
_count = round (random [15, 25, 35]);
[_count] remoteExec ["fce_fnc_spawnAASite", 2];