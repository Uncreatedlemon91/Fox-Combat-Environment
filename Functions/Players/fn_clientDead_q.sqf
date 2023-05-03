params ["_name", "_uid"];

_db = ["new", "Dead Players"] call oo_inidbi;
_data = format ["%1 - %2", _name, _uid];

if (_data in _sections) then {
	titleText ["RIP Soldier! You have fallen in battle.\nYour new life will be provided on Saturday for the main op, and Sunday morning if you die during the op.\nPlease change to ACE Spectator to watch the round", "BLACK"]
};