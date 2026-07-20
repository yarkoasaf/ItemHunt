# Macro. Called by the dimension buttons: set_dimension {dim:1|2|3}.
#   1 = Overworld    (only Overworld items)
#   2 = Nether       (Overworld + Nether items)
#   3 = End          (Overworld + Nether + End items)
# Applies on the next daily reset (same as "Items por dia"). Use
# [Guardar y reiniciar ahora] to apply immediately. Redraws the menu.
$scoreboard players set dimension item_hunt_config $(dim)
function item_hunt:config/refresh
execute if entity @s run function item_hunt:config/open
