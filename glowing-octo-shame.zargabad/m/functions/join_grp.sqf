[player] join (_this select 3);
if (!isPlayer leader (_this select 3)) then {
	group (_this select 3) selectLeader player;
};
