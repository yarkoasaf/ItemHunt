# Runs every tick, but only fires detection once per (re)load, on the first tick
# after init set addon_check=1 (by then every addon's load has set its score).
execute if score addon_check item_hunt matches 1 run function item_hunt:detect_addons
scoreboard players set addon_check item_hunt 0