#tellraw @a [{"text":"[Item Hunt] ","color":"aqua"},{"text":"Buscando al mejor jugador...","color":"yellow"}]
# reset the max
scoreboard players set $max item_hunt_rankeds -2147483648

# clear old winners
tag @a remove top_player

# --- PASS 1: find the max score among players ---
execute as @a if score @s item_hunt_rankeds > $max item_hunt_rankeds run scoreboard players operation $max item_hunt_rankeds = @s item_hunt_rankeds

# --- PASS 2: tag whoever has that max ---
execute as @a if score @s item_hunt_rankeds = $max item_hunt_rankeds run tag @s add top_player
execute as @a[tag=top_player] unless score @s item_hunt_rankeds = $max item_hunt_rankeds run tag @s remove top_player

#execute as @a[tag=top_player] run team join item_hunt_top_winner @s