private ["_g","_t","_n","_arr","_sumAll","_sumType","_others","_f"];
// Отряды
_g = (_this select 0);
// Тип
_t = (_this select 1);
// Желаемая доля типа в пуле (0.03 = 3%)
_n = (_this select 2);

// Подсчитываем текущее значение
// Пример вывода [41.24,1.25] [сумма всех множителей, сумма множителей типа]
_arr = [_g, _t] call gosa_fnc_cfg_grp_getRarity;

_sumAll  = _arr select 0;
_sumType = _arr select 1;
_others  = _sumAll - _sumType;

// Множитель для типа, при котором получается доля _n
// (остальные группы при этом не меняются)
_f = if (_sumType > 0 && _others > 0 && _n > 0 && _n < 1) then {
	_others * _n / ((1 - _n) * _sumType)
} else {
	1
};

if (_f != 1 && _f > 0) then {
    // Округляем до 2 знаков — соотношение уедет на доли процента, зато значения чистые
    //_f = 0.01 * (round (_f * 100));

    //if (_f >= 1) then {
        // растим сам тип, остальных не трогаем
        [_g, _t, _f] call gosa_fnc_cfg_grp_setRarity;
    //} else {
        // тип не трогаем, растим все остальные группы в 1/_f раз
        //private _fO = 0.01 * (round ((1 / _f) * 100));
        //{
            // здесь нужен ваш способ добраться до типа конкретной группы
            //if ([_x] call gosa_fnc_cfg_grp_getType == _t) then { /* пропуск */ };
            //[_g, _x, _fO] call gosa_fnc_cfg_grp_setRarity;
        //} forEach _g;
    //};
};
[_g, _t] call gosa_fnc_cfg_grp_getRarity; // diag_log
