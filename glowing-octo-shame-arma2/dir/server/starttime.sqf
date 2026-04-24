private ["_startTime","_date","_date_changed","_n","_skipTime"];
// setDate [1986, 2, 25, 16, 0]; // 4:00pm February 25, 1986
_date = date;
diag_log format ["Log: [StartTime] date %1", _date];

_date_changed = false;
_n = missionNamespace getVariable "gosa_StartYear";
if (_n > 0) then {
	_date_changed = true;
	_date set [0, _n];
};
_n = missionNamespace getVariable "gosa_StartMonth";
if (_n > 0) then {
	_date_changed = true;
	_date set [1, _n];
};
_n = missionNamespace getVariable "gosa_StartDay";
if (_n > 0) then {
	_date_changed = true;
	_date set [2, _n];
};

_n = missionNamespace getVariable "StartTime";
if (_n >= 0 && _n <= 24) then {
	_date set [3, _n];
	_skipTime = (_n - daytime);
};
if (_n == -1) then {
	_skipTime = 0;
};
if (_n == 100) then {
	_skipTime = random 24;
	_n = daytime + _skipTime;
	_date set [3, _n];
};


if (_date_changed) then {
	setDate _date;
	diag_log format ["Log: [StartTime] setDate %1 -> %2", _date, date];
}else{
	if (_skipTime > 0) then {
		skipTime _skipTime;
		diag_log format ["Log: [StartTime] skipTime %1 -> %2", _skipTime, date];
	};
};
gosa_startDate = date;
publicVariable "gosa_startDate";
// Для совместимости.
m_SkipTime = _skipTime;
publicVariable "m_SkipTime";
