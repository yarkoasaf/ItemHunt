# -1 buff a top players (clamp min 0). Redraws the menu.
execute if score topbuff item_hunt_config matches 1.. run scoreboard players remove topbuff item_hunt_config 1
function item_hunt:config/refresh
function item_hunt:config/open
