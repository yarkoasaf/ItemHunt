# Macro: appends a still-missing item to the line being built.
# Context = storage item_hunt:hud ctx -> $(line) so far, $(tk) of the item.
# Same shape as silent/append_found, red instead of green.
$data modify storage item_hunt:hud ctx.line set value '$(line){"color":"red","text":"✘ ","extra":[$(tk)]},{"color":"gray","text":" | "},'
