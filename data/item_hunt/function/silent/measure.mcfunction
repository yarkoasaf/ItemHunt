# Precomputes today's actionbar layout for the silent display: it measures each
# item name and packs the active slots into rotation pages that fit the width
# budget. Called from display (once per day, right after "active" has been
# snapshotted) and from config/refresh -- never per tick, because the names and
# the item count are fixed for the whole day.
#
# The trick that makes this possible without string functions: "data get" on a
# string path returns its LENGTH, so a name can be measured in characters.
#
# hudwidth (item_hunt_config) is the budget in characters for the item part of
# the line; the rest of the actionbar holds the clock and the "(2/3)" page
# indicator. Lower it if the line still overflows at your resolution / GUI
# scale, raise it to fit more items per page. Applied on the next reset, reload
# or config menu click.
#
# Scratch (item_hunt_hud): #len = name + decoration, #try = what the page would
# measure with the item added, #run = width already used by the page being
# filled, #page_n = page being filled.
# Results (item_hunt_hud): #pg1..#pg7 = page each slot belongs to, #pages = how
# many pages today's list needs. One page means nothing rotates.

# Slots not in play today keep page 0, which no cursor value ever matches.
scoreboard players set #pg1 item_hunt_hud 0
scoreboard players set #pg2 item_hunt_hud 0
scoreboard players set #pg3 item_hunt_hud 0
scoreboard players set #pg4 item_hunt_hud 0
scoreboard players set #pg5 item_hunt_hud 0
scoreboard players set #pg6 item_hunt_hud 0
scoreboard players set #pg7 item_hunt_hud 0

scoreboard players set #run item_hunt_hud 0
scoreboard players set #page_n item_hunt_hud 1

# --- slot 1 ---
execute if score active item_hunt_config matches 1.. store result score #len item_hunt_hud run data get storage item_hunt:data slot1.name
# the mark before the name and the separator after it
execute if score active item_hunt_config matches 1.. run scoreboard players add #len item_hunt_hud 5
execute if score active item_hunt_config matches 1.. run scoreboard players operation #try item_hunt_hud = #run item_hunt_hud
execute if score active item_hunt_config matches 1.. run scoreboard players operation #try item_hunt_hud += #len item_hunt_hud
# Over budget while the page already holds something -> open a new page. The
# "#run matches 1.." guard is what lets a single over-long name sit alone on
# its own page instead of opening an empty one before itself.
execute if score active item_hunt_config matches 1.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players add #page_n item_hunt_hud 1
execute if score active item_hunt_config matches 1.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players set #run item_hunt_hud 0
execute if score active item_hunt_config matches 1.. run scoreboard players operation #pg1 item_hunt_hud = #page_n item_hunt_hud
execute if score active item_hunt_config matches 1.. run scoreboard players operation #run item_hunt_hud += #len item_hunt_hud

# --- slot 2 ---
execute if score active item_hunt_config matches 2.. store result score #len item_hunt_hud run data get storage item_hunt:data slot2.name
execute if score active item_hunt_config matches 2.. run scoreboard players add #len item_hunt_hud 5
execute if score active item_hunt_config matches 2.. run scoreboard players operation #try item_hunt_hud = #run item_hunt_hud
execute if score active item_hunt_config matches 2.. run scoreboard players operation #try item_hunt_hud += #len item_hunt_hud
execute if score active item_hunt_config matches 2.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players add #page_n item_hunt_hud 1
execute if score active item_hunt_config matches 2.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players set #run item_hunt_hud 0
execute if score active item_hunt_config matches 2.. run scoreboard players operation #pg2 item_hunt_hud = #page_n item_hunt_hud
execute if score active item_hunt_config matches 2.. run scoreboard players operation #run item_hunt_hud += #len item_hunt_hud

# --- slot 3 ---
execute if score active item_hunt_config matches 3.. store result score #len item_hunt_hud run data get storage item_hunt:data slot3.name
execute if score active item_hunt_config matches 3.. run scoreboard players add #len item_hunt_hud 5
execute if score active item_hunt_config matches 3.. run scoreboard players operation #try item_hunt_hud = #run item_hunt_hud
execute if score active item_hunt_config matches 3.. run scoreboard players operation #try item_hunt_hud += #len item_hunt_hud
execute if score active item_hunt_config matches 3.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players add #page_n item_hunt_hud 1
execute if score active item_hunt_config matches 3.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players set #run item_hunt_hud 0
execute if score active item_hunt_config matches 3.. run scoreboard players operation #pg3 item_hunt_hud = #page_n item_hunt_hud
execute if score active item_hunt_config matches 3.. run scoreboard players operation #run item_hunt_hud += #len item_hunt_hud

