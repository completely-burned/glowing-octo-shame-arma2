private ["_type","_date"];
_type = _this select 0;
if (typeName _type == typeName objNull) then {
	_type = typeOf _type;
};

switch (true) do {
	// GM 1990
	case (_type isKindOf "gm_dk_army_sf_base_90_m84"): {
		_date = [1990,2000];
	};
	case (_type isKindOf "gm_dk_army_sf_base_90_win"): {
		_date = [1990,2000];
	};
	case (_type isKindOf "gm_dk_army_rifleman_90_m84_base"): {
		_date = [1990,2000];
	};
	case (_type isKindOf "gm_dk_army_rifleman_90_win_base"): {
		_date = [1990,2000];
	};

	case (_type isKindOf "gm_ge_army_rifleman_90_base"): {
		_date = [1990,2000];
	};
	case (_type isKindOf "gm_ge_army_rifleman_90_win_base"): {
		_date = [1990,2000];
	};

	case (_type isKindOf "gm_man_base"): {
		_date = [1980,1990];
	};

	case (_type isKindOf "gm_wheeled_base"): {
		_date = [1980,2000];
	};
	case (_type isKindOf "gm_tracked_base"): {
		_date = [1980,2000];
	};

	default {
		_date = []
	};
};

[_date];
