////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Lemon, v1.063, #Guhilo)
////////////////////////////////////////////////////////
class NewLoadoutMenu
{
	idd = 3;
	class Controls
	{
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			text = "Select Organization"; //--- ToDo: Localize;
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
			onLoad = "call fce_fnc_addEh";
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.484 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			x = 0.711405 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class RscButtonMenu_2400: RscButtonMenu
		{
			idc = 2400;
			text = "Grab Loadout"; //--- ToDo: Localize;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.088 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};