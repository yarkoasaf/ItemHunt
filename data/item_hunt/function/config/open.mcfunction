# Item Hunt config menu (clickable chat). Replaces the 1.21.6 dialog (not available in 1.21.1).
# Must be run by an operator. Buttons re-run this function to redraw with the new state.

tellraw @s ["",{"text":"== ","color":"aqua"},{"text":"Configuracion Item Hunt","color":"aqua","bold":true},{"text":" ==","color":"aqua"}]
tellraw @s [{"text":"Ref ticks (20t=1s): ","color":"gray"},{"text":"24h=1728000 12h=864000 6h=432000 3h=216000 1h=72000 30m=36000 10m=12000 1m=1200","color":"dark_gray"}]

# Items por dia (1-7)
tellraw @s ["",{"text":"Items por dia: ","color":"white"},{"text":"[-]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/count_dec"},"hoverEvent":{"action":"show_text","contents":"Quitar 1 (min 1)"}},{"text":"  "},{"score":{"name":"count","objective":"item_hunt_config"},"color":"yellow","bold":true},{"text":"  "},{"text":"[+]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/count_inc"},"hoverEvent":{"action":"show_text","contents":"Agregar 1 (max 7)"}}]

# Buff a top players (0-5)
tellraw @s ["",{"text":"Buff a top players: ","color":"white"},{"text":"[-]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/topbuff_dec"},"hoverEvent":{"action":"show_text","contents":"Cuantas personas top reciben buff (min 0)"}},{"text":"  "},{"score":{"name":"topbuff","objective":"item_hunt_config"},"color":"yellow","bold":true},{"text":"  "},{"text":"[+]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/topbuff_inc"},"hoverEvent":{"action":"show_text","contents":"Cuantas personas top reciben buff (max 5)"}}]

# Ticks hasta reinicio (presets)
tellraw @s ["",{"text":"Ticks hasta reinicio: ","color":"white"},{"score":{"name":"ticks","objective":"item_hunt_config"},"color":"yellow","bold":true}]
tellraw @s ["",{"text":"  "},{"text":"[24h]","color":"aqua","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_ticks {ticks:1728000}"}},{"text":" "},{"text":"[12h]","color":"aqua","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_ticks {ticks:864000}"}},{"text":" "},{"text":"[6h]","color":"aqua","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_ticks {ticks:432000}"}},{"text":" "},{"text":"[3h]","color":"aqua","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_ticks {ticks:216000}"}}]
tellraw @s ["",{"text":"  "},{"text":"[1h]","color":"aqua","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_ticks {ticks:72000}"}},{"text":" "},{"text":"[30m]","color":"aqua","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_ticks {ticks:36000}"}},{"text":" "},{"text":"[10m]","color":"aqua","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_ticks {ticks:12000}"}},{"text":" "},{"text":"[1m]","color":"aqua","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_ticks {ticks:1200}"}}]

# Colores de equipo (doble switch)
execute if score teams item_hunt_config matches 1 run tellraw @s ["",{"text":"Colores de equipo: ","color":"white"},{"text":"[ON]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:teams,val:1}"}},{"text":" "},{"text":"[OFF]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:teams,val:0}"}}]
execute unless score teams item_hunt_config matches 1 run tellraw @s ["",{"text":"Colores de equipo: ","color":"white"},{"text":"[ON]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:teams,val:1}"}},{"text":" "},{"text":"[OFF]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:teams,val:0}"}}]

# Puntos en el tab (doble switch)
execute if score tab item_hunt_config matches 1 run tellraw @s ["",{"text":"Puntos en el tab: ","color":"white"},{"text":"[ON]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:tab,val:1}"}},{"text":" "},{"text":"[OFF]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:tab,val:0}"}}]
execute unless score tab item_hunt_config matches 1 run tellraw @s ["",{"text":"Puntos en el tab: ","color":"white"},{"text":"[ON]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:tab,val:1}"}},{"text":" "},{"text":"[OFF]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:tab,val:0}"}}]

# Consumir items al completar (doble switch)
execute if score consume item_hunt_config matches 1 run tellraw @s ["",{"text":"Consumir items (-1 c/u): ","color":"white"},{"text":"[ON]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:consume,val:1}"}},{"text":" "},{"text":"[OFF]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:consume,val:0}"}}]
execute unless score consume item_hunt_config matches 1 run tellraw @s ["",{"text":"Consumir items (-1 c/u): ","color":"white"},{"text":"[ON]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:consume,val:1}"}},{"text":" "},{"text":"[OFF]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:consume,val:0}"}}]

# Modo carreras (doble switch)
execute if score race item_hunt_config matches 1 run tellraw @s ["",{"text":"Modo carreras: ","color":"white"},{"text":"[ON]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:race,val:1}"}},{"text":" "},{"text":"[OFF]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:race,val:0}"}}]
execute unless score race item_hunt_config matches 1 run tellraw @s ["",{"text":"Modo carreras: ","color":"white"},{"text":"[ON]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:race,val:1}"}},{"text":" "},{"text":"[OFF]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_flag {key:race,val:0}"}}]

# Acciones
tellraw @s ["",{"text":"[Guardar y reiniciar ahora]","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/reset_now"},"hoverEvent":{"action":"show_text","contents":"Aplica la config y reinicia el dia ahora"}},{"text":"   "},{"text":"[Refrescar]","color":"yellow","clickEvent":{"action":"run_command","value":"/function item_hunt:config/open"}}]
tellraw @s [{"text":"Nota: los cambios de items/ticks se aplican en el proximo reinicio.","color":"gray","italic":true}]