# --- slot 4 ---
execute if score active item_hunt_config matches 4.. store result score #len item_hunt_hud run data get storage item_hunt:data slot4.name
execute if score active item_hunt_config matches 4.. run scoreboard players add #len item_hunt_hud 5
execute if score active item_hunt_config matches 4.. run scoreboard players operation #try item_hunt_hud = #run item_hunt_hud
execute if score active item_hunt_config matches 4.. run scoreboard players operation #try item_hunt_hud += #len item_hunt_hud
execute if score active item_hunt_config matches 4.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players add #page_n item_hunt_hud 1
execute if score active item_hunt_config matches 4.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players set #run item_hunt_hud 0
execute if score active item_hunt_config matches 4.. run scoreboard players operation #pg4 item_hunt_hud = #page_n item_hunt_hud
execute if score active item_hunt_config matches 4.. run scoreboard players operation #run item_hunt_hud += #len item_hunt_hud

# --- slot 5 ---
execute if score active item_hunt_config matches 5.. store result score #len item_hunt_hud run data get storage item_hunt:data slot5.name
execute if score active item_hunt_config matches 5.. run scoreboard players add #len item_hunt_hud 5
execute if score active item_hunt_config matches 5.. run scoreboard players operation #try item_hunt_hud = #run item_hunt_hud
execute if score active item_hunt_config matches 5.. run scoreboard players operation #try item_hunt_hud += #len item_hunt_hud
execute if score active item_hunt_config matches 5.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players add #page_n item_hunt_hud 1
execute if score active item_hunt_config matches 5.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players set #run item_hunt_hud 0
execute if score active item_hunt_config matches 5.. run scoreboard players operation #pg5 item_hunt_hud = #page_n item_hunt_hud
execute if score active item_hunt_config matches 5.. run scoreboard players operation #run item_hunt_hud += #len item_hunt_hud

# --- slot 6 ---
execute if score active item_hunt_config matches 6.. store result score #len item_hunt_hud run data get storage item_hunt:data slot6.name
execute if score active item_hunt_config matches 6.. run scoreboard players add #len item_hunt_hud 5
execute if score active item_hunt_config matches 6.. run scoreboard players operation #try item_hunt_hud = #run item_hunt_hud
execute if score active item_hunt_config matches 6.. run scoreboard players operation #try item_hunt_hud += #len item_hunt_hud
execute if score active item_hunt_config matches 6.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players add #page_n item_hunt_hud 1
execute if score active item_hunt_config matches 6.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players set #run item_hunt_hud 0
execute if score active item_hunt_config matches 6.. run scoreboard players operation #pg6 item_hunt_hud = #page_n item_hunt_hud
execute if score active item_hunt_config matches 6.. run scoreboard players operation #run item_hunt_hud += #len item_hunt_hud

# --- slot 7 ---
execute if score active item_hunt_config matches 7.. store result score #len item_hunt_hud run data get storage item_hunt:data slot7.name
execute if score active item_hunt_config matches 7.. run scoreboard players add #len item_hunt_hud 5
execute if score active item_hunt_config matches 7.. run scoreboard players operation #try item_hunt_hud = #run item_hunt_hud
execute if score active item_hunt_config matches 7.. run scoreboard players operation #try item_hunt_hud += #len item_hunt_hud
execute if score active item_hunt_config matches 7.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players add #page_n item_hunt_hud 1
execute if score active item_hunt_config matches 7.. if score #try item_hunt_hud > hudwidth item_hunt_config if score #run item_hunt_hud matches 1.. run scoreboard players set #run item_hunt_hud 0
execute if score active item_hunt_config matches 7.. run scoreboard players operation #pg7 item_hunt_hud = #page_n item_hunt_hud
execute if score active item_hunt_config matches 7.. run scoreboard players operation #run item_hunt_hud += #len item_hunt_hud

scoreboard players operation #pages item_hunt_hud = #page_n item_hunt_hud

# #dur = how long one crouch keeps the bar up: hudloops complete passes through
# the page loop. Worked out here because none of its inputs change during the
# day either.
scoreboard players operation #dur item_hunt_hud = #pages item_hunt_hud
scoreboard players operation #dur item_hunt_hud *= hudspin item_hunt_config
scoreboard players operation #dur item_hunt_hud *= hudloops item_hunt_config
# hudmin lets a short list stay up longer than its passes would allow.
execute if score #dur item_hunt_hud < hudmin item_hunt_config run scoreboard players operation #dur item_hunt_hud = hudmin item_hunt_config

# Start the rotation at the first page.
scoreboard players set #page item_hunt_hud 1
scoreboard players set #spin item_hunt_hud 0
