# Runs every tick (via #tick tag).
# Drives the repeatable item_hunt:score_plus50 advancement. All the bookkeeping
# is in plus50_check, run once per player.
execute as @a run function item_hunt:plus50_check
