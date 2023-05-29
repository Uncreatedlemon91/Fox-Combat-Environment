class LogiMenu
{
	idd = 1;
	class Controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by F. Lemon, v1.063, #Wycaga)
		////////////////////////////////////////////////////////

		class ListV: RscListbox
		{
			idc = 1500;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.088 * safezoneH;
			action = "closeDialog 2";
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Spawn Item"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.088 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};
