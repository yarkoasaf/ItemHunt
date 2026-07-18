# item_hunt:clock/sidebar
# Contexto de macros:
#   $(prev_hora), $(prev_minuto), $(curr_hora), $(curr_minuto)

# Borrar SOLO la entrada anterior "HH:MM" (si existía)
$scoreboard players reset $(prev_hora):$(prev_minuto) item_hunt_board

# Crear la nueva entrada "HH:MM" con valor constante 10
$scoreboard players set $(curr_hora):$(curr_minuto) item_hunt_board 98