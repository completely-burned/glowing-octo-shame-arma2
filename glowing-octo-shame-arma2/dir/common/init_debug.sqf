/*
 * Изменение игры помогающие отладке.
 */

// При отладке в траве нет необходимости.
setTerrainGrid 50;
// Чтобы успеть увидеть.
setAccTime 0.5;
// Помогает учесть как день так и ночь.
setTimeMultiplier 50;

missionNamespace setVariable ["enemyCoefficient", 1];
missionNamespace setVariable ["gosa_patrolCoefficient", 5];

