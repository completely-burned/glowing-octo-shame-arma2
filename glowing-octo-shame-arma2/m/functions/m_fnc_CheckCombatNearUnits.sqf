private["_visible","_Pos","_distance","_side","_grp"];
// _Pos = (position ( _this select 0 ));
// _Pos resize 2;
_Pos =  ( _this select 0 );
_distance = ( _this select 1 );
_side = ( _this select 2 );
_visible = false;
ScopeName "Check";
{
	_grp = _x;
	if ((side _grp) in [west,east,resistance]) then {
		if (( _side getFriend (side _grp) ) >= 0.6 ) then {
			if( {_x call fnc_isPlayer} count units _grp == 0 )then{
				if( {currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]} count units _grp > 0 )then{ // ATTACK
					private["_leader"];
					_leader = (leader _grp);
					if (!isNull _leader) then {
						if ((_Pos distance vehicle _leader) <= _distance) then {
								_visible = true;
								BreakTo "Check";
						};
					};
				};
			};
		};
	};
} forEach allGroups;//( _Pos nearEntities [["Man","Car","Motorcycle","Tank"],_distance] );

if (draga_loglevel > 0) then {
	diag_log format ["m_fnc_CheckCombatNearUnits.sqf %1  %2", _grp, _visible ];
};

_visible;
