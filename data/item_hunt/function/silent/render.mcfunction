# Builds the actionbar line for @s and paints it. Runs as a single player, so
# the shared scratch context in storage item_hunt:hud is safe: it is filled and
# consumed before the next player is processed.
#
# A slot is appended only when it is (a) in play today ("active" in
# item_hunt_config) and (b) on the page the rotation is currently showing
# (#pgN == #page, both in item_hunt_hud). With a list that fits there is a
# single page and nothing ever rotates -- see item_hunt:silent/measure.
#
# Names come from the same slot cache the sidebar reads (storage item_hunt:data)
# and the per-player item scores are the ones scan_item already writes every
# tick, so nothing extra is scanned here. What is appended is slotN.tk, the
# name as a "translate" component, so the bar is in each player's own game
# language; slotN.name stays the plain English string and is only used by
# silent/measure to estimate how wide a page will be.

data modify storage item_hunt:hud ctx.line set value ""

# "(2/3)" indicator, only when the list needs more than one page.
execute store result storage item_hunt:hud ctx.pg int 1 run scoreboard players get #page item_hunt_hud
execute store result storage item_hunt:hud ctx.pgs int 1 run scoreboard players get #pages item_hunt_hud
execute if score #pages item_hunt_hud matches 2.. run function item_hunt:silent/append_page with storage item_hunt:hud ctx

execute if score active item_hunt_config matches 1.. if score #pg1 item_hunt_hud = #page item_hunt_hud run data modify storage item_hunt:hud ctx.tk set from storage item_hunt:data slot1.tk
execute if score active item_hunt_config matches 1.. if score #pg1 item_hunt_hud = #page item_hunt_hud if score @s item_hunt_item1 matches 1 run function item_hunt:silent/append_found with storage item_hunt:hud ctx
execute if score active item_hunt_config matches 1.. if score #pg1 item_hunt_hud = #page item_hunt_hud unless score @s item_hunt_item1 matches 1 run function item_hunt:silent/append_missing with storage item_hunt:hud ctx

execute if score active item_hunt_config matches 2.. if score #pg2 item_hunt_hud = #page item_hunt_hud run data modify storage item_hunt:hud ctx.tk set from storage item_hunt:data slot2.tk
execute if score active item_hunt_config matches 2.. if score #pg2 item_hunt_hud = #page item_hunt_hud if score @s item_hunt_item2 matches 1 run function item_hunt:silent/append_found with storage item_hunt:hud ctx
execute if score active item_hunt_config matches 2.. if score #pg2 item_hunt_hud = #page item_hunt_hud unless score @s item_hunt_item2 matches 1 run function item_hunt:silent/append_missing with storage item_hunt:hud ctx

execute if score active item_hunt_config matches 3.. if score #pg3 item_hunt_hud = #page item_hunt_hud run data modify storage item_hunt:hud ctx.tk set from storage item_hunt:data slot3.tk
execute if score active item_hunt_config matches 3.. if score #pg3 item_hunt_hud = #page item_hunt_hud if score @s item_hunt_item3 matches 1 run function item_hunt:silent/append_found with storage item_hunt:hud ctx
execute if score active item_hunt_config matches 3.. if score #pg3 item_hunt_hud = #page item_hunt_hud unless score @s item_hunt_item3 matches 1 run function item_hunt:silent/append_missing with storage item_hunt:hud ctx

execute if score active item_hunt_config matches 4.. if score #pg4 item_hunt_hud = #page item_hunt_hud run data modify storage item_hunt:hud ctx.tk set from storage item_hunt:data slot4.tk
execute if score active item_hunt_config matches 4.. if score #pg4 item_hunt_hud = #page item_hunt_hud if score @s item_hunt_item4 matches 1 run function item_hunt:silent/append_found with storage item_hunt:hud ctx
execute if score active item_hunt_config matches 4.. if score #pg4 item_hunt_hud = #page item_hunt_hud unless score @s item_hunt_item4 matches 1 run function item_hunt:silent/append_missing with storage item_hunt:hud ctx

execute if score active item_hunt_config matches 5.. if score #pg5 item_hunt_hud = #page item_hunt_hud run data modify storage item_hunt:hud ctx.tk set from storage item_hunt:data slot5.tk
execute if score active item_hunt_config matches 5.. if score #pg5 item_hunt_hud = #page item_hunt_hud if score @s item_hunt_item5 matches 1 run function item_hunt:silent/append_found with storage item_hunt:hud ctx
execute if score active item_hunt_config matches 5.. if score #pg5 item_hunt_hud = #page item_hunt_hud unless score @s item_hunt_item5 matches 1 run function item_hunt:silent/append_missing with storage item_hunt:hud ctx

execute if score active item_hunt_config matches 6.. if score #pg6 item_hunt_hud = #page item_hunt_hud run data modify storage item_hunt:hud ctx.tk set from storage item_hunt:data slot6.tk
execute if score active item_hunt_config matches 6.. if score #pg6 item_hunt_hud = #page item_hunt_hud if score @s item_hunt_item6 matches 1 run function item_hunt:silent/append_found with storage item_hunt:hud ctx
execute if score active item_hunt_config matches 6.. if score #pg6 item_hunt_hud = #page item_hunt_hud unless score @s item_hunt_item6 matches 1 run function item_hunt:silent/append_missing with storage item_hunt:hud ctx

execute if score active item_hunt_config matches 7.. if score #pg7 item_hunt_hud = #page item_hunt_hud run data modify storage item_hunt:hud ctx.tk set from storage item_hunt:data slot7.tk
execute if score active item_hunt_config matches 7.. if score #pg7 item_hunt_hud = #page item_hunt_hud if score @s item_hunt_item7 matches 1 run function item_hunt:silent/append_found with storage item_hunt:hud ctx
execute if score active item_hunt_config matches 7.. if score #pg7 item_hunt_hud = #page item_hunt_hud unless score @s item_hunt_item7 matches 1 run function item_hunt:silent/append_missing with storage item_hunt:hud ctx

function item_hunt:silent/show with storage item_hunt:hud ctx
