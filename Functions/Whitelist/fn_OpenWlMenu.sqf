// Open list of players on the database 
// Show all the roles available to the company 
// Allow members of S6 and S7 to add and remove player roles 
params ["_players", "_quals"];
// Create interface 
_playerid = getPlayerUID player;
_approved = [
	"76561197976414714" // Lemon
];
if !(_playerid in _approved) exitWith {systemChat "You are not qualified to open this menu!"};
createDialog "whMenu";

// Add player info to menu 
_playerList = findDisplay 4 displayCtrl 1500;
{
	_name = _x select 0;
	_uid = _x select 1;

	_listed = _playerList lbAdd _name;
	_playerList lbSetData [_listed, _uid];
} forEach _players;

_qualList = findDisplay 4 displayCtrl 1502;
{
	_listed = _qualList lbAdd _x;
} forEach _quals;

_whitelistButton = findDisplay 4 displayCtrl 1600;
_whitelistButton buttonSetAction "closeDialog 2; _selected = player getVariable ""fox_wl_btn_data""; _uid = player getVariable ""fox_wl_btn_playeruid""; [_selected, _uid] remoteExec [""fce_fnc_UpdateWL"", 2]";


_qualList ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];
	_selected = _control lbText _lbCurSel;
	player setVariable ["fox_wl_btn_data", _selected, true];
}];

_playerList ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];
	_uid = _control lbData _lbCurSel;
	player setVariable ["fox_wl_btn_playeruid", _uid, true];
	[_control, _lbCurSel] remoteExec ["fce_fnc_getWLData", 2];
}];
