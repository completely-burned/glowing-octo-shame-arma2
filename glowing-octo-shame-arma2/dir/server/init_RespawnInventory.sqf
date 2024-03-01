/*
*/

private [
	"_cfgVeh",
	"_types",
	"_types_enabled",
	"_roles_avail",
	"_sides_avail",
	"_factions_avail",
	"_roles_deny",
	"_item",
	"_entry",
	"_b",
	"_role",
	"_side",
	"_faction",
	"_str"
];
_cfgVeh = LIB_cfgVeh;

_sides_avail = gosa_friendlyside;
//_factions_avail = ["ind_f","ind_c_f","ind_sfia_lxws","ind_tura_lxws","ind_e_f","ind_l_f"];
_roles_deny = ["","unarmed"];

/*
_types = [
	"O_soldier_SL_F","O_soldier_TL_F",
	"O_HeavyGunner_F","O_soldier_AR_F",
	"O_Sharpshooter_F","O_soldier_M_F",
	"O_soldier_AT_F","O_soldier_LAT_F","O_soldier_HAT_F",
	"O_soldier_AA_F",
	"O_soldier_GL_F","O_soldier_F",
	"O_medic_F","O_soldier_repair_F","O_engineer_F",
	"O_sniper_F","O_spotter_F",

	"B_soldier_SL_F","B_soldier_TL_F",
	"B_HeavyGunner_F","B_soldier_AR_F",
	"B_Sharpshooter_F","B_soldier_M_F",
	"B_soldier_AT_F","B_soldier_LAT_F","B_soldier_LAT2_F",
	"B_soldier_AA_F",
	"B_soldier_GL_F","B_soldier_F",
	"B_medic_F","B_soldier_repair_F","B_engineer_F",
	"B_sniper_F","B_spotter_F",

	"I_soldier_SL_F","I_soldier_TL_F",
	"I_HeavyGunner_F","I_soldier_AR_F",
	"I_Sharpshooter_F","I_soldier_M_F",
	"I_soldier_AT_F","I_soldier_LAT_F","I_soldier_LAT2_F",
	"I_soldier_AA_F",
	"I_soldier_GL_F","I_soldier_F",
	"I_medic_F","I_soldier_repair_F","I_engineer_F",
	"I_sniper_F","I_spotter_F"
];
*/


_types = ([] call gosa_fnc_return_types_pseudo_safe);
_types = availableVehicles;
diag_log format ["Log: [init_RespawnInventory] %1 count", count _types];

// 
_types_enabled = [];
for "_i" from 0 to (count _types -1) do {
	_item = _types select _i;
	_entry = _cfgVeh >> _item;
	_b = if (getNumber (_entry >> "isMan") > 0) then {true} else {false};
	if (_b) then {
		_role = toLower getText (_entry >> "role");
		if !(_role in _roles_deny) then {
			_side = getNumber (_entry >> "side") call gosa_fnc_getSide;
			if (_side in _sides_avail) then {
				_str = toLower getText (_entry >> "faction");
				if (_str != "") then {
					[_side, _item] call BIS_fnc_addRespawnInventory;
					_types_enabled set [count _types_enabled, _item];
					diag_log format ["Log: [init_RespawnInventory] %1 added %2", _item, _side];
				};
			};
		}else{ //deag_log
			diag_log format ["Log: [init_RespawnInventory] %1 deny %2", _item, _role];
		};
	};
};

_types_enabled;
