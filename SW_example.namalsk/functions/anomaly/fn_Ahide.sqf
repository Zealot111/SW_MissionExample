/**/
if (isDedicated) exitWith {};
//diag_log "Ahide initializing...";
// diag_log Player;

private ["_Aname"];
_Aname = _this select 0;
{
	deleteVehicle _x;
} foreach (VAR getVariable (_Aname+"e"));

// ����� �������� ������� ��������� ����� ��������� ������� �� ���� + ��������� + ���������, �� ����� ���� �������� ����� ����� ����.
{
	sleep 1;
	terminate _x;
} foreach (VAR getVariable (_Aname+"s"));
//diag_log "Ahide ended.";
