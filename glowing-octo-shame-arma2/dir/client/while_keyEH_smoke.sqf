/*displayEventHandler выстреливает дымовую ловушку при нажатии кнопки
 */

private["_z"];

waituntil{!isnull (finddisplay 46)};

while{true}do{

	if (vehicle player != player)then{
		if (isNil "_z")then{
			_z = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call gosa_fnc_smoke"];
		};
	}else{
		if !(isNil "_z")then{
			(findDisplay 46) displayRemoveEventHandler ["keyDown",_z];
			_z = nil;
		};
	};

	sleep 1;

};
