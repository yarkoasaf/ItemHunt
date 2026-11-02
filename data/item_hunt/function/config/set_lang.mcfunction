# Macro: pick the interface language. set_lang {val:0|1}  (0 = Español, 1 = English)
# Not folded into config/set_flag because it also has to clear the first-run
# prompt: once the admin has chosen, load must stop asking.
$scoreboard players set lang item_hunt_config $(val)
scoreboard players set langset item_hunt_config 1
function item_hunt:config/refresh
function item_hunt:config/open
