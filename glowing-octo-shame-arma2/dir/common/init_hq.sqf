/*
Здесь разные переменные необходимые для дальнейшей работы штабов.
*/
private ["_types","_types0","_types1","_typesMHQ","_typesHQ"];


//--- Все типы MHQ. KindOf. Для совместимости.
_typesMHQ = ["BRDM2_HQ_Base",
	"BMP2_HQ_Base",
	"M1130_CV_EP1",
	"BTR90_HQ",
	"LAV25_HQ",
	"MHQ"
];
#ifdef __ARMA3__
_typesMHQ=_typesMHQ+["B_Truck_01_medical_F",
	"O_Truck_03_medical_F",
	"O_Truck_02_medical_F",
	"I_Truck_02_medical_F",
	"B_T_Truck_01_medical_F",
	"O_T_Truck_03_medical_ghex_F"
];
#endif


//--- Соответствия типа MHQ к типу HQ. typeOf.
// gosa_typesHQ_%1.
// Два списка в массиве, Соответствия находятся по номеру функцией.
//-- Для всех сторон.
_typesHQ = [[],[]];
//-- Для одной стороны.
{
	// TODO: Добавить остальные.
	switch (_x) do {
		case east: {
			_types0 = ["BTR90_HQ",
				"BMP2_HQ_INS",
				"BMP2_HQ_TK_EP1",
				"O_Truck_03_command_F"];
			_types1 = ["BTR90_HQ_unfolded",
				"BMP2_HQ_INS_unfolded",
				// Не путать с "BMP2_HQ_TK_unfolded_Base_EP1".
				"BMP2_HQ_TK_unfolded_EP1",
				""];
		};
		case west: {
			_types0 = ["M1130_CV_EP1",
				"LAV25_HQ",
				"BMP2_HQ_CDF",
				"B_Truck_01_command_F"];
			_types1 = ["M1130_HQ_unfolded_EP1",
				"LAV25_HQ_unfolded",
				"BMP2_HQ_CDF_unfolded",
				""];
		};
		case resistance: {
			_types0 = ["BRDM2_HQ_TK_GUE_EP1",
				"BRDM2_HQ_Gue",
				"I_Truck_02_command_F"];
			_types1 = ["BRDM2_HQ_TK_GUE_unfolded_EP1",
				"BRDM2_HQ_Gue_unfolded",
				""];
		};
		default {
			_types0 = [];
			_types1 = [];
		};
	};
	// TODO: Нужна функция исправляющая списки выше,
	// при отсутствии расширений или камуфляжа.
	// Исправление регистра.
	for "_i" from 0 to (count _types0 -1) do {
		_types0 set [_i, toLower (_types0 select _i)];
		_types1 set [_i, toLower (_types1 select _i)];
	};
	//if (_types0 find "" > -1) then {};
	_types = [_types0,_types1];
	_types call compile format["gosa_typesHQ_%1 = _this", _x];
	diag_log format ["Log: [init_HQ]: gosa_typesHQ_%1 = %2", _x, _types];
	_typesHQ = [(_typesHQ select 0) + _types0, (_typesHQ select 1) + _types1];
	_typesMHQ = _typesMHQ + _types0;
} forEach [east, west, resistance];
gosa_typesHQ = _typesHQ;
diag_log format ["Log: [init_HQ]: gosa_typesHQ = %1", _typesHQ];

for "_i" from 0 to (count _typesMHQ -1) do {
	_typesMHQ set [_i, configName (LIB_cfgVeh >> (_typesMHQ select _i))];
};
_typesMHQ = _typesMHQ - [""];
listMHQ = _typesMHQ;
diag_log format ["Log: [init_HQ]: listMHQ %1", _typesMHQ];
