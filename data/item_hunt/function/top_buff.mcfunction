# Ranking buff: buffs the TOP N ranked players, where N = the 'topbuff' config (0-5).
#   0 = nobody, 1 = top1, 2 = top1+top2, ... 5 = top1..top5.
# Players are ranked by item_hunt_rankeds. A tie at a position is broken arbitrarily
# (exactly one player per position). Runs every tick; the effect is reapplied with hidden
# particles and decays on its own within a few seconds when turned off or when rank is lost.
#
# To change the buff itself, edit the 'effect give' line at the bottom
# (effect id / seconds / amplifier). Currently: Strength I.

# Rebuild the target set from scratch each run.
tag @a remove buff_target

# --- position 1 ---
execute if score topbuff item_hunt_config matches 1.. run scoreboard players set #buffmax item_hunt_config -2147483648
execute if score topbuff item_hunt_config matches 1.. as @a[tag=!buff_target] if score @s item_hunt_rankeds > #buffmax item_hunt_config run scoreboard players operation #buffmax item_hunt_config = @s item_hunt_rankeds
execute if score topbuff item_hunt_config matches 1.. as @a[tag=!buff_target] if score @s item_hunt_rankeds = #buffmax item_hunt_config run tag @s add _atmax
execute if score topbuff item_hunt_config matches 1.. run tag @a[tag=_atmax,limit=1] add buff_target
tag @a remove _atmax

# --- position 2 ---
execute if score topbuff item_hunt_config matches 2.. run scoreboard players set #buffmax item_hunt_config -2147483648
execute if score topbuff item_hunt_config matches 2.. as @a[tag=!buff_target] if score @s item_hunt_rankeds > #buffmax item_hunt_config run scoreboard players operation #buffmax item_hunt_config = @s item_hunt_rankeds
execute if score topbuff item_hunt_config matches 2.. as @a[tag=!buff_target] if score @s item_hunt_rankeds = #buffmax item_hunt_config run tag @s add _atmax
execute if score topbuff item_hunt_config matches 2.. run tag @a[tag=_atmax,limit=1] add buff_target
tag @a remove _atmax

# --- position 3 ---
execute if score topbuff item_hunt_config matches 3.. run scoreboard players set #buffmax item_hunt_config -2147483648
execute if score topbuff item_hunt_config matches 3.. as @a[tag=!buff_target] if score @s item_hunt_rankeds > #buffmax item_hunt_config run scoreboard players operation #buffmax item_hunt_config = @s item_hunt_rankeds
execute if score topbuff item_hunt_config matches 3.. as @a[tag=!buff_target] if score @s item_hunt_rankeds = #buffmax item_hunt_config run tag @s add _atmax
execute if score topbuff item_hunt_config matches 3.. run tag @a[tag=_atmax,limit=1] add buff_target
tag @a remove _atmax

# --- position 4 ---
execute if score topbuff item_hunt_config matches 4.. run scoreboard players set #buffmax item_hunt_config -2147483648
execute if score topbuff item_hunt_config matches 4.. as @a[tag=!buff_target] if score @s item_hunt_rankeds > #buffmax item_hunt_config run scoreboard players operation #buffmax item_hunt_config = @s item_hunt_rankeds
execute if score topbuff item_hunt_config matches 4.. as @a[tag=!buff_target] if score @s item_hunt_rankeds = #buffmax item_hunt_config run tag @s add _atmax
execute if score topbuff item_hunt_config matches 4.. run tag @a[tag=_atmax,limit=1] add buff_target
tag @a remove _atmax

# --- position 5 ---
execute if score topbuff item_hunt_config matches 5.. run scoreboard players set #buffmax item_hunt_config -2147483648
execute if score topbuff item_hunt_config matches 5.. as @a[tag=!buff_target] if score @s item_hunt_rankeds > #buffmax item_hunt_config run scoreboard players operation #buffmax item_hunt_config = @s item_hunt_rankeds
execute if score topbuff item_hunt_config matches 5.. as @a[tag=!buff_target] if score @s item_hunt_rankeds = #buffmax item_hunt_config run tag @s add _atmax
execute if score topbuff item_hunt_config matches 5.. run tag @a[tag=_atmax,limit=1] add buff_target
tag @a remove _atmax

# Apply the buff to the selected top-N players (targets nobody when topbuff is 0).
effect give @a[tag=buff_target] minecraft:haste 4 0 false
effect give @a[tag=buff_target] minecraft:regeneration 4 0 false