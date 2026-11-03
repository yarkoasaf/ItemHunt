# Macro: appends the race-mode bolt to the icon run that sits after the clock.
# Context = storage item_hunt:hud ctx -> $(flags) so far.
# Same accumulate-with-a-leading-comma shape as silent/append_found, except
# this one feeds ctx.flags instead of ctx.line, and so lands to the RIGHT of
# the countdown. Its yellow is what the clock used to wear before the icons
# took the colour over -- see silent/show.
$data modify storage item_hunt:hud ctx.flags set value '$(flags),{"text":" ⚡","color":"yellow","bold":true}'
