scoreboard players operation @s item_hunt_daily_success = $base item_hunt_daily_success
scoreboard players add $base item_hunt_daily_success 1

#message to all players that @s was the first to find all items
execute if score @s item_hunt_daily_success matches 1 run tellraw @a [{"text":"[Item Hunt] ","color":"aqua"},{"text":"¡","color":"gold"},{"selector":"@s"},{"text":" Ha encontrado todos los items del día antes que todos!","color":"gold"}]
#message to all players that @s has found all items
execute if score @s item_hunt_daily_success matches 2.. run tellraw @a [{"text":"[Item Hunt] ","color":"aqua"},{"text":"¡","color":"gold"},{"selector":"@s"},{"text":" Ha encontrado todos los items del día!","color":"gold"}]

execute as @a run playsound minecraft:entity.player.levelup master @s ^ ^ ^ 1 0.6
execute as @s run playsound minecraft:entity.cat.ambient master @s ^ ^ ^ 1 1.7


#give scoreboard reward points
scoreboard players add @s item_hunt_rankeds 1

#give random reward (25)
function item_hunt:premios/elegir

#busca top player
execute as @s run function item_hunt:busca_top_player

#add player to daily winners team
#daily winners team
execute if score teams item_hunt_config matches 1 as @a if score @s item_hunt_daily_success matches 1.. run team join item_hunt_daily_winners @s
#daily winner team if top player
execute if score teams item_hunt_config matches 1 as @a[tag=top_player] if score @s item_hunt_daily_success matches 1.. run team join item_hunt_top_winner_daily @s
#daily winners first
execute if score teams item_hunt_config matches 1 as @a if score @s item_hunt_daily_success matches 1 run team join item_hunt_daily_winners_first @s
#daily winner first if top player
execute if score teams item_hunt_config matches 1 as @a[tag=top_player] if score @s item_hunt_daily_success matches 1 run team join item_hunt_top_winner_daily_first @s


#remove 1 of each hunted item on completion, if the "consume" toggle is on
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 1.. run function item_hunt:config/consume_item with storage item_hunt:data slot1
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 2.. run function item_hunt:config/consume_item with storage item_hunt:data slot2
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 3.. run function item_hunt:config/consume_item with storage item_hunt:data slot3
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 4.. run function item_hunt:config/consume_item with storage item_hunt:data slot4
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 5.. run function item_hunt:config/consume_item with storage item_hunt:data slot5
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 6.. run function item_hunt:config/consume_item with storage item_hunt:data slot6
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 7.. run function item_hunt:config/consume_item with storage item_hunt:data slot7

#modo carreras: si el primer jugador completa la lista, reinicia la ronda (el timer se reinicia tambien)
execute if score race item_hunt_config matches 1 if score @s item_hunt_daily_success matches 1 run scoreboard players operation daily_reset item_hunt_timer = ticks item_hunt_config
execute if score race item_hunt_config matches 1 if score @s item_hunt_daily_success matches 1 run function item_hunt:daily_reset

#hook de completado: los addons se enganchan a este tag (ej: dar ojo de ender)
function #item_hunt:on_complete