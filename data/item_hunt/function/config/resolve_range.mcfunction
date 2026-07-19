# Builds the {min,max} range for item_hunt:random based on the dimension config.
# dimension: 1 = Overworld only, 2 = Overworld+Nether, 3 = Overworld+Nether+End.
# The item table (setup_items) is ordered Overworld -> Nether -> End, and stores
# the cumulative max index of each tier in ow_max / nether_max / end_max.
# Result is written to storage item_hunt:cfg args, then passed to random.

data modify storage item_hunt:cfg args set value {min:1,max:1058}
execute if score dimension item_hunt_config matches 1 store result storage item_hunt:cfg args.max int 1 run scoreboard players get ow_max item_hunt_config
execute if score dimension item_hunt_config matches 2 store result storage item_hunt:cfg args.max int 1 run scoreboard players get nether_max item_hunt_config
execute if score dimension item_hunt_config matches 3 store result storage item_hunt:cfg args.max int 1 run scoreboard players get end_max item_hunt_config
