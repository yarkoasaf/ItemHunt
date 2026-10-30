# Macro: appends a still-missing item to the line being built.
# Context = storage item_hunt:hud ctx -> $(line) so far, $(name) of the item.
$data modify storage item_hunt:hud ctx.line set value "$(line)§c✘ $(name)§7 | "
