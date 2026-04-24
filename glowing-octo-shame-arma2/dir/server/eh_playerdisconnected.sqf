diag_log format ["Log: [EH, onPlayerDisconnected] %1", _this];

//"Log: [EH, onPlayerDisconnected] [2,"","__SERVER__"]"
// TODO: "".

#ifndef __ARMA3__
if (_this select 1 != "") then {
// TODO: Нужна возможность удаления.
[nil, objNull, rgosa_setMapPlayers, _this select 1] call RE;
};
#endif
