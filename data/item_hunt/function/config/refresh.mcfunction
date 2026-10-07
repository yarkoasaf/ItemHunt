execute if score tab item_hunt_config matches 1 run scoreboard objectives setdisplay list item_hunt_rankeds
execute unless score tab item_hunt_config matches 1 run scoreboard objectives setdisplay list
execute unless score teams item_hunt_config matches 1 run team empty item_hunt_daily_winners
execute unless score teams item_hunt_config matches 1 run team empty item_hunt_top_winner
execute unless score teams item_hunt_config matches 1 run team empty item_hunt_top_winner_daily

# Update the sidebar mode indicators
function item_hunt:board_flags