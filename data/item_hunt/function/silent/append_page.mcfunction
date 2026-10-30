# Macro: prepends the "(2/3)" page indicator to the line being built, so a
# rotating list says which part of it is on screen.
# Context = storage item_hunt:hud ctx -> $(line) so far, $(pg), $(pgs).
$data modify storage item_hunt:hud ctx.line set value "$(line)§8($(pg)/$(pgs)) "
