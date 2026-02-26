// TODO: Проверьте способность юнита видеть в темноте.
#ifdef __ARMA3__
private ["_str","_cfgWea"];
	scopeName "root";
	if (missionNamespace getVariable "gosa_Flashlights" > 0) then {
		_cfgWea = LIB_cfgWea;
		/*
		// FIXME: Не требует покупки CDLC.
		_str = "SPEX_CW_LE_No4_Signal_Flashlight";
		if (configName (_cfgWea >> _str) isNotEqualTo "") then {
			_this select 0 linkItem _str;
			breakTo "root";
		};
		*/
		if (side (_this select 0) in [east, resistance]) then {
			_str = "SPE_US_FL_TL122";
			if (configName (_cfgWea >> _str) isNotEqualTo "") then {
				[_this select 0, [_str, "", "", "", [], [], ""]] call gosa_fnc_unit_addWeapon;
				breakTo "root";
			};
		};
		_str = "SPE_GER_FL_Signal_Flashlight";
		if (configName (_cfgWea >> _str) isNotEqualTo "") then {
			[_this select 0, [_str, "", "", "", [], [], ""]] call gosa_fnc_unit_addWeapon;
			breakTo "root";
		};

		[_this select 0, ["hgun_esd_01_F", "", "acc_esd_01_flashlight", "", [], [], ""]] call gosa_fnc_unit_addWeapon;
	};
#endif
