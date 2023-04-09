class LogiMenu
{
	idd 1;
	class Controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by F. Lemon, v1.063, #Mutyxe)
		////////////////////////////////////////////////////////

		class Button_Purchase: RscButton
		{
		idc = 1600;
		text = "Purchase"; //--- ToDo: Localize;
		x = 0.603125 * safezoneW + safezoneX;
		y = 0.687 * safezoneH + safezoneY;
		w = 0.0928125 * safezoneW;
		h = 0.066 * safezoneH;
		};
		class Button_Balance: RscButton
		{
		idc = 1601;
		text = "Check Balance"; //--- ToDo: Localize;
		x = 0.505156 * safezoneW + safezoneX;
		y = 0.687 * safezoneH + safezoneY;
		w = 0.0928125 * safezoneW;
		h = 0.066 * safezoneH;
		};
		class List_Items: RscListbox
		{
		idc = 1500;
		x = 0.304062 * safezoneW + safezoneX;
		y = 0.247 * safezoneH + safezoneY;
		w = 0.190781 * safezoneW;
		h = 0.506 * safezoneH;
		};
		class RscPicture_1200: RscPicture
		{
		idc = 1200;
		text = "#(argb,8,8,3)color(1,1,1,1)";
		x = 0.505156 * safezoneW + safezoneX;
		y = 0.247 * safezoneH + safezoneY;
		w = 0.190781 * safezoneW;
		h = 0.418 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
