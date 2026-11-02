#scan for item in player's inventory
$execute store success score @s $(scoreboard) run clear @s minecraft:$(id) 0
# The sidebar line. $(tk) is a finished text component built by setup_items --
# normally {"translate":"block.minecraft.<id>"} -- and the macro pastes it into
# the command as-is, wrapped in a parent that supplies the colour. $(tk) carries
# none of its own so the same component can be reused on a coloured line (see
# silent/append_found). A display name is rendered by the CLIENT, and "translate"
# is resolved client-side, so every player reads the item in whatever language
# their own Minecraft runs in, with no resource pack involved.
# That is also why it cannot be an {"nbt":...,"storage":...} reference: those
# need a server-side resolve pass that display names never get. See lang/board.
$execute unless score $(id) item_hunt_board matches $(display) run scoreboard players display name $(id) item_hunt_board {"color":"white","text":"","extra":[$(tk)]}
$execute unless score $(id) item_hunt_board matches $(display) run scoreboard players set $(id) item_hunt_board $(display)
