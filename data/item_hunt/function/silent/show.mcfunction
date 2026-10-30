# Macro: paints the finished line on @s's actionbar, with the time left until
# the daily reset appended as "HH:MM".
# Context = storage item_hunt:hud ctx -> $(line), $(hpad), $(hora), $(pad), $(minuto).
# Re-sent every tick while the window is open, which keeps the bar solid instead
# of letting it fade after the vanilla title "stay" time.
$title @s actionbar [{"text":"$(line)","italic":false},{"text":"§e§l$(hpad)$(hora):$(pad)$(minuto)","italic":false}]
