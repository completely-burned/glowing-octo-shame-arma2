private ["_cfgVeh","_availableVehicles",
	"_prefixs","_prefix","_mediums","_medium",
	"_postfixs","_postfix","_endings","_ending",
	"_return","_type","_entry"];

_cfgVeh = LIB_cfgVeh;
_availableVehicles = availableVehicles;

_prefixs = [
	"I_E_",
	"O_R_",
	"B_W_",
	"I_PMC_",
	"B_D_",
	"O_Tura",
	"B_Tura_",
	"I_Tura_",
	"O_SFIA_",
	"I_SFIA_",
	"B_ION_",
	"B_UN_",
	"O_A_",
	"B_Patrol_",
	"B_GEN_",
	"B_D_CTRG_",
	"B_CTRG_",
	"O_V_",
	"O_G_",
	"B_G_",
	"I_G_",
	"I_C_",
	"O_T",
	"B_T_",
	"O_",
	"B_",
	"I_"
];
_mediums = [
	"medic",
	"JTAC",
	"RadioOperator",
	"defector",
	"deserter",
	"thug",
	"hireling",
	"medic2",
	"enforcer",
	"watcher",
	"scout",
	"shot",
	"marksman",
	"TL",
	"Fighter_Pilot",
	"Commander",
	"Soldier_Viper",
	"Soldier_Para",
	"Soldier_Bandit",
	"Urban",
	"soldierU",
	"support",
	"diver",
	"recon",
	"officer",
	"Pilot",
	"Helipilot",
	"helicrew",
	"crew",
	"sniper",
	"spotter",
	"HeavyGunner",
	"Sharpshooter",
	"engineer",
	"soldier"
];
_postfixs = [
	"_SG",
	"_HG",
	"_CBRN",
	"_mine",
	"_UAV02",
	"_UAV01",
	"_UAV_01",
	"_UAV_02",
	"_01",
	"_02",
	"_1",
	"_2",
	"_3",
	"_4",
	"_5",
	"_6",
	"_7",
	"_8",
	"_9",
	"_HeavyGunner",
	"_Sharpshooter",
	"_repair",
	"_AMort",
	"_AMG",
	"_Mort",
	"_GMG",
	"_MG",
	"_AHAT",
	"_AAA",
	"_AAT",
	"_AAR",
	"_JTAC",
	"_medic",
	"_UAV",
	"_A",
	"_exp",
	"_lite",
	"_SL",
	"_TL",
	"_AR",
	"_AT",
	"_LAT",
	"_LAT2",
	"_HAT",
	"_AA",
	"_GL",
	"_M2",
	"_M",
	""
];
_endings = [
	"_lxWS",
	"_Camo_F",
	"_ghex_F",
	"_tna_F",
	"_arid_F",
	"_F",
	""
];

_return = [];
{
	_prefix = _x;
	{
		_medium = _x;
		{
			_postfix = _x;
			{
				_ending = _x;
				_type = (_prefix+_medium+_postfix+_ending);
				_entry = (_cfgVeh >> _type);
				if (isClass _entry) then {
					//diag_log format ["Log: [fnc_return_types_pseudo_safe] %1", _entry];
					_type = configname _entry;
					if (_type != "") then {
						if (_type in _availableVehicles) then {
							_return set [count _return, _type];
						};
					};
				};
			} forEach _endings;
		} forEach _postfixs;
	} forEach _mediums;
} forEach _prefixs;

diag_log format ["Log: [fnc_return_types_pseudo_safe] %1, %2", count _return, _return];
//copyToClipboard (_availableVehicles-_return);

_return;
