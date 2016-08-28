private ["_pos","_grp","_player"];
switch (playerSide) do {
	case (resistance):
	{
		_pos = getMarkerPos "respawn_guerrila";
	};
	case (west):
	{
		_pos = getMarkerPos "respawn_west";
	};
	case (east):
	{
		_pos = getMarkerPos "respawn_east";
	};
	case (civilian):
	{
		_pos = getMarkerPos "respawn_civilian";
	};
	default {
		_pos = getMarkerPos toLower format["respawn_%1", playerSide];
	};
};
_grp = group player;
_player = (_grp createUnit [PlayerType select 0, _pos, [], 0, "FORM"]);
_player setRank (PlayerType select 1);
_player addEventHandler ["killed", {
	[] call m_fnc_playerRespawnSP;
	if !(LIB_ahAvail) then {
		[_this select 0] call BIS_GC_trashItFunc;
	};
}];
addSwitchableUnit _player;
_grp selectLeader _player;

[] spawn {
	WaitUntil {alive player && !isNil "civilianBasePos"};
	_task = player createSimpleTask ["currentTask"];
	_task setSimpleTaskDestination civilianBasePos;
	_task setTaskState "Created";
	_task SetSimpleTaskDescription [localize "str_disp_xbox_desc_cityconflict",localize "str_ac_guard",localize "str_ac_guard"];
	player setCurrentTask _task;
};

if(debug)then{
	// военные обозначения, показ всех, чтобы видеть как и где создаются боты
	waitUntil{!isNil "bis_fnc_init"};	
	private ["_martaFactions"];
	_martaFactions=[];
	{ _martaFactions = (_martaFactions + [_x,1]) } foreach ([] call BIS_fnc_getFactions);
	_player setVariable ["MARTA_showRules",_martaFactions];
	SetGroupIconsVisible [true,true];
};

