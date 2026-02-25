/*
	Скрипт создает записи инструктажа.
*/
private ["_subject","_arr","_obj","_textInfo","_b"];
diag_log format ["Log: [fn_initBriefing] %1, %2", _this, player];

_obj = _this select 0;

_subject = "Diary";
_textInfo = [localize "STR_gosa_Situation", localize "STR_gosa_Situation2"];

_b = true;
	_arr = _obj allDiaryRecords _subject;
	scopeName "root";
	for "_i" from 0 to (count _arr -1) do {
		if (_textInfo select 0 == (_arr select _i select 1)) then {
			if (_textInfo select 1 == (_arr select _i select 2)) then {
				diag_log format ["Log: [fn_initBriefing] found %1", _arr select _i];
				_b = false;
				breakTo "root";
			};
		};
	};

if (_b) then {
	_obj createDiaryRecord [_subject, _textInfo];
	diag_log format ["Log: [fn_initBriefing] %1 createDiaryRecord %2", _obj, [_subject, _textInfo]];
};
