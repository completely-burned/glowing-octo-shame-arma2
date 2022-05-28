diag_log format ["Log: [EH, onPlayerDisconnected] %1", _this];

#ifndef __ARMA3__
// TODO: Нужна возможность удаления.
[nil, objNull, rgosa_setMapPlayers, _this select 1] call RE;
#endif
