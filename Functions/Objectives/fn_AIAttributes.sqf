params ["_unit", "_groupID", "_regimentName", "_regimentSide"];
_db = ["new", format ["%1 Regiments - %2 %3", _regimentSide, missionName, worldName]] call oo_inidbi;

_unit setVariable ["Regiment", _regimentName];
_unit addEventHandler ["Killed", 
	{
		_countGrp = count group _unit;
		if (_countGrp < 3) then {
			["deleteKey", [_regimentName, _groupID]] call _db;
		};

		[_unit, ["Check for Intel", {
			_regiment = _target getVariable "Regiment";
			[format ["You recognize the emblem of %1 on the soldier's uniform", _regiment]] remoteExec ["systemChat", 0, true];
		}]] remoteExec ["addAction", 0, true];
	}];

