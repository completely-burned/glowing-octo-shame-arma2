/*---------------------------------------------------------------------------
динамический sleep для сервера
_this максимальный sleep при fps 0
при fps 50 будет 0
при fps 25 будет _this/2
при fps 40 и _this 50 будет 10
возвращает число для sleep
---------------------------------------------------------------------------*/
private ["_fps"];
if(isDedicated)then{
	_fps = 50;
}else{
	_fps = 180;
};

_this - (diag_fps * (_this / _fps ))
