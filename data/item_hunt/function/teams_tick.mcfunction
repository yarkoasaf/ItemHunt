# Keeps the cosmetic teams in sync, every tick. Runs LAST in the tick tag, after
# top_buff, so the buff_target tag it reads is already current for this tick.
#
#   buff_target + finished today -> item_hunt_top_winner_daily    ✨name✨ ⭐
#   buff_target                  -> item_hunt_top_winner          ✨name✨
#   finished today               -> item_hunt_daily_winners       name ⭐
#   neither                      -> no team
#
# ✨ is tied to actually holding the buff (the buff_target tag set by top_buff),
# not to raw rank, so with "Buff a top players" at 0 nobody wears ✨. Raise it to
# 1 for just the leader, up to 5 for the top five.
#
# Assigning this every tick (instead of only when somebody wins) is what keeps
# the tags honest: losing the top spot, or a reload, takes the icon away by
# itself. The team=! / team= filters mean each player is only touched when their
# team actually has to change, so this is idle on a normal tick.

# "Colores de equipo" OFF -> config/refresh empties the teams and we stay out.
execute unless score teams item_hunt_config matches 1 run return 0

# --- promote into the right team ---
execute as @a[tag=buff_target,team=!item_hunt_top_winner_daily] if score @s item_hunt_daily_success matches 1.. run team join item_hunt_top_winner_daily @s
execute as @a[tag=buff_target,team=!item_hunt_top_winner] unless score @s item_hunt_daily_success matches 1.. run team join item_hunt_top_winner @s
execute as @a[tag=!buff_target,team=!item_hunt_daily_winners] if score @s item_hunt_daily_success matches 1.. run team join item_hunt_daily_winners @s

# --- drop players who no longer qualify for anything ---
# Only our own three teams are touched, so a player on some unrelated team of
# the server is never pulled out of it by this block.
execute as @a[tag=!buff_target,team=item_hunt_daily_winners] unless score @s item_hunt_daily_success matches 1.. run team leave @s
execute as @a[tag=!buff_target,team=item_hunt_top_winner] unless score @s item_hunt_daily_success matches 1.. run team leave @s
execute as @a[tag=!buff_target,team=item_hunt_top_winner_daily] unless score @s item_hunt_daily_success matches 1.. run team leave @s
