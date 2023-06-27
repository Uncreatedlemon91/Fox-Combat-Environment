params ["_role"];
_cam = player getVariable "Cam";
_cam camPrepareTarget _role;
_cam camCommitPrepared 1; // needed for relative position
_cam camPrepareRelPos [0, 3, 1.5];
_cam cameraEffect ["internal", "back"];
_cam camCommitPrepared 1;

// set the role to the player for later reference 
player setVariable ["roleLoadout", _role];