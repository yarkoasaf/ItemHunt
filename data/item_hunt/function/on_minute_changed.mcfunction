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
data modify storage item_hunt:clock time.prev_hpad set from storage item_hunt:clock time.hpad
data modify storage item_hunt:clock time.prev_pad set from storage item_hunt:clock time.pad

# Guardar nueva hora/minuto desde los scoreboards en "curr"
execute store result storage item_hunt:clock time.curr_hora int 1 run scoreboard players get horas_display item_hunt_timer
execute store result storage item_hunt:clock time.curr_minuto int 1 run scoreboard players get minutos_display item_hunt_timer

# Zero-padding: a single digit gets a leading "0" so the sidebar reads 01:05,
# not 1:5. update_time_display pastes hpad/pad in front of the numbers.
data modify storage item_hunt:clock time.hpad set value ""
data modify storage item_hunt:clock time.pad set value ""
execute if score horas_display item_hunt_timer matches ..9 run data modify storage item_hunt:clock time.hpad set value "0"
execute if score minutos_display item_hunt_timer matches ..9 run data modify storage item_hunt:clock time.pad set value "0"

# Actualizar la entrada del reloj en el scoreboard item_hunt_board
function item_hunt:update_time_display with storage item_hunt:clock time