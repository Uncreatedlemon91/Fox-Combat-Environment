class LoadoutMenu
{
	idd = 2;
	class Controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by F. Lemon, v1.063, #Qyrivy)
		////////////////////////////////////////////////////////

		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.258038 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.472926 * safezoneH;
			OnLBSelChanged = "_this call fce_fnc_loadoutRefresh";
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.258038 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.395938 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Select a loadout from the list"; //--- ToDo: Localize;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.664974 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.0659897 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};