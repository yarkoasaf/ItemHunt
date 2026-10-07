# Runs every tick, right after score_handler, and handles the two things that
# must happen only once the whole "as @a" win loop has finished.
#
# 1) Same-tick tie. Two or more players can complete the list on the very same
#    tick; the order between them is just the order score_handler happened to
#    iterate, so it is announced as a tie instead of pretending someone was
#    faster.
# 2) Race mode reset. item_hunt_success only raises the #race_reset flag; the
#    round is actually reset here. Doing it inside the loop used to hand the new
#    round to the second player of a tie for free: daily_success had just been
#    cleared back to 0 while their item_hunt_found still held the old count, so
#    they matched the win condition again without touching an item.

# How many players finished on this tick (won_this_tick is cleared by score_handler).
execute store result score #won_now item_hunt_config if entity @a[tag=won_this_tick]

# Tie: 2 or more at once. Fires in every mode, not just race.
execute if score #won_now item_hunt_config matches 2.. run tellraw @a ["",{"text":"[Item Hunt] ","color":"aqua"},{"text":"¡Empate! ","color":"light_purple","bold":true},{"selector":"@a[tag=won_this_tick]","color":"gold"},{"text":" consiguieron los items en el mismo tick!","color":"light_purple"}]
execute if score #won_now item_hunt_config matches 2.. run playsound minecraft:block.note_block.chime master @a ~ ~ ~ 1 1.2

# Race mode: the deferred round reset, now that everyone has been scored.
execute if score #race_reset item_hunt_config matches 1 run scoreboard players operation daily_reset item_hunt_timer = ticks item_hunt_config
execute if score #race_reset item_hunt_config matches 1 run function item_hunt:daily_reset
scoreboard players set #race_reset item_hunt_config 0
