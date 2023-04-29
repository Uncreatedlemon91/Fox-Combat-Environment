class LoadoutMenu
{
	idd = 2;
	class Controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by F. Lemon, v1.063, #Kycado)
		////////////////////////////////////////////////////////

		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "Imgs\SL.jpg";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.335026 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0879862 * safezoneH;
			tooltip = "Squad Leader"; //--- ToDo: Localize;
		};
		class RscPicture_1201: RscPicture
		{
			idc = 1201;
			text = "Imgs\CE.jpg";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.335026 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0879862 * safezoneH;
			tooltip = "Combat Engineer"; //--- ToDo: Localize;
		};
		class RscPicture_1202: RscPicture
		{
			idc = 1202;
			text = "Imgs\LAT.jpg";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.335026 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0879862 * safezoneH;
			tooltip = "Light Anti Tank"; //--- ToDo: Localize;
		};
		class RscPicture_1203: RscPicture
		{
			idc = 1203;
			text = "Imgs\HAT.jpg";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.335026 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0879862 * safezoneH;
			tooltip = "Heavy Anti Tank"; //--- ToDo: Localize;
		};
		class RscPicture_1204: RscPicture
		{
			idc = 1204;
			text = "Imgs\Rfl.jpg";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.456007 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0879862 * safezoneH;
			tooltip = "Rifleman"; //--- ToDo: Localize;
		};
		class RscPicture_1205: RscPicture
		{
			idc = 1205;
			text = "Imgs\FTL.jpg";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.456007 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0879862 * safezoneH;
			tooltip = "Fireteam Leader"; //--- ToDo: Localize;
		};
		class RscPicture_1206: RscPicture
		{
			idc = 1206;
			text = "Imgs\GREN.jpg";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.456007 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0879862 * safezoneH;
			tooltip = "Grenadier Kit"; //--- ToDo: Localize;
		};
		class RscPicture_1207: RscPicture
		{
			idc = 1207;
			text = "Imgs\Med.jpg";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.456007 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0879862 * safezoneH;
			tooltip = "Medical Technician"; //--- ToDo: Localize;
		};
		class RscPicture_1208: RscPicture
		{
			idc = 1208;
			text = "Imgs\Sct.jpg";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.576988 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0879862 * safezoneH;
			tooltip = "Scout"; //--- ToDo: Localize;
		};
		class RscPicture_1209: RscPicture
		{
			idc = 1209;
			text = "Imgs\AR.jpg";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.576988 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0879862 * safezoneH;
			tooltip = "Automatic Rifleman"; //--- ToDo: Localize;
		};
		class RscPicture_1210: RscPicture
		{
			idc = 1210;
			text = "Imgs\MG.jpg";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.576988 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0879862 * safezoneH;
			tooltip = "Machinegunner"; //--- ToDo: Localize;
		};
		class RscPicture_1211: RscPicture
		{
			idc = 1211;
			text = "Imgs\Pilot.jpg";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.576988 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0879862 * safezoneH;
			tooltip = "Pilot"; //--- ToDo: Localize;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			text = "Currently Qual'd in..."; //--- ToDo: Localize;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.335026 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.329948 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Exit"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.697969 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.0549914 * safezoneH;
			action = "closeDialog 2";
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Welcome"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.24704 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.0549914 * safezoneH;
		};
		class SL: RscButton
		{
			idc = 1601;
			text = "Get Kit"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.423012 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219966 * safezoneH;
			action = "call fce_fnc_sectionLeader";
		};
		class LAT: RscButton
		{
			idc = 1602;
			text = "Get Kit"; //--- ToDo: Localize;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.423012 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219966 * safezoneH;
			action = "call fce_fnc_Lightantitank";
		};
		class HAT: RscButton
		{
			idc = 1603;
			text = "Get Kit"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.423012 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219966 * safezoneH;
			action = "call fce_fnc_MissileSpec";
		};
		class CE: RscButton
		{
			idc = 1604;
			text = "Get Kit"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.423012 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219966 * safezoneH;
			action = "call fce_fnc_Engineer";
		};
		class Rfl: RscButton
		{
			idc = 1605;
			text = "Get Kit"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.543993 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219966 * safezoneH;
			action = "call fce_fnc_Rifleman";
		};
		class Crew: RscButton
		{
			idc = 1606;
			text = "Get Kit"; //--- ToDo: Localize;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.543993 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219966 * safezoneH;
			action = "call fce_fnc_fireteamleader";
		};
		class CrewL: RscButton
		{
			idc = 1607;
			text = "Get Kit"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.543993 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219966 * safezoneH;
			action = "call fce_fnc_Grenadier";
		};
		class Medic: RscButton
		{
			idc = 1608;
			text = "Get Kit"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.543993 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219966 * safezoneH;
			action = "call fce_fnc_Medic";
		};
		class Pilot: RscButton
		{
			idc = 1609;
			text = "Get Kit"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.664974 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219966 * safezoneH;
			action = "call fce_fnc_Pilot";
		};
		class MG: RscButton
		{
			idc = 1610;
			text = "Get Kit"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.664974 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219966 * safezoneH;
			action = "call fce_fnc_Machinegunner";
		};
		class AR: RscButton
		{
			idc = 1611;
			text = "Get Kit"; //--- ToDo: Localize;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.664974 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219966 * safezoneH;
			action = "call fce_fnc_AutoRifleman";
		};
		class Sct: RscButton
		{
			idc = 1612;
			text = "Get Kit"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.664974 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219966 * safezoneH;
			action = "call fce_fnc_Scout";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////


	};
};