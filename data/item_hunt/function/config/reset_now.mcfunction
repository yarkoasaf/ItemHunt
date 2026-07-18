# Apply current config and force a daily reset right now.
scoreboard players operation daily_reset item_hunt_timer = ticks item_hunt_config
function item_hunt:daily_reset
tellraw @s [{"text":"[Item Hunt] ","color":"aqua"},{"text":"Config aplicada y dia reiniciado.","color":"green"}]
