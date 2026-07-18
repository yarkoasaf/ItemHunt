#scan for item in player's inventory
$execute store success score @s $(scoreboard) run clear @s minecraft:$(id) 0
$execute unless score $(id) item_hunt_board matches $(display) run scoreboard players display name $(id) item_hunt_board [{"text":"$(name)","color":"white"}]
$execute unless score $(id) item_hunt_board matches $(display) run scoreboard players set $(id) item_hunt_board $(display)