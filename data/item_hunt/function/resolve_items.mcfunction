# Runs ONCE per day (from init and daily_reset), right after item_hunt:random.
# Turns the rolled numbers (scores on fake player "item") into cached slot
# objects in storage item_hunt:data: slot1..slot7 = {id,name,scoreboard,display}.
# All 7 are always resolved; how many are actually used is controlled by
# "active" in item_hunt_config (see item_tick / score_handler).

# --- Slot 1 (sidebar priority 96) ---
data merge storage item_hunt:res {slot:"slot1",scoreboard:"item_hunt_item1",display:96}
execute store result storage item_hunt:res idx int 1 run scoreboard players get item item_hunt_item1
function item_hunt:resolve_one with storage item_hunt:res

# --- Slot 2 (sidebar priority 95) ---
data merge storage item_hunt:res {slot:"slot2",scoreboard:"item_hunt_item2",display:95}
execute store result storage item_hunt:res idx int 1 run scoreboard players get item item_hunt_item2
function item_hunt:resolve_one with storage item_hunt:res

# --- Slot 3 (sidebar priority 94) ---
data merge storage item_hunt:res {slot:"slot3",scoreboard:"item_hunt_item3",display:94}
execute store result storage item_hunt:res idx int 1 run scoreboard players get item item_hunt_item3
function item_hunt:resolve_one with storage item_hunt:res

# --- Slot 4 (sidebar priority 93) ---
data merge storage item_hunt:res {slot:"slot4",scoreboard:"item_hunt_item4",display:93}
execute store result storage item_hunt:res idx int 1 run scoreboard players get item item_hunt_item4
function item_hunt:resolve_one with storage item_hunt:res

# --- Slot 5 (sidebar priority 92) ---
data merge storage item_hunt:res {slot:"slot5",scoreboard:"item_hunt_item5",display:92}
execute store result storage item_hunt:res idx int 1 run scoreboard players get item item_hunt_item5
function item_hunt:resolve_one with storage item_hunt:res

# --- Slot 6 (sidebar priority 91) ---
data merge storage item_hunt:res {slot:"slot6",scoreboard:"item_hunt_item6",display:91}
execute store result storage item_hunt:res idx int 1 run scoreboard players get item item_hunt_item6
function item_hunt:resolve_one with storage item_hunt:res

# --- Slot 7 (sidebar priority 90) ---
data merge storage item_hunt:res {slot:"slot7",scoreboard:"item_hunt_item7",display:90}
execute store result storage item_hunt:res idx int 1 run scoreboard players get item item_hunt_item7
function item_hunt:resolve_one with storage item_hunt:res
