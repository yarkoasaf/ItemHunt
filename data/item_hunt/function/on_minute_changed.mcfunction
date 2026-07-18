#tellraw @a [{"text":"[Item Hunt] ","color":"aqua"},{"text":"Minuto cambiado: ","color":"yellow"},{"score":{"name":"minutos","objective":"item_hunt_timer"},"color":"white"}]

# Actualizar el minuto anterior
scoreboard players operation minutos_prev item_hunt_timer = minutos item_hunt_timer

# minutos_display = minutos % 60
scoreboard players operation minutos_display item_hunt_timer = minutos item_hunt_timer
scoreboard players operation minutos_display item_hunt_timer %= const_60 item_hunt_timer

# horas_display = minutos / 60
scoreboard players operation horas_display item_hunt_timer = minutos item_hunt_timer
scoreboard players operation horas_display item_hunt_timer /= const_60 item_hunt_timer


# Mover valores actuales a "prev"
data modify storage item_hunt:clock time.prev_hora set from storage item_hunt:clock time.curr_hora
data modify storage item_hunt:clock time.prev_minuto set from storage item_hunt:clock time.curr_minuto

# Guardar nueva hora/minuto desde los scoreboards en "curr"
execute store result storage item_hunt:clock time.curr_hora int 1 run scoreboard players get horas_display item_hunt_timer
execute store result storage item_hunt:clock time.curr_minuto int 1 run scoreboard players get minutos_display item_hunt_timer

# Actualizar la entrada del reloj en el scoreboard item_hunt_board
function item_hunt:update_time_display with storage item_hunt:clock time