# Macro: appends an already-found item to the line being built.
# Context = storage item_hunt:hud ctx -> $(line) so far, $(tk) of the item.
#
# The line accumulates finished text components, each followed by a comma, so
# silent/show can paste the whole thing straight into a JSON list. $(tk) is the
# item name as a "translate" component (see setup_items), and an actionbar is
# rendered by the CLIENT just like the sidebar, so every player reads the list
# in whatever language their own Minecraft runs in.
#
# The green sits on the parent and $(tk) inherits it -- which is why tk carries
# no colour of its own.
$data modify storage item_hunt:hud ctx.line set value '$(line){"color":"green","text":"✔ ","extra":[$(tk)]},{"color":"gray","text":" | "},'
