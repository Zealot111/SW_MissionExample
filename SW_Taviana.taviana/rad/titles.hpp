	class goggles {
	  idd = -1;
	  movingEnable = 0;
	  duration = 10000;
	  fadein = 0;
	  fadeout = 0;
	  name="goggles";

	  controls[]={"goggles"};

	  class goggles {
		 x=safeZoneX; y=safeZoneY; w=safeZoneW; h=safeZoneH;
		 text="rad\goggles.paa";
		 sizeEx = 1;
		 type=0;
		 idc=-1;
		 style=48;
		 colorBackground[]={0,0,0,0};
		 colorText[]={1,1,1,1};
		 font="EtelkaMonospacePro";
		};
	};
	
	class RscZltRadex
	{
		idd = -1;
		movingEnable = 1;
		duration = 36000;
		fadein = 0;
		fadeout = 0;
		onLoad = "uiNamespace setVariable ['Zlt_radex_display', _this select 0]; 0 spawn ZRadexRenew;";
		onUnload="uiNamespace setVariable ['Zlt_radex_display', nil];";
		controls[]={"back","heading"};

		class back
		{
				style = 48;
				type = 0;
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
			
				idc = 918592;
				x = "0.835156 * safezoneW + safezoneX";
				y = "0.522 * safezoneH + safezoneY";
				w = "0.165 * safezoneW";
				h = "0.22 * safezoneH";
				text = "rad\radex_bg2.paa";
				
		};
		class heading
		{
				type = 0;
				idc = 918591;
				x = "0.897031 * safezoneW + safezoneX";
				y = "0.577 * safezoneH + safezoneY";
				w = "0.07125 * safezoneW";
				h = "0.055 * safezoneH";
				style = 0;
				text = "0.0 R";
				colorText[] = {0.25,0.25,0.25,1};
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,1,0,1};
				shadow = 0.5;
				colorShadow[] = {0,0,0,0.5};				
				font = "EtelkaMonospacePro";
				SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";				
		};
	};
