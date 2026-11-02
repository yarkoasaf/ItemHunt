# Sidebar text in Spanish. LITERAL components on purpose -- see lang/board for
# why an {"nbt":...,"storage":...} reference cannot be used here.

scoreboard objectives modify item_hunt_board displayname {"text":"Item Hunt","color":"aqua","bold":true}

# Header lines. 99 = above the clock at 98, 97 = below it.
scoreboard players display name ih_line_timer item_hunt_board {"text":"Reinicio en:","color":"gray"}
scoreboard players display name ih_line_find item_hunt_board {"text":"Buscar items:","color":"gray"}

# Mode indicators. Whether each line is VISIBLE is board_flags' job -- it sets
# or resets the score. This only gives them their names.
scoreboard players display name item_hunt_race_line item_hunt_board {"text":"MODO CARRERA","color":"yellow","bold":true}
scoreboard players display name item_hunt_consume_line item_hunt_board {"text":"Items se consumen","color":"gold"}
scoreboard players display name item_hunt_portals_addon item_hunt_board {"text":"portals addon","color":"light_purple"}
