//scriptName format ["%1Scripts\Server\Config\Config_Compositions.sqf",BIS_WFdPath];
//Last modified 5/13/9
//*****************************************************************************************
/*
Description: Compile any list of compositions being used such as camps.

Example:
_l = _l		+ [corePath + "Server\Compositions\Camp1.sqf"];

You can make copies of the same line to increase the chance of it being selected. Example:

_l = _l		+ [corePath + "Server\Compositions\Camp1.sqf"];
_l = _l		+ [corePath + "Server\Compositions\Camp2.sqf"];
_l = _l		+ [corePath + "Server\Compositions\Camp2.sqf"];

Above example would have a 67% chance of creating Camp2 and 33% chance of creating Camp1.
*/
//*****************************************************************************************
Private["_l"];

_l = [];

_l = _l		+ ["\CA\Warfare2\Scripts\" + "Server\Compositions\Depot1.sqf"];

for [{_count = Count _l - 1},{_count >= 0},{_count = _count - 1}] do
{
	_l Set[_count,Call Compile PreprocessFile (_l Select _count)];
};

_l = _l		+ ["CityBase01"];
_l = _l		+ ["CityBase02"];
_l = _l		+ ["CityBase04"];

gosa_depotCompositions = _l;

_l = [];

_l = _l		+ ["\CA\Warfare2\Scripts\" + "Server\Compositions\Camp1.sqf"];
_l = _l		+ ["\CA\Warfare2\Scripts\" + "Server\Compositions\Camp2.sqf"];

for [{_count = Count _l - 1},{_count >= 0},{_count = _count - 1}] do
{
	_l Set[_count,Call Compile PreprocessFile (_l Select _count)];
};


//Add complete DyNO classes for bunkers here (see config.cpp in DyNO module)
//Commented out compositions that are not working for now.
_l = _l + ["bunkerSmall01"];
_l = _l + ["bunkerMedium01"];
_l = _l + ["bunkerMedium02"];
_l = _l + ["bunkerMedium03"];
_l = _l + ["bunkerMedium04"];
_l = _l + ["bunkerMedium05"];
_l = _l + ["bunkerMedium06"];
_l = _l + ["bunkerMedium07"];
_l = _l + ["bunkerMedium08"];
_l = _l + ["bunkerMedium09"];
_l = _l + ["bunkerMedium10"];

_l = _l + ["GuardPost4_US"];
_l = _l + ["GuardPost5_US"];
_l = _l + ["GuardPost6_US"];
_l = _l + ["GuardPost7_US"];
_l = _l + ["GuardPost8_US"];



gosa_campCompositions = _l;

//*****************************************************************************************
//10/14/8 MM - Created file.








// scriptName format ["%1Scripts\Server\Config\Config_Compositions.sqf",BIS_WFdPath];
//Last modified 5/11/10
//*****************************************************************************************
/*
Description: Compile any list of compositions being used such as camps.

Example:
_l = _l		+ [corePath + "Server\Compositions\Camp1.sqf"];

You can make copies of the same line to increase the chance of it being selected. Example:

_l = _l		+ [corePath + "Server\Compositions\Camp1.sqf"];
_l = _l		+ [corePath + "Server\Compositions\Camp2.sqf"];
_l = _l		+ [corePath + "Server\Compositions\Camp2.sqf"];

Above example would have a 67% chance of creating Camp2 and 33% chance of creating Camp1.
//*****************************************************************************************
Private["_l"];

_l = [];

_l = _l		+ ["\CA\Warfare2\Scripts\" + "Server\Compositions\Depot1.sqf"];

for [{_count = Count _l - 1},{_count >= 0},{_count = _count - 1}] do
{
	_l Set[_count,Call Compile preprocessFileLineNumbers (_l Select _count)];
};

_l = _l		+ ["CityBase01_EP1"];

gosa_depotCompositions = _l;

_l = [];

//Commented out compositions that are not working for now.
//_l = _l		+ [corePath + "Server\Compositions\Camp1.sqf"];
//_l = _l		+ [corePath + "Server\Compositions\Camp2.sqf"];

for [{_count = Count _l - 1},{_count >= 0},{_count = _count - 1}] do
{
	_l Set[_count,Call Compile preprocessFileLineNumbers (_l Select _count)];
};


//Add complete DyNO classes for bunkers here (see config.cpp in DyNO module)
_l = _l + ["GuardPost_US_EP1"];
_l = _l + ["bunkerMedium02_EP1"];
_l = _l + ["BunkerMedium06_EP1"];
_l = _l + ["BunkerMedium06_EP1"];
_l = _l + ["GuardPost8_US_EP1"];

gosa_campCompositions = _l;

//*****************************************************************************************
//10/14/8 MM - Created file.
*/
