#define __A2OA__

switch (_this) do {
	case ('save'):
	{
		private["_weapon","_player","_Backpack","_typeBackpack","_magazinesBackpack"];

		_player=player;

		_weapon = (currentWeapon _player);

#ifdef __A2OA__
		_Backpack = unitBackpack _player;
		if(isNull _Backpack)then{
			_typeBackpack = "";
			_magazinesBackpack=[];
		}else{
			_typeBackpack = typeOf _Backpack;
			_magazinesBackpack= getMagazineCargo _Backpack;
		};
#else
		_Backpack = objNull;
			_typeBackpack = "";
			_magazinesBackpack=[];
#endif

		SAVELOADOUT = [magazines _player, weapons _player, _weapon, _typeBackpack,_magazinesBackpack];

		hint format ["'%1' %2",(gettext (configFile >> "CfgWeapons" >> _weapon >> "displayname")),localize "STR_gosa_saved"];
	};
	case ("respawn"):
	{
		private "_player";
		WaitUntil {alive player};
		_player=player;
		if(!isNil "SAVELOADOUT")then{

			removeAllWeapons _player;
			{_player removeMagazine _x} forEach magazines _player;
#ifdef __A2OA__
			removeBackpack _player;
#endif

			{_player addMagazine _x}foreach (SAVELOADOUT select 0);
			{_player addWeapon _x}foreach (SAVELOADOUT select 1);

			if((SAVELOADOUT select 3) != "")then{
#ifdef __A2OA__
				_player addBackpack (SAVELOADOUT select 3);
				private "_Backpack";
				_Backpack = unitBackpack _player;
#endif
				clearMagazineCargo _Backpack;
				// {
					// _Backpack addMagazineCargoGlobal _x;
				// }forEach (SAVELOADOUT select 4);
			for "_i" from 0 to (count(SAVELOADOUT select 4 select 0) - 1) do {
#ifdef __A2OA__
				_Backpack addMagazineCargoGlobal [(SAVELOADOUT select 4 select 0 select _i),(SAVELOADOUT select 4 select 1 select _i)];
#endif
			};
			};

			if((SAVELOADOUT select 2) != "")then{
				_player selectWeapon (SAVELOADOUT select 2);
			};
		};
		if !([LIB_cfgWea, weapons _player,"simulation","NVGoggles"] call gosa_fnc_check_config_use) then {
				_player addWeapon "NVGoggles";
		};
		if !([LIB_cfgWea, weapons _player,"simulation","Binocular"] call gosa_fnc_check_config_use) then {
				_player addWeapon "Binocular";
		};
	};
	default {};
};
