# Macro: paints the finished line on @s's actionbar, with the time left until
# the daily reset appended as "HH:MM" and the active-mode icons after that.
# Context = storage item_hunt:hud ctx -> $(line), $(hpad), $(hora), $(pad),
# $(minuto), $(flags).
# Re-sent every tick while the window is open, which keeps the bar solid instead
# of letting it fade after the vanilla title "stay" time.
#
# $(line) is already a comma-separated run of text components (each append left
# its own trailing comma), so it drops straight into the list. The empty leading
# element is the parent the rest inherit their italics from.
#
# $(flags) is the mirror image: the icons silent_tick collected, each carrying a
# LEADING comma, so the list stays valid JSON whether or not any icon is there.
# The clock is plain white because the icons wear the colours now -- a yellow
# bolt for race mode, a magenta spiral for the portals addon.
$title @s actionbar [{"text":"","italic":false},$(line){"text":"$(hpad)$(hora):$(pad)$(minuto)","color":"yellow","bold":true}$(flags)]
