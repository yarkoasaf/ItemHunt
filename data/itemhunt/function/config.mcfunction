# Short public entry point for the config menu:  /function itemhunt:config
#
# This namespace deliberately holds NOTHING else: typing "/function itemhunt"
# suggests this single route, so the menu is always the first thing an operator
# sees. Everything the pack actually runs lives under item_hunt: -- keep it that
# way, or this stops being a one-entry list.
#
# Not named ".config": a leading dot HIDES a function from /function
# autocomplete -- that is what premios/.premioN rely on -- which is the
# opposite of what this route is for.
function item_hunt:config/open
