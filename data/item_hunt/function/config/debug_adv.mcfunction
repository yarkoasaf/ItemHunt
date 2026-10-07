# Admin readout for the repeatable "+50 items" advancement.
#   /function item_hunt:config/debug_adv
# Not linked from the config menu on purpose: it is a debugging tool, not a
# game setting. The buttons below only touch the score, so they exercise the
# real path (item_hunt:plus50_check derives everything from item_hunt_rankeds).

tellraw @s [""]
tellraw @s ["",{"text":"== ","color":"aqua"},{"text":"Debug: +50 items","color":"aqua","bold":true},{"text":" ==","color":"aqua"}]
tellraw @s ["",{"text":"Score (item_hunt_rankeds): ","color":"white"},{"score":{"name":"@s","objective":"item_hunt_rankeds"},"color":"yellow","bold":true}]
tellraw @s ["",{"text":"Premios pagados: ","color":"white"},{"score":{"name":"@s","objective":"item_hunt_plus50_paid"},"color":"yellow","bold":true},{"text":"  (esperados: score/50 - 1, minimo 0)","color":"dark_gray"}]
tellraw @s ["",{"text":"Pendientes: ","color":"white"},{"score":{"name":"@s","objective":"item_hunt_plus50"},"color":"yellow","bold":true},{"text":"  (>= 1 => el logro se otorga este tick)","color":"dark_gray"}]
execute if entity @s[advancements={item_hunt:score_plus50=true}] run tellraw @s ["",{"text":"Logro en mano: ","color":"white"},{"text":"si","color":"green","bold":true},{"text":" (se banca y se revoca en el proximo tick)","color":"dark_gray"}]
execute unless entity @s[advancements={item_hunt:score_plus50=true}] run tellraw @s ["",{"text":"Logro en mano: ","color":"white"},{"text":"no","color":"gray"}]

# Log de cada premio en el chat
execute if score debug item_hunt_config matches 1 run tellraw @s ["",{"text":"Log en chat: ","color":"white"},{"text":"[ON]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_debug {val:1}"}},{"text":" "},{"text":"[OFF]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_debug {val:0}"}}]
execute unless score debug item_hunt_config matches 1 run tellraw @s ["",{"text":"Log en chat: ","color":"white"},{"text":"[ON]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_debug {val:1}"}},{"text":" "},{"text":"[OFF]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_debug {val:0}"}}]

tellraw @s [""]
tellraw @s ["",{"text":"Probar: ","color":"white"},{"text":"[+50 score]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/scoreboard players add @s item_hunt_rankeds 50"},"hoverEvent":{"action":"show_text","contents":"Suma 50 puntos: debe disparar el logro en el tick siguiente"}},{"text":" "},{"text":"[-50 score]","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players remove @s item_hunt_rankeds 50"},"hoverEvent":{"action":"show_text","contents":"Quita 50 puntos: los premios pagados se ajustan solos"}},{"text":" "},{"text":"[score 0]","color":"gold","clickEvent":{"action":"run_command","value":"/scoreboard players set @s item_hunt_rankeds 0"},"hoverEvent":{"action":"show_text","contents":"Deja el score en 0 (los premios pagados vuelven a 0)"}}]
tellraw @s ["",{"text":"[Refrescar]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/debug_adv"}}]
