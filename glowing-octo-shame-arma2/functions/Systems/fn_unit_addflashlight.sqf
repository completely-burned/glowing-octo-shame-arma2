// TODO: Проверьте способность юнита видеть в темноте.
// TODO: Красный.

#ifdef __ARMA3__
private ["_str","_cfgWea","_cfVeh"];
	scopeName "root";
	if (missionNamespace getVariable "gosa_Flashlights" > 0) then {
		scopeName "scope1";
		_cfgWea = LIB_cfgWea;
		_cfVeh = LIB_cfgVeh;
		// TODO: Проверить работоспособность в MP.
		if (true) then {
			if (side (_this select 0) in [east, resistance]) then {
				_str = "SPE_US_FL_TL122";
				if (configName (_cfgWea >> _str) isNotEqualTo "") then {
					[_this select 0, [_str, "", "", "", [], [], ""]] call gosa_fnc_unit_addWeapon;
					breakTo "scope1";
				};
			};
			_str = "SPE_GER_FL_Signal_Flashlight";
			if (configName (_cfgWea >> _str) isNotEqualTo "") then {
				[_this select 0, [_str, "", "", "", [], [], ""]] call gosa_fnc_unit_addWeapon;
				breakTo "scope1";
			};
			/*
			// FIXME: Не требует покупки CDLC.
			_str = "SPEX_CW_LE_No4_Signal_Flashlight";
			if (configName (_cfgWea >> _str) isNotEqualTo "") then {
				_this select 0 linkItem _str;
				breakTo "scope1";
			};
			*/
		};

		// VN
		if (toUpper getText(_cfVeh >> typeOf (_this select 0) >> "dlc") in ["VN","VNX"]) then {
			_str = "vn_mx991";
			if (configName (_cfgWea >> _str) isNotEqualTo "" &&
				side (_this select 0) in [west,resistance]) then
			{
				[_this select 0, [_str, "", "", "", [], [], ""]] call gosa_fnc_unit_addWeapon;
				breakTo "root";
			};
			_str = "vn_fkb1";
			if (configName (_cfgWea >> _str) isNotEqualTo "") then
			{
				[_this select 0, [_str, "", "", "", [], [], ""]] call gosa_fnc_unit_addWeapon;
				breakTo "root";
			};
		};

		// ace
		_str = "ACE_Flashlight_Maglite_ML300L";
		if (configName (_cfgWea >> _str) isNotEqualTo "") then
		{
			[_this select 0, [_str, "", "", "", [], [], ""]] call gosa_fnc_unit_addWeapon;
			breakTo "root";
		};

		[_this select 0, ["hgun_esd_01_F", "", "acc_esd_01_flashlight", "", [], [], ""]] call gosa_fnc_unit_addWeapon;
	};
#endif
