params ["_group"];
systemChat "Getting Roles";
lbClear 1500;
_roles = (getmissionlayerEntities str _group) select 0;
systemChat format ["Roles: %1", _group];
_ctrl = findDisplay 3 displayCtrl 1500;
{
	"Test" remoteExec ["systemChat", 0];
	_name = _x getVariable "RoleName";
	_ctrl lbAdd _name;
	_anim = selectRandom ["STAND1", "STAND2", "WATCH"];
	[_x, _anim, "ASIS"] call BIS_fnc_ambientAnim;
} forEach _roles;

/*
ACM_NAG_Soldier (fox_rifleman)
ACM_NAG_Soldier (fox_ammoCarrier)
ACM_NAG_Soldier_AR (fox_mg)
ACM_NAG_Soldier_CLS (fox_cls)
ACM_NAG_Soldier_GL (fox_gren)
ACM_NAG_Soldier_AT (fox_at)
ACM_NAG_Soldier_AA (fox_aa)
ACM_NAG_Soldier_Radio (fox_rto)
ACM_NAG_Soldier_TL (fox_ftl)
ACM_NAG_Soldier_Radio (fox_jtac)