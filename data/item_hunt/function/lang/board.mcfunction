# Paints every piece of text on the sidebar, in the active language.
#
# WHY THIS IS NOT STORAGE-DRIVEN LIKE THE REST
# A scoreboard display name is stored as a component and rendered by the
# CLIENT. An {"nbt":"key","storage":"item_hunt:lang"} reference needs the
# server to resolve it against storage, and that pass only happens for
# commands that send finished text -- tellraw, title, and so on. In a display
# name it never resolves and the line renders EMPTY.
# So the sidebar keeps literal components, split per language into
# lang/board_es and lang/board_en. Same rule applies to team prefixes and
# suffixes, and to item custom_name / lore.
#
# Called from display, which removes and re-adds item_hunt_board and so has to
# re-apply the names, and from config/refresh so the language button repaints
# the board without waiting for the next daily reset.
execute if score lang item_hunt_config matches 1 run function item_hunt:lang/board_en
execute unless score lang item_hunt_config matches 1 run function item_hunt:lang/board_es
