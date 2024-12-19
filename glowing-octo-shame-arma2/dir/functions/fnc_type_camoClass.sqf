private ["_str","_faction","_cfgVeh","_islands","_side","_camouflages",
	"_uniform","_d","_entry"];
_str = _this select 0;
_cfgVeh = LIB_cfgVeh;
_entry = _cfgVeh >> _str;

_faction = toUpper getText(_entry >> "faction");
_side = getNumber(_entry >> "side") call gosa_fnc_getSide;
_uniform = toLower getText(_entry >> "uniformClass");
_islands = [];
_t = [];
_d = [];


_camouflages = gosa_camouflages;
for "_i" from 0 to (count _camouflages -1) do {
	if ((count (_camouflages select _i select 0 select 0) <= 0 or 
		_faction in (_camouflages select _i select 0 select 0)) &&
		(count (_camouflages select _i select 0 select 2) <= 0 or 
		_uniform in (_camouflages select _i select 0 select 2))) then
	{
		#ifdef __ARMA3__
			_islands append (_camouflages select _i select 1);
			_d append (_camouflages select _i select 2);
			_t append (_camouflages select _i select 3);
		#else
			_islands = _islands + (_camouflages select _i select 1);
			_d = _d + (_camouflages select _i select 2);
			_t = _t + (_camouflages select _i select 3);
		#endif
	};
};

[_faction, _side, _islands, _t, _d];
