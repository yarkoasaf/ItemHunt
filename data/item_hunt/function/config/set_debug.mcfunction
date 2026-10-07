# Macro: toggle the "+50 items" debug log. set_debug {val:0|1}
# Its own function instead of config/set_flag because that one redraws the main
# config menu, and this button lives in the debug panel.
$scoreboard players set debug item_hunt_config $(val)
function item_hunt:config/debug_adv
