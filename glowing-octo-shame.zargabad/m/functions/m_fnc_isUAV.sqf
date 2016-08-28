private ["_isUAV"];
_isUAV=false;

if(_this isKindOf "UAV")then{
	_isUAV=true;
}else{
	if(getNumber (LIB_cfgVeh >> _this >> "isUav") == 1)then{
		_isUAV=true;
	};
};

_isUAV;
