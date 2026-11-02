# The premio functions are macros now: their names and lore come from
# storage item_hunt:lang, so that storage is passed as their context.
# $(random_premio) still comes from this functions OWN context
# (storage item_hunt:premios ctx, set by premios/elegir).
$execute as @s run function item_hunt:premios/.premio$(random_premio) with storage item_hunt:lang