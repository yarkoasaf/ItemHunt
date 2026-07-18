# ===== SCOREBOARD SETUP =====

#reset
scoreboard objectives remove item_hunt_board

# Objective that we will display on the sidebar (dummy = manual control)
scoreboard objectives add item_hunt_board dummy {"text":"Item Hunt","color":"aqua","bold":true}

# Hide the priority numbers on the right of each line
scoreboard objectives modify item_hunt_board numberformat blank

# --- Decorative lines (fake players) ---
# High scores so they always stay on top of the list

# [ Item Hunt ]
scoreboard players set §7Reinicio_en: item_hunt_board 99
# 00:00
scoreboard players set §7Buscar_items: item_hunt_board 97
# Diamante
# Oro
# Hierro
# Tierra


# Show the board on the sidebar
scoreboard objectives setdisplay sidebar item_hunt_board


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