/*
Возвращает разные статичные данные игрока
*/

private ["_side_str","_markerColor"];

switch (gosa_playerSide) do {
	case (resistance):
	{
		_side_str = "guerrila";
		_markerColor = "ColorGreen";
	};
	case (civilian):
	{
		_side_str = "civilian";
		_markerColor = "ColorYellow";
	};
	case (west):
	{
		_side_str = "west";
		_markerColor = "ColorBlue";
	};
	case (east):
	{
		_side_str = "east";
		_markerColor = "ColorRed";
	};
	default {
		_side_str = str gosa_playerSide;
		_markerColor = "Default";
	};
};

[_side_str,_markerColor];
