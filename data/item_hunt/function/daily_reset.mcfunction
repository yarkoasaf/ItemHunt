tellraw @a [{"text":"[Item Hunt] ","color":"aqua"},{"text":"Reiniciando items del día...","color":"yellow"}]
playsound minecraft:block.note_block.pling player @a ~ ~ ~ 1 1.5
#incia random con min y max
#el rango depende de la dimension elegida (Overworld/Nether/End)
#la tabla esta ordenada Overworld -> Nether -> End; resolve_range fija el max
function item_hunt:config/resolve_range
function item_hunt:random with storage item_hunt:cfg args

#resuelve los numeros a items cacheados en storage item_hunt:data (slot1..slot7)
function item_hunt:resolve_items

#snapshot: el numero de items del dia se fija ahora (cambios mid-day no afectan el dia en curso)
scoreboard players operation active item_hunt_config = count item_hunt_config

#reset display
function item_hunt:display
#reset display_check
scoreboard players set display_check item_hunt 0

#reset daily success
scoreboard objectives remove item_hunt_daily_success
scoreboard objectives add item_hunt_daily_success dummy
scoreboard players set $base item_hunt_daily_success 1
scoreboard players set @a item_hunt_daily_success 0

#reset daily winners team
execute if score teams item_hunt_config matches 1 run team empty item_hunt_daily_winners
execute if score teams item_hunt_config matches 1 run team empty item_hunt_daily_winners_first
execute if score teams item_hunt_config matches 1 run team empty item_hunt_top_winner_daily
execute if score teams item_hunt_config matches 1 run team empty item_hunt_top_winner_daily_first
execute if score teams item_hunt_config matches 1 as @a[tag=top_player] run team join item_hunt_top_winner @s

#add clock display
function item_hunt:on_minute_changed