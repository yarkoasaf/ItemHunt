# Macro: appends the portals-addon spiral to the icon run after the clock.
# Context = storage item_hunt:hud ctx -> $(flags) so far.
# Magenta to match the "portals addon" sidebar line (lang/board_*).
$data modify storage item_hunt:hud ctx.flags set value '$(flags),{"text":" 🌀","color":"light_purple","bold":true}'
