#initiator function for item_hunt datapack

#create scoreboards
scoreboard objectives add item_hunt dummy
# Wipe the objective instead of "set @a 0": the #load tag runs BEFORE the player
# is in the world, so @a is empty here and that set reached nobody. Anyone who
# had completed the list before the world was closed kept daily_success >= 1,
# so item_tick never scanned them -- and since scan_item is what writes the item
# lines onto the sidebar, the item list never got drawn at all (the timer still
# ran, because timer_tick does not depend on players).
# Removing the objective clears every stored score, offline players included;
# item_tick then sets each player to 0 on their first tick in the world.
scoreboard objectives add item_hunt_daily_success dummy
scoreboard objectives remove item_hunt_daily_success
scoreboard objectives add item_hunt_daily_success dummy
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
# dimension: item pool by dimension. 1=Overworld, 2=+Nether, 3=+End. Default Overworld.
execute unless score dimension item_hunt_config matches -2147483648.. run scoreboard players set dimension item_hunt_config 1

# Inicializar storage para el reloj
data modify storage item_hunt:clock time set value {}
data modify storage item_hunt:clock time.prev_hora set value -1
data modify storage item_hunt:clock time.prev_minuto set value -1
data modify storage item_hunt:clock time.curr_hora set value 0
data modify storage item_hunt:clock time.curr_minuto set value 0
# Zero-padding for the sidebar clock: "0" when the value is a single digit, ""
# otherwise. Kept in storage rather than computed in the macro because a macro
# can only paste strings, not format them. See update_time_display.
data modify storage item_hunt:clock time.prev_hpad set value ""
data modify storage item_hunt:clock time.prev_pad set value ""
data modify storage item_hunt:clock time.hpad set value ""
data modify storage item_hunt:clock time.pad set value ""

#setup daily reset function at midnight (pendiente)
#schedule function item_hunt:daily_reset 24h append

#load the master item table into storage item_hunt:items (needed before resolving)
function item_hunt:setup_items

#seed the first day's items immediately so the game is playable from load
#(sin esto no habria items hasta el primer reset a las 24h)
#el rango depende de la dimension elegida (Overworld/Nether/End)
function item_hunt:config/resolve_range
function item_hunt:random with storage item_hunt:cfg args
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


#initialize groups (cosmetic teams)
# Exactly three states, assigned every tick by item_hunt:teams_tick:
#   item_hunt_top_winner_daily   ✨name✨ ⭐  holds a top-rank buff AND finished today
#   item_hunt_top_winner         ✨name✨     holds a top-rank buff
#   item_hunt_daily_winners      name ⭐      finished today's list
# ✨ follows the buff, so it only shows while "Buff a top players" is >= 1.
#
# Each team is REMOVED and re-added here so that (a) a world reload starts the
# day with them empty -- a reload rolls a fresh item list, so yesterday's ⭐ has
# to go -- and (b) edits to the prefixes/suffixes below always take effect.
team remove item_hunt_daily_winners
team add item_hunt_daily_winners "Item Hunt Daily Winners"
team modify item_hunt_daily_winners suffix {"text":" ⭐","color":"gold", "bold": false}

team remove item_hunt_top_winner
team add item_hunt_top_winner "Item Hunt Top Winner"
team modify item_hunt_top_winner prefix {"text":"✨","color":"gold", "bold": false}
team modify item_hunt_top_winner suffix {"text":"✨","color":"gold", "bold": false}
team modify item_hunt_top_winner color aqua

team remove item_hunt_top_winner_daily
team add item_hunt_top_winner_daily "Item Hunt Top Winner Daily"
team modify item_hunt_top_winner_daily prefix {"text":"✨","color":"gold", "bold": false}
team modify item_hunt_top_winner_daily suffix {"text":"✨ ⭐","color":"gold", "bold": false}
team modify item_hunt_top_winner_daily color aqua

# Obsolete "first to finish" teams (⭐⭐). Dropped: finishing first is already
# announced in chat and rewarded with points, it no longer gets its own tag.
# 'add' before 'remove' so that neither command can error: on a world that still
# has them the add fails harmlessly, and from then on both succeed.
team add item_hunt_daily_winners_first
team remove item_hunt_daily_winners_first
team add item_hunt_top_winner_daily_first
team remove item_hunt_top_winner_daily_first

#load config
function item_hunt:config/refresh

# Detect Item Hunt addons on the first tick after load (more reliable than schedule)
scoreboard players set addon_check item_hunt 1