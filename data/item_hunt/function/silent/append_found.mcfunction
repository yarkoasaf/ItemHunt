# Macro: appends an already-found item to the line being built.
# Context = storage item_hunt:hud ctx -> $(line) so far, $(name) of the item.
# Section codes instead of JSON components: a macro can only paste text, not
# formatting, and the client renders them the same way it does for the
# sidebar's fake-player names.
$data modify storage item_hunt:hud ctx.line set value "$(line)§a✔ $(name)§7 | "
