private ["_Magazines","_Weapons","_Backpacks"];
_Magazines = [];
_Weapons = [];
_Backpacks = [];

if(!isNil "availableMagazines")then{
	{
		_Magazines set [count _Magazines, [_x,12]];
	}forEach availableMagazines;
};
if(!isNil "availableWeapons")then{
	{
		_Weapons set [count _Weapons, [_x,1]];
	}forEach availableWeapons;
};
if(!isNil "availableBackpacks")then{
	{
		_Backpacks set [count _Backpacks, [_x,1]];
	}forEach availableBackpacks;
};

_Magazines = [_Magazines,_Weapons,_Backpacks];
_Magazines;
