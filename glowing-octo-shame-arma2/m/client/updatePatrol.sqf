// тут все сделано неправильно, надо исправить

waitUntil {!isNil "bis_fnc_init"};
waitUntil {!isNil "m_fnc_init"};
waitUntil {!isNil "GroupsStarted"};

private["_minGroups","_enemyCoefficient","_playerCoefficient","_enemyCoefficientCfg","_timeFriendlyReinforcements"];
_minGroups = missionNamespace getVariable "minGroups";
_enemyCoefficientCfg = missionNamespace getVariable "enemyCoefficient";
_playerCoefficient = missionNamespace getVariable "playerCoefficient";
_timeFriendlyReinforcements = (missionNamespace getVariable "timeFriendlyReinforcements") * 60;

private["_all_groups","_friendlyGroups","_friendlyPatrols","_enemyGroups","_enemyPatrols","_enemySide"];

_enemySide = [west,east,resistance] - m_friendlySide;

while{true}do{

	_friendlyPatrols = 0;  _enemyPatrols = 0;
	{
		private ["_grp"];
		_grp=_x;
		Private["_side"];
		_side = side _grp;

		if (_side in [west,east,resistance]) then {
			if({isPlayer _x} count units _grp == 0)then{
				if({alive _x} count units _grp > 0)then{
					if (!isNil {_grp GetVariable "patrol"} or local leader _grp) then {
						if (_side in m_friendlySide) then {
							_friendlyPatrols = _friendlyPatrols + 1;
						}else{
							_enemyPatrols = _enemyPatrols + 1;
						};
					};
				};
			};
		};
	}forEach allGroups;

	if(_friendlyPatrols+_enemyPatrols < ((_minGroups/2) max 3))then{
		_difference = (((_friendlyPatrols+_enemyPatrols / 5) min 4) max 2);

		if (_friendlyPatrols + _difference >= _enemyPatrols) then {
			[_enemySide call BIS_fnc_selectRandom,"patrol"] call m_fnc_call_patrol;
		};
		if (_enemyPatrols + _difference >= _friendlyPatrols) then {
			[m_friendlySide call BIS_fnc_selectRandom,"patrol"] call m_fnc_call_patrol;
		};
	};
	sleep 0.1;
};
