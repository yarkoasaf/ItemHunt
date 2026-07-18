# Daily countdown. On reaching 0 it fires daily_reset and refills to the
# configured interval (ticks in item_hunt_config; default 1,728,000 = 24h).
scoreboard players remove daily_reset item_hunt_timer 1
execute if score daily_reset item_hunt_timer matches 0 run function item_hunt:daily_reset
execute if score daily_reset item_hunt_timer matches ..0 run scoreboard players operation daily_reset item_hunt_timer = ticks item_hunt_config

# 1 day timer (1728000 ticks)
#execute if score @s item_hunt_timer matches 0 run function item_hunt:daily_reset
#scoreboard players add @s item_hunt_timer 1
#execute if score @s item_hunt_timer matches 24000.. run scoreboard players set @s item_hunt_timer 0


#update display time left
scoreboard players operation minutos item_hunt_timer = daily_reset item_hunt_timer
scoreboard players operation minutos item_hunt_timer /= const_1200 item_hunt_timer

# 2) Solo si el minuto cambió, actualizamos el display
execute unless score minutos item_hunt_timer = minutos_prev item_hunt_timer run function item_hunt:on_minute_changed

#execute if score minute_module item_hunt_timer matches 0 run function item_hunt:time_display {operation: "remove" ,hora:{"score":{"name":"minuto_display","objective":"item_hunt_timer"}},minuto: {"score":{"name":"minuto_display","objective":"item_hunt_timer"}}}
#execute if score minute_module item_hunt_timer matches 0 run function item_hunt:update_time_display
#execute if score minute_module item_hunt_timer matches 0 run function item_hunt:time_display {operation: "add" ,hora:{"score":{"name":"minuto_display","objective":"item_hunt_timer"}},minuto: {"score":{"name":"minuto_display","objective":"item_hunt_timer"}}}