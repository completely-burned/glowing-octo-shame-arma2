// TODO: нужна функция
// TODO: нужно динамическое резделение по фракциям

private ["_mhq","_hq"];
_mhq=[];_hq=[];

// TODO: нужна функция worldname
if(toLower worldname in ["zargabad", "takistan", "desert_e", "shapur_baf", "mountains_acr"])then{
	if ( east in gosa_friendlyside ) then {
		_mhq set [count _mhq, toLower "BMP2_HQ_TK_EP1"];
			_hq set [count _hq, toLower "BMP2_HQ_TK_hq_Base_EP1"];
	};

	if ( west in gosa_friendlyside ) then {
		_mhq set [count _mhq, toLower "M1130_CV_EP1"];
			_hq set [count _hq, toLower "M1130_HQ_hq_Base_EP1"];
	};

	if ( resistance in gosa_friendlyside ) then {
		_mhq set [count _mhq, toLower "BRDM2_HQ_TK_GUE_EP1"];
			_hq set [count _hq, toLower "BRDM2_HQ_TK_GUE_hq_Base_EP1"];
	};

}else{
	if ( east in gosa_friendlyside ) then {
		_mhq set [count _mhq, toLower "BTR90_HQ"];
			_hq set [count _hq, toLower "BTR90_HQ_hq"];

		_mhq set [count _mhq, toLower "BMP2_HQ_INS"];
			_hq set [count _hq, toLower "BMP2_HQ_INS_hq"];
	};

	if ( west in gosa_friendlyside ) then {
		_mhq set [count _mhq, toLower "LAV25_HQ"];
			_hq set [count _hq, toLower "LAV25_HQ_hq"];

		_mhq set [count _mhq, toLower "BMP2_HQ_CDF"];
			_hq set [count _hq, toLower "BMP2_HQ_CDF_hq"];
	};

	if ( resistance in gosa_friendlyside ) then {
		_mhq set [count _mhq, toLower "BRDM2_HQ_Gue"];
			_hq set [count _hq, toLower "BRDM2_HQ_Gue_hq"];
	};
};

// TODO: нужна проверка доступности моделей в дополнениях

MHQ_list = [_mhq, _hq];

diag_log format ["Log: [cfg_mhq] %1", MHQ_list];

publicVariable "MHQ_list";
