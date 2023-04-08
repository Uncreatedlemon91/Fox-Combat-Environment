params ["_type", "_faction"];
_classData = ("true" configClasses (configfile >> "CfgGroups" >> "EAST" >> _faction >> _type)) apply {configName _x};
_class = selectRandom _classData;
_spawnGroup = "true" configClasses (configFile >> "CfgGroups" >> "EAST" >> _faction >> _type >> _class);

