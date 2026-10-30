# Silent display mode (config "hud" = 0). The sidebar stays hidden; a player
# crouches to call up today's list and the countdown on their actionbar.
#
# The bar is not permanent. Crouching opens a window long enough for the page
# rotation to make "hudloops" complete passes (#dur, worked out by
# item_hunt:silent/measure), and when that runs out the bar goes away even if
# shift is still held. Letting go of shift closes it immediately, and crouching
# again opens a fresh window from page 1.
#
# item_hunt_hud, per player:
#    1.. = window open, ticks left; the bar is on screen
#    0   = disarmed, the next crouch opens a new window
#   -1   = window used up while shift is still down; nothing on screen
#   none = same as 0 (a player who has never crouched in silent mode)
#
# Shared fake players in the same objective, all from silent/measure:
# #page / #pages / #spin (rotation cursor) and #dur (window length).

# Nothing to do in global (sidebar) mode.
execute unless score hud item_hunt_config matches 0 run return 0

# Let go of shift: wipe the bar on the spot (vanilla would leave it fading for
# another second or two) and disarm, so the next crouch opens a new window.
title @a[predicate=!item_hunt:is_sneaking,scores={item_hunt_hud=1..}] actionbar {"text":""}
scoreboard players set @a[predicate=!item_hunt:is_sneaking,scores={item_hunt_hud=1..}] item_hunt_hud 0
scoreboard players set @a[predicate=!item_hunt:is_sneaking,scores={item_hunt_hud=..-1}] item_hunt_hud 0

# Nobody is mid-window, so the next player to crouch starts at page 1 instead of
# joining the rotation half way through. Read before anyone is armed below, and
# after the disarm above, so it sees who is really still looking.
execute unless entity @a[scores={item_hunt_hud=1..}] run scoreboard players set #page item_hunt_hud 1
execute unless entity @a[scores={item_hunt_hud=1..}] run scoreboard players set #spin item_hunt_hud 0

# Start crouching: open the window. The two "unless" cover both disarmed states
# at once -- score 0 and no score at all -- while skipping players who are
# already looking (1..) or have used their window up (-1).
execute as @a[predicate=item_hunt:is_sneaking] unless score @s item_hunt_hud matches 1.. unless score @s item_hunt_hud matches ..-1 run scoreboard players operation @s item_hunt_hud = #dur item_hunt_hud

# Rotation cursor: one page every "hudspin" ticks, and only when there is more
# than one page to rotate through. The counter restarts at 1 rather than 0
# because the tick that flips the page is already the new page's first tick --
# resetting to 0 gave the first page one tick less than all the others, which
# made the loop drift and flash page 1 again at the end of the window.
scoreboard players add #spin item_hunt_hud 1
execute if score #pages item_hunt_hud matches 2.. if score #spin item_hunt_hud > hudspin item_hunt_config run scoreboard players add #page item_hunt_hud 1
execute if score #spin item_hunt_hud > hudspin item_hunt_config run scoreboard players set #spin item_hunt_hud 1
execute if score #page item_hunt_hud > #pages item_hunt_hud run scoreboard players set #page item_hunt_hud 1

# The clock is the same for everyone, so it is copied into the render context
# once per tick instead of once per player. Padding comes already resolved as a
# string from on_minute_changed, same as the sidebar clock.
data modify storage item_hunt:hud ctx.hpad set from storage item_hunt:clock time.hpad
data modify storage item_hunt:hud ctx.hora set from storage item_hunt:clock time.curr_hora
data modify storage item_hunt:hud ctx.pad set from storage item_hunt:clock time.pad
data modify storage item_hunt:hud ctx.minuto set from storage item_hunt:clock time.curr_minuto

# Draw for everyone with an open window. Re-sending every tick is what keeps the
# bar solid instead of fading, and it also makes an item turn green the moment
# it is picked up.
execute as @a[scores={item_hunt_hud=1..}] run function item_hunt:silent/render

scoreboard players remove @a[scores={item_hunt_hud=1..}] item_hunt_hud 1

# Window used up with shift still down: wipe the bar once and sit at -1, so it
# stays gone until the player lets go and crouches again. Players who simply
# released shift were set to 0 above and are filtered out by the predicate.
title @a[predicate=item_hunt:is_sneaking,scores={item_hunt_hud=0}] actionbar {"text":""}
scoreboard players set @a[predicate=item_hunt:is_sneaking,scores={item_hunt_hud=0}] item_hunt_hud -1
