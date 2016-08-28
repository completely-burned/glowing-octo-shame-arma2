Private["_camera"];

BIS_WF_DeathLocation = GetPos player;

_camera = "camera" CamCreate BIS_WF_DeathLocation;
_camera CamSetDir 0;
_camera CamSetFOV 1;
_camera cameraEffect["Internal","TOP"];

_camera camSetTarget (_this select 1);
_camera CamSetPos [BIS_WF_DeathLocation Select 0,(BIS_WF_DeathLocation Select 1) + 3,5];

_camera CamCommit 30;
WaitUntil {CamCommitted _camera or alive player or !alive (_this select 1)};

Sleep 2.5;

_camera CameraEffect["TERMINATE","BACK"];
CamDestroy _camera;
