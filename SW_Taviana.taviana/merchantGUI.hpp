/* #Hucery
$[
	1.063,
	["ss",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2100,"",[2,"",["11 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","17.5 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"",[2,"",["1 * GUI_GRID_W + GUI_GRID_X","4 * GUI_GRID_H + GUI_GRID_Y","17 * GUI_GRID_W","12 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"",[2,"",["32 * GUI_GRID_W + GUI_GRID_X","17 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1401,"",[2,"",["1 * GUI_GRID_W + GUI_GRID_X","17 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1501,"",[2,"",["21.5 * GUI_GRID_W + GUI_GRID_X","4 * GUI_GRID_H + GUI_GRID_Y","17.5 * GUI_GRID_W","12 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"",[2,">",["19 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","1.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"",[2,">>",["19 * GUI_GRID_W + GUI_GRID_X","7.5 * GUI_GRID_H + GUI_GRID_Y","1.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"",[2,"<",["19 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","1.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1603,"",[2,"<<",["19 * GUI_GRID_W + GUI_GRID_X","12.5 * GUI_GRID_H + GUI_GRID_Y","1.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2600,"",[2,"",["37 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","2 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2700,"",[2,"",["1 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"",[2,"#(argb,8,8,3)color(1,1,1,1)",["0 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","3 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"",[2,"#(argb,8,8,3)color(1,1,1,1)",["36 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","3 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"",[0,"",[0,0,1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/


#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

//--- ss
#define IDC_SS_RSCTEXT_1000		1115
#define IDC_SS_RSCPICTURE_1200		1315
#define IDC_SS_RSCPICTURE_1201		1316
#define IDC_SS_RSCEDIT_1400		1515
#define IDC_SS_RSCEDIT_1401		1516
#define IDC_SS_RSCLISTBOX_1500		1615
#define IDC_SS_RSCLISTBOX_1501		1616
#define IDC_SS_RSCBUTTON_1600		1715
#define IDC_SS_RSCBUTTON_1601		1716
#define IDC_SS_RSCBUTTON_1602		1717
#define IDC_SS_RSCBUTTON_1603		1718
#define IDC_SS_RscComboSelectBuySellMode		2215
#define IDC_SS_RSCBUTTONMENUOK_2600	2715
#define IDC_SS_RSCBUTTONMENUCANCEL_2700	2815


///////////////////////////////////////////////////////////////////////////
/// Styles
///////////////////////////////////////////////////////////////////////////

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_CHECKBOX         77

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar 
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4


///////////////////////////////////////////////////////////////////////////
/// Base Classes
///////////////////////////////////////////////////////////////////////////
class RscText
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 1;
	colorShadow[] = 
	{
		0,
		0,
		0,
		0.5
	};
	font = "PuristaMedium";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	linespacing = 1;
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
};
class RscStructuredText
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	class Attributes
	{
		font = "PuristaMedium";
		color = "#ffffff";
		colorLink = "#D09B43";
		align = "left";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 1;
};
class RscPicture
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
};
class RscEdit
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 2;
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorText[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorSelection[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	autocomplete = "";
	text = "";
	size = 0.2;
	style = "0x00 + 0x40";
	font = "PuristaMedium";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	canModify = 1;
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
};
class RscCombo
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 4;
	colorSelect[] = 
	{
		0,
		0,
		0,
		1
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		1
	};
	colorScrollbar[] = 
	{
		1,
		0,
		0,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorPicture[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPictureSelected[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPictureDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorPictureRight[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPictureRightSelected[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPictureRightDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorTextRight[] = 
	{
		1,
		1,
		1,
		1
	};
	colorSelectRight[] = 
	{
		0,
		0,
		0,
		1
	};
	colorSelect2Right[] = 
	{
		0,
		0,
		0,
		1
	};
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
	soundSelect[] = 
	{
		"\A3\ui_f\data\sound\RscCombo\soundSelect",
		0.1,
		1
	};
	soundExpand[] = 
	{
		"\A3\ui_f\data\sound\RscCombo\soundExpand",
		0.1,
		1
	};
	soundCollapse[] = 
	{
		"\A3\ui_f\data\sound\RscCombo\soundCollapse",
		0.1,
		1
	};
	maxHistoryDelay = 1;
	class ComboScrollBar
	{
		color[] = 
		{
			1,
			1,
			1,
			1
		};
	};
	style = "0x10 + 0x200";
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	colorSelectBackground[] = 
	{
		1,
		1,
		1,
		0.7
	};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	colorActive[] = 
	{
		1,
		0,
		0,
		1
	};
};
class RscListBox
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 5;
	rowHeight = 0;
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorScrollbar[] = 
	{
		1,
		0,
		0,
		0
	};
	colorSelect[] = 
	{
		0,
		0,
		0,
		1
	};
	colorSelect2[] = 
	{
		0,
		0,
		0,
		1
	};
	colorSelectBackground[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorSelectBackground2[] = 
	{
		1,
		1,
		1,
		0.5
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0.3
	};
	soundSelect[] = 
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.09,
		1
	};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	colorPicture[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPictureSelected[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPictureDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorPictureRight[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPictureRightSelected[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPictureRightDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorTextRight[] = 
	{
		1,
		1,
		1,
		1
	};
	colorSelectRight[] = 
	{
		0,
		0,
		0,
		1
	};
	colorSelect2Right[] = 
	{
		0,
		0,
		0,
		1
	};
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
	class ListScrollBar
	{
		color[] = 
		{
			1,
			1,
			1,
			1
		};
		autoScrollEnabled = 1;
	};
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.3;
	style = 16;
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	colorShadow[] = 
	{
		0,
		0,
		0,
		0.5
	};
	period = 1.2;
	maxHistoryDelay = 1;
};
class RscButton
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 1;
	text = "";
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundDisabled[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundActive[] = 
	{
		0,
		0,
		0,
		1
	};
	colorFocused[] = 
	{
		0,
		0,
		0,
		1
	};
	colorShadow[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBorder[] = 
	{
		0,
		0,
		0,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
};
class RscShortcutButton
{
	deletable = 0;
	fade = 0;
	type = 16;
	x = 0.1;
	y = 0.1;
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos
	{
		left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
	shortcuts[] = 
	{
	};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = 
	{
		1,
		1,
		1,
		1
	};
	colorFocused[] = 
	{
		1,
		1,
		1,
		1
	};
	color2[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorBackground[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorBackgroundFocused[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorBackground2[] = 
	{
		1,
		1,
		1,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	class Attributes
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	textSecondary = "";
	colorSecondary[] = 
	{
		1,
		1,
		1,
		1
	};
	colorFocusedSecondary[] = 
	{
		1,
		1,
		1,
		1
	};
	color2Secondary[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorDisabledSecondary[] = 
	{
		1,
		1,
		1,
		0.25
	};
	sizeExSecondary = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary = "PuristaMedium";
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	periodFocus = 1.2;
	periodOver = 0.8;
	period = 0.4;
	font = "PuristaMedium";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	action = "";
	class AttributesImage
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
	};
};
class RscShortcutButtonMain
{
	idc = -1;
	style = 0;
	default = 0;
	w = 0.313726;
	h = 0.104575;
	color[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0.0145;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
	};
	class TextPos
	{
		left = "(((safezoneW / safezoneH) min 1.2) / 32) * 1.5";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)*2 - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
		right = 0.005;
		bottom = 0;
	};
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\disabled_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\down_ca.paa";
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
	period = 0.5;
	font = "PuristaMedium";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
	text = "";
	action = "";
	class Attributes
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class AttributesImage
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "false";
	};
};
class RscFrame
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	font = "PuristaMedium";
	sizeEx = 0.02;
	text = "";
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.3;
};
class RscSlider
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 3;
	style = 1024;
	color[] = 
	{
		1,
		1,
		1,
		0.8
	};
	colorActive[] = 
	{
		1,
		1,
		1,
		1
	};
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.025;
};
class IGUIBack
{
	type = 0;
	idc = 124;
	style = 128;
	text = "";
	colorText[] = 
	{
		0,
		0,
		0,
		0
	};
	font = "PuristaMedium";
	sizeEx = 0;
	shadow = 0;
	x = 0.1;
	y = 0.1;
	w = 0.1;
	h = 0.1;
	colorbackground[] = 
	{
		"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"
	};
};
class RscCheckBox
{
	idc = -1;
	type = 77;
	style = 0;
	checked = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	color[] = 
	{
		1,
		1,
		1,
		0.7
	};
	colorFocused[] = 
	{
		1,
		1,
		1,
		1
	};
	colorHover[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPressed[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.2
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundFocused[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundHover[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundPressed[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundDisabled[] = 
	{
		0,
		0,
		0,
		0
	};
	textureChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureFocusedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureFocusedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureHoverChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureHoverUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	texturePressedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	texturePressedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureDisabledChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureDisabledUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
	soundEnter[] = 
	{
		"",
		0.1,
		1
	};
	soundPush[] = 
	{
		"",
		0.1,
		1
	};
	soundClick[] = 
	{
		"",
		0.1,
		1
	};
	soundEscape[] = 
	{
		"",
		0.1,
		1
	};
};
class RscTextCheckBox
{
	idc = -1;
	type = 7;
	style = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	colorText[] = 
	{
		1,
		0,
		0,
		1
	};
	color[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorTextSelect[] = 
	{
		0,
		0.8,
		0,
		1
	};
	colorSelectedBg[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorSelect[] = 
	{
		0,
		0,
		0,
		1
	};
	colorTextDisable[] = 
	{
		0.4,
		0.4,
		0.4,
		1
	};
	colorDisable[] = 
	{
		0.4,
		0.4,
		0.4,
		1
	};
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	rows = 1;
	columns = 1;
	strings[] = 
	{
		"UNCHECKED"
	};
	checked_strings[] = 
	{
		"CHECKED"
	};
};
class RscButtonMenu
{
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = 
	{
		0,
		0,
		0,
		0.8
	};
	colorBackgroundFocused[] = 
	{
		1,
		1,
		1,
		1
	};
	colorBackground2[] = 
	{
		0.75,
		0.75,
		0.75,
		1
	};
	color[] = 
	{
		1,
		1,
		1,
		1
	};
	colorFocused[] = 
	{
		0,
		0,
		0,
		1
	};
	color2[] = 
	{
		0,
		0,
		0,
		1
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	textSecondary = "";
	colorSecondary[] = 
	{
		1,
		1,
		1,
		1
	};
	colorFocusedSecondary[] = 
	{
		0,
		0,
		0,
		1
	};
	color2Secondary[] = 
	{
		0,
		0,
		0,
		1
	};
	colorDisabledSecondary[] = 
	{
		1,
		1,
		1,
		0.25
	};
	sizeExSecondary = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary = "PuristaLight";
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
	class TextPos
	{
		left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
	class Attributes
	{
		font = "PuristaLight";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class ShortcutPos
	{
		left = "5.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = 0;
		w = "1 * (((safezoneW / safezoneH) min 1.2) / 40)";
		h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
		0.09,
		1
	};
};
class RscButtonMenuOK : RscButton
{
	idc = 1;
	shortcuts[] = 
	{
		"0x00050000 + 0",
		28,
		57,
		156
	};
	default = 1;
	text = "ОК";
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",
		0.09,
		1
	};
};
class RscButtonMenuCancel : RscButton
{
	idc = 2;
	shortcuts[] = 
	{
		"0x00050000 + 1"
	};
	text = "Отмена";
};
class RscControlsGroup
{
	deletable = 0;
	fade = 0;
	class VScrollbar
	{
		color[] = 
		{
			1,
			1,
			1,
			1
		};
		width = 0.021;
		autoScrollEnabled = 1;
	};
	class HScrollbar
	{
		color[] = 
		{
			1,
			1,
			1,
			1
		};
		height = 0.028;
	};
	class Controls
	{
	};
	type = 15;
	idc = -1;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	style = 16;
};

//$[1.063,["sss",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1000,"RscListbox_1500: RscListBox",[2,"",["0.5 * GUI_GRID_W + GUI_GRID_X","0.5 * GUI_GRID_H + GUI_GRID_Y","29 * GUI_GRID_W","22 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1500;","onLBDblClick = |[_this,|BUYDBLCLICK|] call zlt_fnc_handleBuyMerchantMenu|;"]],[2600,"RscButtonMenuOK_2600",[2,"ÐžÐš",["30 * GUI_GRID_W + GUI_GRID_X","20 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"RscButton_1600",[2,"ÐšÑƒÐ¿Ð¸Ñ‚ÑŒ",["30 * GUI_GRID_W + GUI_GRID_X","0.5 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","19 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1.5"],["idc = 1600;","onButtonClick = |[_this,|BUYBUTTON|] call zlt_fnc_handleBuyMerchantMenu|;"]],[1001,"",[2,"TEST",["0.5 * GUI_GRID_W + GUI_GRID_X","-1 * GUI_GRID_H + GUI_GRID_Y","35.5 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
class RscStalkerMerchantBuy {
	idd = 519483;
	enableSimulation = 1;
	onLoad = "[_this,""INIT""] spawn zlt_fnc_handleBuyMerchantMenu";
	controls[]=
	{
		RscListbox_1500,
		RscButtonMenuOK_2600,
		RscButton_1600
		
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by [STELS]Zealot, v1.063, #Vaniqa)
	////////////////////////////////////////////////////////

	class RscListbox_1500: RscListBox
	{
		idc = 1500;
		onLBDblClick = "[_this,""BUYDBLCLICK""] call zlt_fnc_handleBuyMerchantMenu";

		x = 0.5 * GUI_GRID_W + GUI_GRID_X;
		y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 29 * GUI_GRID_W;
		h = 22 * GUI_GRID_H;
	};
	class RscButtonMenuOK_2600: RscButtonMenuOK
	{
		style = ST_CENTER | ST_VCENTER;
		x = 30 * GUI_GRID_W + GUI_GRID_X;
		y = 20 * GUI_GRID_H + GUI_GRID_Y;
		w = 6 * GUI_GRID_W;
		h = 2.5 * GUI_GRID_H;
		text = "ЗАКРЫТЬ";
	};
	class RscButton_1600: RscButton
	{
		idc = 1600;
		onButtonClick = "[_this,""BUYBUTTON""] call zlt_fnc_handleBuyMerchantMenu";

		text = "Купить"; //--- ToDo: Localize;
		x = 30 * GUI_GRID_W + GUI_GRID_X;
		y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 6 * GUI_GRID_W;
		h = 19 * GUI_GRID_H;
		sizeEx = 1.5 * GUI_GRID_H;
	};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
class RscStalkerMerchantSell {
	idd = 519484;
	enableSimulation = 1;
	onLoad = "[_this,""INIT""] spawn zlt_fnc_handleSellMerchantMenu";
	controls[]=
	{
		RscListbox_1500,
		RscButtonMenuOK_2600,
		RscButton_1600
		
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by [STELS]Zealot, v1.063, #Vaniqa)
	////////////////////////////////////////////////////////

	class RscListbox_1500: RscListBox
	{
		idc = 1500;
		onLBDblClick = "[_this,""SELLDBLCLICK""] call zlt_fnc_handleSellMerchantMenu";

		x = 0.5 * GUI_GRID_W + GUI_GRID_X;
		y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 29 * GUI_GRID_W;
		h = 22 * GUI_GRID_H;
	};
	class RscButtonMenuOK_2600: RscButtonMenuOK
	{
		style = ST_CENTER | ST_VCENTER;
		x = 30 * GUI_GRID_W + GUI_GRID_X;
		y = 20 * GUI_GRID_H + GUI_GRID_Y;
		w = 6 * GUI_GRID_W;
		h = 2.5 * GUI_GRID_H;
		text = "ЗАКРЫТЬ";
	};
	class RscButton_1600: RscButton
	{
		idc = 1600;
		onButtonClick = "[_this,""SELLBUTTON""] call zlt_fnc_handleSellMerchantMenu";

		text = "Продать все"; //--- ToDo: Localize;
		x = 30 * GUI_GRID_W + GUI_GRID_X;
		y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 6 * GUI_GRID_W;
		h = 19 * GUI_GRID_H;
		sizeEx = 1 * GUI_GRID_H;
	};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};

