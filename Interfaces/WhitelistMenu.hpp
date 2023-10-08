class whMenu
{
	idd = 4;
	class Controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by F. Lemon, v1.063, #Higune)
		////////////////////////////////////////////////////////

		class players: RscListbox
		{
			idc = 1500;
			x = 0.118384 * safezoneW + safezoneX;
			y = 0.235925 * safezoneH + safezoneY;
			w = 0.180494 * safezoneW;
			h = 0.539153 * safezoneH;
		};
		class whitelisted: RscListbox
		{
			idc = 1501;
			x = 0.319506 * safezoneW + safezoneX;
			y = 0.246928 * safezoneH + safezoneY;
			w = 0.134081 * safezoneW;
			h = 0.517147 * safezoneH;
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Players"; //--- ToDo: Localize;
			x = 0.195739 * safezoneW + safezoneX;
			y = 0.191913 * safezoneH + safezoneY;
			w = 0.0412557 * safezoneW;
			h = 0.0550156 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Whitelisted Roles"; //--- ToDo: Localize;
			x = 0.350448 * safezoneW + safezoneX;
			y = 0.202916 * safezoneH + safezoneY;
			w = 0.0773545 * safezoneW;
			h = 0.0440125 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "Qualifications"; //--- ToDo: Localize;
			x = 0.572197 * safezoneW + safezoneX;
			y = 0.202916 * safezoneH + safezoneY;
			w = 0.0773545 * safezoneW;
			h = 0.0440125 * safezoneH;
		};
		class quals: RscListbox
		{
			idc = 1502;
			x = 0.541256 * safezoneW + safezoneX;
			y = 0.246928 * safezoneH + safezoneY;
			w = 0.134081 * safezoneW;
			h = 0.385109 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Qualify"; //--- ToDo: Localize;
			x = 0.546413 * safezoneW + safezoneX;
			y = 0.654044 * safezoneH + safezoneY;
			w = 0.128924 * safezoneW;
			h = 0.0660187 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};
