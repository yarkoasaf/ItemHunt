execute if score tab item_hunt_config matches 1 run scoreboard objectives setdisplay list item_hunt_rankeds
execute unless score tab item_hunt_config matches 1 run scoreboard objectives setdisplay list
execute unless score teams item_hunt_config matches 1 run team empty item_hunt_daily_winners
execute unless score teams item_hunt_config matches 1 run team empty item_hunt_top_winner
execute unless score teams item_hunt_config matches 1 run team empty item_hunt_top_winner_daily

# Modo de pantalla: global muestra el sidebar, silent lo esconde y deja la info
# en el actionbar al agacharse (item_hunt:silent_tick).
execute if score hud item_hunt_config matches 1 run scoreboard objectives setdisplay sidebar item_hunt_board
execute unless score hud item_hunt_config matches 1 run scoreboard objectives setdisplay sidebar
# Al volver a global, borra el actionbar que pudiera quedar en pantalla y cierra
# las ventanas abiertas (si no, siguen contando con el sidebar ya visible).
execute if score hud item_hunt_config matches 1 run title @a actionbar {"text":""}
execute if score hud item_hunt_config matches 1 run scoreboard players set @a item_hunt_hud 0
# Re-measure: picks up a hudwidth edited by hand with /scoreboard, and makes
# sure the pages exist before the first player crouches in silent mode.
function item_hunt:silent/measure

# Reload the active language, then repaint everything that holds text: the
# sidebar header + objective title (lang/board) and the mode indicators
# (board_flags). Without this the language button would only take effect on
# the next daily reset.
function item_hunt:lang/apply
function item_hunt:lang/board

# Update the sidebar mode indicators
function item_hunt:board_flags