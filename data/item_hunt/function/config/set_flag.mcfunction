# Macro: set a boolean config flag explicitly (no toggle -> no stuck state).
# Called by the [ON]/[OFF] buttons: set_flag {key:teams|tab|consume|race, val:0|1}
$scoreboard players set $(key) item_hunt_config $(val)
function item_hunt:config/refresh
function item_hunt:config/open
