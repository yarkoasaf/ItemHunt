# Win condition: a player wins when they hold ALL of today's active items.
# We count how many of the active slots (1..active) the player has (each slot's
# per-player score is 1 when held, set by scan_item), then compare to active.

# Count found items among the active slots, for players still hunting.
execute as @a if score @s item_hunt_daily_success matches 0 run scoreboard players set @s item_hunt_found 0
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 1.. if score @s item_hunt_item1 matches 1 run scoreboard players add @s item_hunt_found 1
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 2.. if score @s item_hunt_item2 matches 1 run scoreboard players add @s item_hunt_found 1
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 3.. if score @s item_hunt_item3 matches 1 run scoreboard players add @s item_hunt_found 1
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 4.. if score @s item_hunt_item4 matches 1 run scoreboard players add @s item_hunt_found 1
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 5.. if score @s item_hunt_item5 matches 1 run scoreboard players add @s item_hunt_found 1
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 6.. if score @s item_hunt_item6 matches 1 run scoreboard players add @s item_hunt_found 1
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 7.. if score @s item_hunt_item7 matches 1 run scoreboard players add @s item_hunt_found 1

# Success when the player has found as many items as are active today.
execute as @a if score @s item_hunt_daily_success matches 0 if score @s item_hunt_found = active item_hunt_config run function item_hunt:item_hunt_success
