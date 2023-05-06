params ["_playerUnit", "_didJIP"];

_playerID = getplayerID _playerUnit;
_userInfo = getUserInfo _playerID;

_db = ["new", "Players"] call oo_inidbi;

_name = name _playerUnit;
_uid = getPlayerUID _playerUnit;
_section = format ["%1 - %2", _name, _uid];

_kit = ["read", [_section, "Kit"]] call _db;
_pos = ["read", [_section, "Pos"]] call _db;
_dir = ["read", [_section, "Direction"]] call _db;

