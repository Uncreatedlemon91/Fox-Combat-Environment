class LogiMenuNew
{
	idd = 1;
	class Controls
	{
		class Backgr: IGUIBack
		{
			idc = 2200;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class Img: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.429 * safezoneH;
		};
		class category: RscListbox
		{
			idc = 1500;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.517 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Spawn"; //--- ToDo: Localize;
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Exit"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class item: RscListbox
		{
			idc = 1501;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.517 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};