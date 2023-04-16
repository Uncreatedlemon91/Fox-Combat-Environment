// Compile all the load scripts in one place. 
[] execVM "Persistence\LoadVehicle.sqf";				// Add in saved vehicles 
sleep 10;
[] execVM "Persistence\SaveFactionVehs.sqf";			// Save all faction vehicles 
