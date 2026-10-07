# Macro. Rolls the 7 indices for the day into the fake player "item" of
# item_hunt_item1..7. resolve_items then turns them into real items.
# Args (storage item_hunt:cfg args): min, max -- set by config/resolve_range
# from the dimension option.

# --- Roll all 7 slots, unconditionally ---
# No "unless" guard here: the condition of an execute is evaluated BEFORE the
# command runs, so it can only ever see the PREVIOUS day's value, never the one
# about to be rolled. De-duplication has to happen after the fact, below.
$execute store result score item item_hunt_item1 run random value $(min)..$(max)
$execute store result score item item_hunt_item2 run random value $(min)..$(max)
$execute store result score item item_hunt_item3 run random value $(min)..$(max)
$execute store result score item item_hunt_item4 run random value $(min)..$(max)
$execute store result score item item_hunt_item5 run random value $(min)..$(max)
$execute store result score item item_hunt_item6 run random value $(min)..$(max)
$execute store result score item item_hunt_item7 run random value $(min)..$(max)

# --- De-duplication ---
# If any two slots landed on the same index, re-roll the whole set by calling
# this function again. The first line that detects a collision recurses, and
# that inner call returns with a fully clean set, so the remaining checks below
# find nothing and no further rolls happen.
# The pool is at least 1058 items (Overworld only), so 7 draws collide roughly
# 2% of the time -> in practice this is one extra pass at most, and it can
# never loop forever as long as max-min+1 >= 7.
execute if score item item_hunt_item2 = item item_hunt_item1 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item3 = item item_hunt_item1 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item3 = item item_hunt_item2 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item4 = item item_hunt_item1 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item4 = item item_hunt_item2 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item4 = item item_hunt_item3 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item5 = item item_hunt_item1 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item5 = item item_hunt_item2 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item5 = item item_hunt_item3 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item5 = item item_hunt_item4 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item6 = item item_hunt_item1 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item6 = item item_hunt_item2 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item6 = item item_hunt_item3 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item6 = item item_hunt_item4 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item6 = item item_hunt_item5 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item7 = item item_hunt_item1 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item7 = item item_hunt_item2 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item7 = item item_hunt_item3 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item7 = item item_hunt_item4 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item7 = item item_hunt_item5 run function item_hunt:random with storage item_hunt:cfg args
execute if score item item_hunt_item7 = item item_hunt_item6 run function item_hunt:random with storage item_hunt:cfg args

#(debug) desactivado - spameaba los valores random en el chat en cada reset
#tellraw @s [{"text":"Random value: "},{"score":{"name":"item","objective":"item_hunt_item1"}}]
