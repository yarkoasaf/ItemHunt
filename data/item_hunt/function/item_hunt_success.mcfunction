scoreboard players operation @s item_hunt_daily_success = $base item_hunt_daily_success
scoreboard players add $base item_hunt_daily_success 1

#compute the reward points now so the messages can show it
scoreboard players operation reward item_hunt_config = active item_hunt_config
#scoreboard players operation reward item_hunt_config += active item_hunt_config
#scoreboard players remove reward item_hunt_config 1

#message to all players that @s was the first to find all items
execute if score @s item_hunt_daily_success matches 1 run tellraw @a ["",{"text":"[Item Hunt] ","color":"aqua"},{"text":"¡","color":"gold"},{"selector":"@s","color":"gold"},{"text":" Ha encontrado los ","color":"gold"},{"score":{"name":"active","objective":"item_hunt_config"},"color":"yellow","bold":true},{"text":" items antes que todos!","color":"gold"},{"text":" (+","color":"green"},{"score":{"name":"reward","objective":"item_hunt_config"},"color":"green","bold":true},{"text":" puntos)","color":"green"}]
#message to all players that @s has found all items
execute if score @s item_hunt_daily_success matches 2.. run tellraw @a ["",{"text":"[Item Hunt] ","color":"aqua"},{"text":"¡","color":"gold"},{"selector":"@s","color":"gold"},{"text":" Ha encontrado los ","color":"gold"},{"score":{"name":"active","objective":"item_hunt_config"},"color":"yellow","bold":true},{"text":" items del día!","color":"gold"},{"text":" (+","color":"green"},{"score":{"name":"reward","objective":"item_hunt_config"},"color":"green","bold":true},{"text":" puntos)","color":"green"}]

execute as @a run playsound minecraft:entity.player.levelup master @s ^ ^ ^ 1 0.6
execute as @s run playsound minecraft:entity.cat.ambient master @s ^ ^ ^ 1 1.7


#give scoreboard reward points; scales with the number of items in the list.
#points = 1 per item in the list
scoreboard players operation @s item_hunt_rankeds += reward item_hunt_config

#give random reward (50)
function item_hunt:premios/elegir

#busca top player
execute as @s run function item_hunt:busca_top_player

#mark @s as a winner of THIS tick, for the tie check in item_hunt:race_check
tag @s add won_this_tick

#teams: no se asignan aqui. item_hunt:teams_tick los recalcula cada tick a
#partir de daily_success y del tag buff_target, asi el icono refleja el estado
#actual (y se quita solo al perder el top o al recargar el mundo).


#remove 1 of each hunted item on completion, if the "consume" toggle is on
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 1.. run function item_hunt:config/consume_item with storage item_hunt:data slot1
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 2.. run function item_hunt:config/consume_item with storage item_hunt:data slot2
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 3.. run function item_hunt:config/consume_item with storage item_hunt:data slot3
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 4.. run function item_hunt:config/consume_item with storage item_hunt:data slot4
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 5.. run function item_hunt:config/consume_item with storage item_hunt:data slot5
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 6.. run function item_hunt:config/consume_item with storage item_hunt:data slot6
execute if score consume item_hunt_config matches 1 if score active item_hunt_config matches 7.. run function item_hunt:config/consume_item with storage item_hunt:data slot7

#modo carreras: solo marca la ronda para reiniciarla. El reinicio real lo hace
#item_hunt:race_check una vez que score_handler termino su bucle "as @a".
#Reiniciar aqui mismo le regalaba la ronda nueva al segundo jugador de un empate.
execute if score race item_hunt_config matches 1 if score @s item_hunt_daily_success matches 1 run scoreboard players set #race_reset item_hunt_config 1

#hook de completado: los addons se enganchan a este tag (ej: dar ojo de ender)
function #item_hunt:on_complete