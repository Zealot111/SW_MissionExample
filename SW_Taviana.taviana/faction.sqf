

zlt_addToFaction = {
    if (!isNil {cursortarget} && {!isNull cursortarget} && {!(cursortarget in units group player)} && {alive cursortarget} && {isPlayer cursortarget}) then {
      	[cursortarget] joinSilent group player;
      	hint (name cursortarget + " присоединился к вашей группе!");
    };
};






player addAction ["Включить в свою фракцию", { [] call zlt_addToFaction }, [], -3, false, true, "", '!isNil {cursortarget} && {!isNull cursortarget} && {cursortarget distance player < 5} && {!(cursortarget in units group player)}'];

player addEventHandler ["Respawn", {
	player addAction ["Включить в свою фракцию", { [] call zlt_addToFaction }, [], -3, false, true, "", '!isNil {cursortarget} && {!isNull cursortarget} && {cursortarget distance player < 5} && {!(cursortarget in units group player)}'];
}];
