// TODO: Проверьте способность юнита видеть в темноте.
#ifdef __ARMA3__
	if (missionNamespace getVariable "gosa_Flashlights" > 0) then {
		[_this select 0, ["hgun_esd_01_F", "", "acc_esd_01_flashlight", "", [], [], ""]] call gosa_fnc_unit_addWeapon;
	};
#endif
