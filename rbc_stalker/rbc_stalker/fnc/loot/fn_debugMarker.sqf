#include "common.hpp"


params ["_x","_y","_z"];

private "_nm"; _nm = "mrk" + ( str floor (getposatl (_x) select 0) + str floor (getposatl (_x) select 1) + str floor (getposatl (_x) select 2));

private "_mrk"; _mrk = _nm;
if !(_nm in AllMapMarkers)  then {
	_mrk = createMarker [_nm,getposatl (_x)];
};
_mrk setMarkerShape "ICON";
_mrk setMarkerType "mil_dot";
if (_y != "") then { _mrk setMarkerColor _y;};
_mrk setMarkerText _z;
_mrk setMarkerPos getposatl (_x);
_mrk

