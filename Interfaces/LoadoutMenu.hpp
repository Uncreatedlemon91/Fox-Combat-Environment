class LoadoutMenu
{
	idd = 2;
	class Controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by F. Lemon, v1.063, #Qahopu)
		////////////////////////////////////////////////////////

		class listItem: RscListbox
		{
			idc = 1500;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236041 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.527917 * safezoneH;
		};
		class pictureItem: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.236041 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.450929 * safezoneH;
		};
		class ButtonItem: RscButton
		{
			idc = 1600;
			text = "Use Loadout"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.697969 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.0659897 * safezoneH;
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.236041 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.450929 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};