# Macro: paints the finished line on @s's actionbar, with the time left until
# the daily reset appended as "HH:MM".
# Context = storage item_hunt:hud ctx -> $(line), $(hpad), $(hora), $(pad), $(minuto).
# Re-sent every tick while the window is open, which keeps the bar solid instead
# of letting it fade after the vanilla title "stay" time.
#
# $(line) is already a comma-separated run of text components (each append left
# its own trailing comma), so it drops straight into the list. The empty leading
# element is the parent the rest inherit their italics from.
$title @s actionbar [{"text":"","italic":false},$(line){"text":"§e§l$(hpad)$(hora):$(pad)$(minuto)"}]
