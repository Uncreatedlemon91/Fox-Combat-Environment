_list = findDisplay 2 displayCtrl 1500;
_lbCurSel = lbCurSel _list; 
_class = _list lbData _lbCurSel;
_loadout = getUnitLoadout (configFile >> "CfgVehicles" >> _class);
player setUnitLoadout _loadout;

player removeItem ItemGPS;
player removeItem ItemRadio;

Player addItemToUniform "ACE_EarPlugs";
Player addItemToUniform "ACRE_PRC343";
