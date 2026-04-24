
#define BIS_SSM_BIKB "\ca\modules_e\SSM\data\bikb\ssmradio.bikb"

diag_log format ["Log: [fnc_SSM_RequestRadio] %1", _this];

gosa_SSM_fnc_POStoSpeechArray = {
  private "_ra";
  _ra = [];
  {
    _ra=_ra+[_x call gosa_SSM_fnc_NtoS];

  } foreach toarray mapgridPosition _this;
  _ra
};

gosa_SSM_fnc_NtoS = {
	private "_r";
	_r = "";
	switch (_this) do
	{
		case 48: {_r = "zero2"};
		case 49: {_r = "one2"};
		case 50: {_r = "two2"};
		case 51: {_r = "three2"};
		case 52: {_r = "four2"};
		case 53: {_r = "five2"};
		case 54: {_r = "six2"};
		case 55: {_r = "seven2"};
		case 56: {_r = "eight2"};
		case 57: {_r = "nine2"};
		case 65: {_r = "alpha"};
		case 66: {_r = "bravo"};
		case 67: {_r = "charlie"};
		case 68: {_r = "delta"};
		case 69: {_r = "echo"};
		case 70: {_r = "fotxtrot"};
		case 71: {_r = "golf"};
		case 72: {_r = "hotel"};
		case 73: {_r = "india"};
		case 74: {_r = "juliet"};
		case 75: {_r = "kilo"};
		case 76: {_r = "lima"};
		case 77: {_r = "mike"};
		case 78: {_r = "november"};
		case 79: {_r = "oscar"};
		case 80: {_r = "papa"};
		case 81: {_r = "quebec"};
		case 82: {_r = "romeo"};
		case 83: {_r = "sierra"};
		case 84: {_r = "tango"};
		case 85: {_r = "uniform"};
		case 86: {_r = "victor"};
		case 87: {_r = "whiskey"};
		case 88: {_r = "xray"};
		case 89: {_r = "yankee"};
		case 90: {_r = "zulu"};

		case 97: {_r = "alpha"};
		case 98: {_r = "bravo"};
		case 99: {_r = "charlie"};
		case 100: {_r = "delta"};
		case 101: {_r = "echo"};
		case 102: {_r = "fotxtrot"};
		case 103: {_r = "golf"};
		case 104: {_r = "hotel"};
		case 105: {_r = "india"};
		case 106: {_r = "juliet"};
		case 107: {_r = "kilo"};
		case 108: {_r = "lima"};
		case 109: {_r = "mike"};
		case 110: {_r = "november"};
		case 111: {_r = "oscar"};
		case 112: {_r = "papa"};
		case 113: {_r = "quebec"};
		case 114: {_r = "romeo"};
		case 115: {_r = "sierra"};
		case 116: {_r = "tango"};
		case 117: {_r = "uniform"};
		case 118: {_r = "victor"};
		case 119: {_r = "whiskey"};
		case 120: {_r = "xray"};
		case 121: {_r = "yankee"};
		case 122: {_r = "zulu"};
	};
	_r
};



private ["_hq","_a","_b","_hq_g"];
_b = _this select 0;
_rp = _this select 1;
_rt = _this select 2;
_hq = _this select 3;
_unit = _this select 4;

_unit kbAddtopic[_rt, BIS_SSM_BIKB];

if (isNull _hq) then {
  // TODO: нужна функция
  _hq_g = createGroup gosa_playerSide; 
  _hq = _hq_g createUnit ["Logic", [10,10,1000], [], 0, "NONE"];
  _hq setGroupId ["HQ", "SIX"];
  //_hq setIdentity "SSMHQ_EN";
  diag_log format ["Log: [fnc_SSM_RequestRadio] %1 %2", _hq_g, units _hq_g];
};

// Radio the request
/*if (false) then
{
  _a = _unit call BIS_SSM_fnc_CStoArray;
  player kbTell [_hq,_rt,_rt + "Request", ["Team",{},(_a select 0)+"-"+(_a select 1)+"-"+(_a select 2)+" ",_a],
  ["Location",{}, mapgridposition _rp,_rp call BIS_SSM_fnc_POStoSpeechArray],true];
  waitUntil {player kbWasSaid [_hq,_rt,_rt+"Request", 3]};
}*/
  _unit kbTell [_hq,_rt,_rt + "Request0", ["Team",{},"",[]],["Location",{}, mapgridposition _rp,_rp call gosa_SSM_fnc_POStoSpeechArray],true];
  //waitUntil {player kbWasSaid [_hq,_rt,_rt+"Request0", 3]};

if (!isNil "_hq_g") then {
  {
    deleteVehicle _x;
  } forEach units _hq_g;
  deleteGroup _hq_g;
};

diag_log format ["Log: [fnc_SSM_RequestRadio] end %1 %2", _hq_g, units _hq_g];
