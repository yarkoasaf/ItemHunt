# Sidebar indicators for active modes. Priorities 101/100 place them at the top,
# under the title. Called from display (on reset) and config/refresh (on change).

# Modo carreras
execute if score race item_hunt_config matches 1 run scoreboard players set item_hunt_race_line item_hunt_board 101
execute if score race item_hunt_config matches 1 run scoreboard players display name item_hunt_race_line item_hunt_board {"text":"MODO CARRERA","color":"yellow","bold":true}
execute unless score race item_hunt_config matches 1 run scoreboard players reset item_hunt_race_line item_hunt_board

# Items se consumen
execute if score consume item_hunt_config matches 1 run scoreboard players set item_hunt_consume_line item_hunt_board 100
execute if score consume item_hunt_config matches 1 run scoreboard players display name item_hunt_consume_line item_hunt_board {"text":"Items se consumen","color":"gold"}
execute unless score consume item_hunt_config matches 1 run scoreboard players reset item_hunt_consume_line item_hunt_board

# Ender Eyes addon indicator (detected via ITEM_HUNT_ADDONS)
execute if score ender_eye_ok ITEM_HUNT_ADDONS matches 1 run scoreboard players set item_hunt_ender_addon item_hunt_board 102
execute if score ender_eye_ok ITEM_HUNT_ADDONS matches 1 run scoreboard players display name item_hunt_ender_addon item_hunt_board {"text":"ender addon","color":"light_purple"}
execute unless score ender_eye_ok ITEM_HUNT_ADDONS matches 1 run scoreboard players reset item_hunt_ender_addon item_hunt_board