# Loads the active language into storage item_hunt:lang. Everything that shows
# text reads from there, so this is the single switch for the whole datapack.
#   lang (item_hunt_config): 0 = Español (default), 1 = English
#
# Called from init (so a datapack update picks up corrected strings) and from
# config/refresh (so the menu button repaints immediately). Storage persists in
# the world save, so this is ~39 data modify commands once per load -- never
# per tick.
execute if score lang item_hunt_config matches 1 run function item_hunt:lang/en
execute unless score lang item_hunt_config matches 1 run function item_hunt:lang/es
