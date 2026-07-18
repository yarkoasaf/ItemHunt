# +1 item per day (clamp max 7). Redraws the menu.
execute if score count item_hunt_config matches ..6 run scoreboard players add count item_hunt_config 1
function item_hunt:config/refresh
function item_hunt:config/open
