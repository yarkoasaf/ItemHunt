# Daily countdown. On reaching 0 it fires daily_reset and refills to the
# configured interval (ticks in item_hunt_config; default 1,728,000 = 24h).
scoreboard players remove daily_reset item_hunt_timer 1
execute if score daily_reset item_hunt_timer matches 0 run function item_hunt:daily_reset
execute if score daily_reset item_hunt_timer matches ..0 run scoreboard players operation daily_reset item_hunt_timer = ticks item_hunt_config


#update display time left
scoreboard players operation minutos item_hunt_timer = daily_reset item_hunt_timer
scoreboard players operation minutos item_hunt_timer /= const_1200 item_hunt_timer

# 2) Solo si el minuto cambió, actualizamos el display
execute unless score minutos item_hunt_timer = minutos_prev item_hunt_timer run function item_hunt:on_minute_changed
