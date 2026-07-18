#initiator function for item_hunt datapack

#create scoreboards
scoreboard objectives add item_hunt dummy
scoreboard objectives add item_hunt_daily_success dummy
scoreboard players set @a item_hunt_daily_success 0
scoreboard players set $base item_hunt_daily_success 1

scoreboard objectives add item_hunt_rankeds dummy
scoreboard players set $max item_hunt_rankeds -2147483648

scoreboard objectives add item_hunt_timer dummy
scoreboard players set daily_reset item_hunt_timer 0
scoreboard players set const_1200 item_hunt_timer 1200
scoreboard players set const_60 item_hunt_timer 60
scoreboard players set minutos item_hunt_timer 0
scoreboard players set minutos_prev item_hunt_timer -1
scoreboard players set minutos_display item_hunt_timer 0
scoreboard players set horas_display item_hunt_timer 0

scoreboard objectives add item_hunt_item1 dummy
scoreboard objectives add item_hunt_item2 dummy
scoreboard objectives add item_hunt_item3 dummy
scoreboard objectives add item_hunt_item4 dummy
scoreboard objectives add item_hunt_item5 dummy
scoreboard objectives add item_hunt_item6 dummy
scoreboard objectives add item_hunt_item7 dummy

# Per-player counter of how many of today's items they have found
scoreboard objectives add item_hunt_found dummy

# Config: "count" = items per day (1-7), "ticks" = countdown length, "active" =
# count in effect for the current day. Defaults set ONLY if not already present,
# so the admin's chosen config survives reloads.
scoreboard objectives add item_hunt_config dummy
scoreboard objectives add ITEM_HUNT_ADDONS dummy
execute unless score count item_hunt_config matches -2147483648.. run scoreboard players set count item_hunt_config 3
execute unless score ticks item_hunt_config matches -2147483648.. run scoreboard players set ticks item_hunt_config 1728000
execute unless score teams item_hunt_config matches -2147483648.. run scoreboard players set teams item_hunt_config 1
execute unless score tab item_hunt_config matches -2147483648.. run scoreboard players set tab item_hunt_config 1
execute unless score consume item_hunt_config matches -2147483648.. run scoreboard players set consume item_hunt_config 0
execute unless score race item_hunt_config matches -2147483648.. run scoreboard players set race item_hunt_config 0
execute unless score topbuff item_hunt_config matches -2147483648.. run scoreboard players set topbuff item_hunt_config 0

# Inicializar storage para el reloj
data modify storage item_hunt:clock time set value {}
data modify storage item_hunt:clock time.prev_hora set value -1
data modify storage item_hunt:clock time.prev_minuto set value -1
data modify storage item_hunt:clock time.curr_hora set value 0
data modify storage item_hunt:clock time.curr_minuto set value 0

#setup daily reset function at midnight (pendiente)
#schedule function item_hunt:daily_reset 24h append

#load the master item table into storage item_hunt:items (needed before resolving)
function item_hunt:setup_items

#seed the first day's items immediately so the game is playable from load
#(sin esto no habria items hasta el primer reset a las 24h)
function item_hunt:random {min:1,max:1228}
function item_hunt:resolve_items

#fija el numero de items del primer dia
scoreboard players operation active item_hunt_config = count item_hunt_config

#initialize display
function item_hunt:display

#timer
scoreboard players add display_check item_hunt 0

#almacena valor (template) en target_int en storage item_hunt:data
scoreboard players set random_int item_hunt 0
execute store result storage item_hunt:data target_int int 1 run scoreboard players get random_int item_hunt


#initialize groups
team add item_hunt_daily_winners "Item Hunt Daily Winners"
team modify item_hunt_daily_winners suffix {"text":" ⭐","color":"gold", "bold": false}

team add item_hunt_top_winner "Item Hunt Top Winner"
team modify item_hunt_top_winner prefix {"text":"✨","color":"gold", "bold": false}
team modify item_hunt_top_winner suffix {"text":"✨","color":"gold", "bold": false}
team modify item_hunt_top_winner color aqua

team add item_hunt_top_winner_daily "Item Hunt Top Winner Daily"
team modify item_hunt_top_winner_daily prefix {"text":"✨","color":"gold", "bold": false}
team modify item_hunt_top_winner_daily suffix {"text":"✨ ⭐","color":"gold", "bold": false}
team modify item_hunt_top_winner_daily color aqua

team add item_hunt_daily_winners_first "Item Hunt Daily Winners First"
team modify item_hunt_daily_winners_first suffix {"text":" ⭐⭐","color":"gold", "bold": false}

team add item_hunt_top_winner_daily_first "Item Hunt Top Winner Daily First"
team modify item_hunt_top_winner_daily_first prefix {"text":"✨","color":"gold", "bold": false}
team modify item_hunt_top_winner_daily_first suffix {"text":"✨ ⭐⭐","color":"gold", "bold": false}
team modify item_hunt_top_winner_daily_first color aqua

#load config
function item_hunt:config/refresh

# Detect Item Hunt addons on the first tick after load (more reliable than schedule)
scoreboard players set addon_check item_hunt 1