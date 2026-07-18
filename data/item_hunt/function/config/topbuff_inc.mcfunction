# +1 buff a top players (clamp max 5). Redraws the menu.
execute if score topbuff item_hunt_config matches ..4 run scoreboard players add topbuff item_hunt_config 1
function item_hunt:config/refresh
function item_hunt:config/open
