private["_visible","_Pos","_distance","_side"];
// _Pos = (position ( _this select 0 ));
// _Pos resize 2;
_Pos =  ( _this select 0 );
_distance = ( _this select 1 );
_side = ( _this select 2 );
_visible = false;
ScopeName "Check";
{
	if ((side _x) in [west,east,resistance]) then {
		if (( _side getFriend (side _x) ) >= 0.6 ) then {
			private["_leader"];
			_leader = (leader _x);
			if (!isNull _leader) then {
				if (!isPlayer _leader) then {
					if ((behaviour _leader) == "COMBAT") then {
						if ((_Pos distance _leader) <= _distance) then {
								_visible = true;
								BreakTo "Check";
						};
					};
				};
			};
		};
	};
	// sleep 0.01;
} forEach allGroups;//( _Pos nearEntities [["Man","Car","Motorcycle","Tank"],_distance] );
_visible;
