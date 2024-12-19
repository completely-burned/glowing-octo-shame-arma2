private ["_str","_faction","_cfgVeh","_islands","_side"];
_str = _this select 0;
_cfgVeh = LIB_cfgVeh;

_faction = toUpper getText(_cfgVeh >> _str >> "faction");
_side = getNumber(_cfgVeh >> _str >> "side") call gosa_fnc_getSide;
_islands = [];
_t = [];


// TODO: Нужна таблица и функция сопоставления.
//-- East.
//- DLC.
if (_faction in ["OPF_T_F"]) then {
	_islands = _islands + ["tanoa"];
	_t = _t + [[160,249]];
};
//- CDLC.
if (_faction IN ["OPF_SFIA_LXWS","IND_SFIA_LXWS"]) then {
	_islands = _islands + ["sefrouramal"];
	_t = _t + [[275,999]];
};
if (_faction IN ["OPF_TURA_LXWS","BLU_TURA_LXWS","IND_TURA_LXWS"]) then {
	_islands = _islands + ["sefrouramal"];
	_t = _t + [[300,999]];
};
//- Vanilla.
if (_faction in ["OPF_F"]) then {
	_islands = _islands + ["altis"];
	if (count _t > 0) then {
		_t = _t + [[250,274]];
	}else{
		//_t = t + [[-999,159],[250,999]];
		_t = _t + [[250,999]];
	};
};

//-- West.
//- DLC.
if (_faction in ["BLU_W_F"]) then {
	_islands = _islands + ["enoch"];
	_t = _t + [[160,224]];
};
if (_faction in ["BLU_T_F"]) then {
	_islands = _islands + ["tanoa"];
	_t = _t + [[225,249]];
};
//- CDLC.
if (_faction IN ["BLU_NATO_LXWS"]) then {
	_islands = _islands + ["sefrouramal"];
	_t = _t + [[300,999]];
};
//- Vanilla.
if (_faction in ["BLU_F"]) then {
	_islands = _islands + ["altis"];
	if (count _t > 0) then {
		_t = _t + [[250,299]];
	}else{
		//_t = t + [[-999,159],[250,999]];
		_t = _t + [[250,999]];
	};
};

//-- Guer.

[_faction, _side, _islands, _t];
