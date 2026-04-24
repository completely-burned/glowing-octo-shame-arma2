// TODO: Singleplayer

if !(isNil "gosa_deviceType") exitWith {gosa_deviceType};

// sv true, cl false, sv
if (isDedicated) exitWith {0};

// sv true, cl true, sv+cl
if (isServer) exitWith {1};

// sv false, cl true, cl
if (hasInterface) exitWith {2};

// sv false, cl false, hc
3;
