if !(isServer) exitWith {};

private ["_units","_resist","_west","_east"];
sleep 1;
while {true} do {
	_units = list tzone;
	_resist = {isPlayer _x && alive _x && (side _x == resistance)} count _units;
	_west = {isPlayer _x && alive _x && (side _x == west)} count _units;
	_east = {isPlayer _x && alive _x && (side _x == east)} count _units;
	diag_log ["zones", _resist, _west, _east];
	"zonec" setMarkerText format ["Контролируется: %1",(switch true do {case (_west > _resist && _west > _east): {"Монолитом"};case (_east > _resist && _east > _west): {"Долгом"};case (_resist > _east && _resist > _west): {"Свободными сталкерами"};default {"Никем"}})];
	sleep 5.;
};