# Macro. Mueve la entrada "HH:MM" del sidebar: borra la anterior y escribe la
# nueva. El nombre del fake player ES el texto que se ve, asi que el padding
# viene ya resuelto como string desde on_minute_changed.
# Contexto de macros (storage item_hunt:clock time):
#   $(prev_hpad), $(prev_hora), $(prev_pad), $(prev_minuto)
#   $(hpad), $(curr_hora), $(pad), $(curr_minuto)

# Borrar SOLO la entrada anterior "HH:MM" (si existía)
$scoreboard players reset $(prev_hpad)$(prev_hora):$(prev_pad)$(prev_minuto) item_hunt_board

# Crear la nueva entrada "HH:MM" con valor constante 10
$scoreboard players set $(hpad)$(curr_hora):$(pad)$(curr_minuto) item_hunt_board 98