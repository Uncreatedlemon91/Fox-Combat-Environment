// find locations on the map. 
["base", ["NameVillage", "NameLocal", "NameCity", "NamyCityCapital", "Strategic", "StrongholdPointArea", "Hill", "VegetationBroadLead", "VegetationFir", "VegetationPalm", "VegetationVineyard"]] remoteExec ["fce_fnc_Find_Objectives", 2];

// Create Regiments on the map
_bCount = round (random 10);
_oCount = round (random 30);
[_bCount, "B"] remoteExec ["fce_fnc_CreateRegiment", 2];
[_oCount, "O"] remoteExec ["fce_fnc_CreateRegiment", 2];

