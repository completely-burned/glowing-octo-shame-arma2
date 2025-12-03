private["_b","_dist","_arr","_type"];
_dist = 900;
_type = "LocationBase_F";

_arr = entities _type;
for "_i" from 0 to (count _arr -1) do {
	if (toLower typeOf (_arr select _i) == toLower _type) then {
		[_arr select _i, _dist] call gosa_fnc_base_generateRespawns; 
	};
};
