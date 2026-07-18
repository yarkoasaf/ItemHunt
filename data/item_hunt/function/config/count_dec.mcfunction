# -1 item per day (clamp min 1). Redraws the menu.
execute if score count item_hunt_config matches 2.. run scoreboard players remove count item_hunt_config 1
function item_hunt:config/refresh
function item_hunt:config/open
