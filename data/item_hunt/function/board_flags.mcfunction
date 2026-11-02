# Sidebar indicators for active modes: this decides which of them are VISIBLE.
# Priorities 101/100/102 place them at the top, under the title.
# Called from display on reset, config/refresh on change, and detect_addons.
#
# The names themselves are set by item_hunt:lang/board, because a display name
# is rendered client-side and so has to be a literal component per language.
# Setting a score here is what makes the line appear; resetting it hides the
# line and leaves its name harmlessly stored.

# Modo carreras
execute if score race item_hunt_config matches 1 run scoreboard players set item_hunt_race_line item_hunt_board 101
execute unless score race item_hunt_config matches 1 run scoreboard players reset item_hunt_race_line item_hunt_board

# Items se consumen
execute if score consume item_hunt_config matches 1 run scoreboard players set item_hunt_consume_line item_hunt_board 100
execute unless score consume item_hunt_config matches 1 run scoreboard players reset item_hunt_consume_line item_hunt_board

# Portals addon indicator (detected via ITEM_HUNT_ADDONS)
execute if score portals_ok ITEM_HUNT_ADDONS matches 1 run scoreboard players set item_hunt_portals_addon item_hunt_board 102
execute unless score portals_ok ITEM_HUNT_ADDONS matches 1 run scoreboard players reset item_hunt_portals_addon item_hunt_board
