# Apply current config and force a daily reset right now.
scoreboard players operation daily_reset item_hunt_timer = ticks item_hunt_config
function item_hunt:daily_reset
tellraw @s {"nbt":"cfg_applied","storage":"item_hunt:lang","interpret":true}
