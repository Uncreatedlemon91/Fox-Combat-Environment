// Reviews player loadout and determines if their kit maximums are correct or not 
params [];

// Variables 
_kit = player getVariable "roleLoadout";
_curKit = getUnitLoadout player;
copyToClipboard str _curKit;

// Get player loadout and count magazines / items
_mags = magazines player; 

// Check whitelist and delete items that are not in there 