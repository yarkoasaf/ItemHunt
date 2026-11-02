# Runs 1 tick after load. By now any installed addon has set its score in
# ITEM_HUNT_ADDONS. We confirm it into a persistent flag (ender_eye_ok), announce it,
# then clear the handshake score so a removed addon is correctly seen as absent
# next reload.

# Portals addon
execute if score portals ITEM_HUNT_ADDONS matches 1 run tellraw @a {"nbt":"addon_portals","storage":"item_hunt:lang","interpret":true}
scoreboard players set portals_ok ITEM_HUNT_ADDONS 0
execute if score portals ITEM_HUNT_ADDONS matches 1 run scoreboard players set portals_ok ITEM_HUNT_ADDONS 1
scoreboard players set portals ITEM_HUNT_ADDONS 0

# Refresh the sidebar so the addon indicator appears/disappears
function item_hunt:board_flags