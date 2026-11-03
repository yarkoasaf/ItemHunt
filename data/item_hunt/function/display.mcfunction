# ===== SCOREBOARD SETUP =====

#reset
scoreboard objectives remove item_hunt_board
# Pre-lang-switch worlds stored the header labels as fake player names
# ("§7Reinicio_en:"); removing the objective above already drops them.

# Objective that we will display on the sidebar (dummy = manual control)
scoreboard objectives add item_hunt_board dummy {"text":"Item Hunt","color":"aqua","bold":true}

# Hide the priority numbers on the right of each line
scoreboard objectives modify item_hunt_board numberformat blank

# --- Header lines + objective title ---
# High scores so they always stay on top of the list. The text itself lives
# in item_hunt:lang/{es,en} and is wired up by lang/board, which has to run
# again here because the objective was just removed and re-added above.
function item_hunt:lang/board

# Making the two header lines APPEAR is this file's job: lang/board only gives
# them their text, and a sidebar entry with no score is not drawn at all.
# Layout, highest score first: 102 portals addon / 101 race / 100 consume
# (board_flags) - 99 "Resets in:" - 98 the HH:MM clock (update_time_display)
# - 97 "Find items:" - 96..90 the seven item lines (resolve_items).
scoreboard players set ih_line_timer item_hunt_board 99
scoreboard players set ih_line_find item_hunt_board 97


# Show the board on the sidebar -- only in global mode. Silent mode keeps it
# hidden and shows the same information on the actionbar instead, but the board
# itself is still kept up to date so switching back is instant.
execute if score hud item_hunt_config matches 1 run scoreboard objectives setdisplay sidebar item_hunt_board


#  Item Hunt
# ---------------
# Buscar items:
# Diamante
# Oro
# Hierro
# Tierra
# ---------------

# Set the active-mode indicator lines
function item_hunt:board_flags

# Lay out the silent display's actionbar for the new list: the names are known
# now and will not change until the next reset, so the paging is measured once
# here rather than every tick. Harmless in global mode.
function item_hunt:silent/measure