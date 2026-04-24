/*
	displayEventHandler выстреливает дымовую ловушку при нажатии кнопки.
	TODO: Устранить выстрел после перезарядки, при нажатии во время перезарядки.
*/

private["_z","_k","_d"];
_k = "KeyDown";
waituntil{!isnull (finddisplay 46)};
// Warning Message: Variable '_d' does not support serialization. Call 'disableSerialization' in the current script  if you need to use it.
disableSerialization;
_d = (findDisplay 46);

while{true}do{

	if (vehicle player != player)then{
		if (isNil "_z")then{
			_z = _d displayAddEventHandler [_k, "_this call gosa_fnc_smoke"];
			diag_log format ["Log: [while_keyEH_smoke] Add EH %1", _z];
		};
	}else{
		if !(isNil "_z")then{
			diag_log format ["Log: [while_keyEH_smoke] Remove EH %1", _z];
			_d displayRemoveEventHandler [_k, _z];
			_z = nil;
		};
	};

	// TODO: нужно оптимизировать. Затрагивает fps игроков. EH GetIn, GetOut.
	sleep 10;

};
