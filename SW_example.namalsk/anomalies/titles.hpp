	class RscADetector
	{
		idd = -1;
//		movingEnable = 1;
		duration = 36000;
		fadein = 0; //?
		fadeout = 0; //?
		onLoad = "uiNamespace setVariable ['Adetector_display', _this select 0]; 0 spawn DetectorRenew;";
		onUnload="uiNamespace setVariable ['Adetector_display', nil];";
		controls[]={"back_ca2","light1_ca2","back", "light1","light2","light3","light4","light6","light7","light8","light9","lvl1","lvl2","lvl3"};

		class back_ca2
		{
				style = 48;
 			  type = 0;
				idc = 574115;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\back2.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class light1_ca2
		{
				style = 48;
 			  type = 0;
				idc = 574114;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\light1.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class back
		{
				style = 48;
 			  type = 0;
				idc = 574100;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\back.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class light1
		{
				style = 48;
 			  type = 0;
				idc = 574101;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\1.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class light2
		{
				style = 48;
 			  type = 0;
				idc = 574102;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\2.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class light3
		{
				style = 48;
 			  type = 0;
				idc = 574103;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\3.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class light4
		{
				style = 48;
 			  type = 0;
				idc = 574104;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\4.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class light6
		{
				style = 48;
 			  type = 0;
				idc = 574106;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\6.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class light7
		{
				style = 48;
 			  type = 0;
				idc = 574107;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\7.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class light8
		{
				style = 48;
 			  type = 0;
				idc = 574108;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\8.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class light9
		{
				style = 48;
 			  type = 0;
				idc = 574109;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\9.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class lvl1
		{
				style = 48;
 			  type = 0;
				idc = 574111;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\lvl1.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class lvl2
		{
				style = 48;
 			  type = 0;
				idc = 574112;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\lvl2.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
		class lvl3
		{
				style = 48;
 			  type = 0;
				idc = 574113;
				x = "0.015 * safezoneW + safezoneX";
				y = "0.478 * safezoneH + safezoneY";
				w = "0.20 * safezoneW";
				h = "0.28 * safezoneH";
				text = "anomalies\titles\lvl3.paa";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "TahomaB";
				sizeEx = 0;
		};
	};
	