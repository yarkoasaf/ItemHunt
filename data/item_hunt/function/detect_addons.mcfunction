# Runs 1 tick after load. By now any installed addon has set its score in
# ITEM_HUNT_ADDONS. We confirm it into a persistent flag (ender_eye_ok), announce it,
# then clear the handshake score so a removed addon is correctly seen as absent
# next reload.

# Ender Eyes addon
execute if score ender_eye ITEM_HUNT_ADDONS matches 1 run tellraw @a [{"text":"[Item Hunt addon Ender Eyes detected]","color":"light_purple"}]
scoreboard players set ender_eye_ok ITEM_HUNT_ADDONS 0
execute if score ender_eye ITEM_HUNT_ADDONS matches 1 run scoreboard players set ender_eye_ok ITEM_HUNT_ADDONS 1
scoreboard players set ender_eye ITEM_HUNT_ADDONS 0
# Refresh the sidebar so the addon indicator appears/disappears
function item_hunt:board_flags