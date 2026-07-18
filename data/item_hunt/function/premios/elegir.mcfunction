# Limpiar / crear contexto
data modify storage item_hunt:premios ctx set value {}

# Guardar un número random entre 1 y 25 en storage
execute store result storage item_hunt:premios ctx.random_premio int 1 run random value 1..33

# Llamar a la función con macros
function item_hunt:premios/run with storage item_hunt:premios ctx
