# Runs every tick (via #tick tag).

# Fix: initialize any player who has no daily-success score yet (e.g. someone who
# joined mid-day). Only touches players with NO score, so it never overwrites a 0
# (still hunting) or a >=1 (already won today).
execute as @a unless score @s item_hunt_daily_success matches 0.. run scoreboard players set @s item_hunt_daily_success 0

# Scan only the slots that are in play today. "active" (item_hunt_config) is the number
# of items for the current day, snapshotted at reset from the configured "count".
# slot_k is scanned only when active >= k, so 1..7 items are supported.
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 1.. run function item_hunt:scan_item with storage item_hunt:data slot1
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 2.. run function item_hunt:scan_item with storage item_hunt:data slot2
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 3.. run function item_hunt:scan_item with storage item_hunt:data slot3
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 4.. run function item_hunt:scan_item with storage item_hunt:data slot4
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 5.. run function item_hunt:scan_item with storage item_hunt:data slot5
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 6.. run function item_hunt:scan_item with storage item_hunt:data slot6
execute as @a if score @s item_hunt_daily_success matches 0 if score active item_hunt_config matches 7.. run function item_hunt:scan_item with storage item_hunt:data slot7
