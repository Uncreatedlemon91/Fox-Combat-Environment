// Spawn ai group from params passed by Trigger. 
params ["_data"];

// Extract data from passed argument 
_regiment = _data select 0;
_rank = _data select 1;
_pos = _data select 2;
_class = _data select 3;

format ["%1 Spawned at %2 Difficulty for %3!", _class, _rank, _regiment] remoteExec ["systemChat", 0];