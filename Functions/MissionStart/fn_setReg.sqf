/*
Build enemy regiment system. 
*/ 
_regimentName = format ["%1 %2 Regiment", round (random 300), selectRandom ["Infantry", "Mechanized", "Reconaissance"]];
_regimentSize = round (random [20, 40, 50]);
_regimentType = ["O_INF", "O_MECH_INF", "O_RECON"];
_regimentRank = selectRandom ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
_regimentRadius = round (random [1000, 1500, 3000]);
_regimentSupply = round (random 300);

// Build enemy commander 

_db = ["new", _regimentName] call oo_inidbi;
["write", ["Regiment Details", "Name", _regimentName]] call _db;
["write", ["Regiment Details", "Size", _regimentSize]] call _db;
["write", ["Regiment Details", "Type", _regimentType]] call _db;
["write", ["Regiment Details", "Rank", _regimentRadius]] call _db;
["write", ["Regiment Details", "Radius", _regimentRadius]] call _db;
["write", ["Regiment Details", "Supplies", _regimentSupply]] call _db;
