private["_moduleName_keyDownEHId"];

waituntil{!isnull (finddisplay 46)};

while{true}do{

	if (vehicle player != player)then{
		if (isNil {_moduleName_keyDownEHId})then{
			_moduleName_keyDownEHId = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call fnc_smoke"];
		};
	}else{
		if (!isNil {_moduleName_keyDownEHId})then{
			(findDisplay 46) displayRemoveEventHandler ["keyDown",_moduleName_keyDownEHId];
			_moduleName_keyDownEHId = nil;
		};
	};

	sleep 1;

};
