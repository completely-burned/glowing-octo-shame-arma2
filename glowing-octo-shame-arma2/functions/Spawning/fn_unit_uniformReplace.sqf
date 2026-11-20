/*
	TODO: Это лишь заготовка.
	TODO: После forceAddUniform, addVest и прочих нужно восстанавливать инвентарь.
	FIXME: Можно попробовать менять типы изменяя часть букв в строках.

	uniformClass = "rhs_uniform_acu_ucp";
	uniformClass = "rhs_uniform_cu_ucp_101st";
	"rhs_uniform_acu_oefcp"
*/
private["_units","_island","_unit","_b","_uniform"];

_units = _this select 0;
//_units = units group cameraon;

if (count _units > 0) then {
	_island = gosa_IslandType;

	if (_island select 0 < 250) then {
		for "_i" from 0 to (count _units -1) do {
			_unit = _units select _i;
			_uniform = toLowerANSI uniform _unit;
			_b = if (_uniform in ["rhs_uniform_acu_ucp", "rhs_uniform_cu_ucp_101st"]) then {true} else {false};
			if (_b) then {
				_unit forceAddUniform "rhs_uniform_acu_oefcp";
				_unit addHeadgear "rhsusf_ach_helmet_headset_ocp";
				_unit addVest "rhsusf_iotv_ocp_Rifleman";
			};
		};
	};
};
