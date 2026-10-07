# Runs as a single player, from item_hunt:advancement_tick.
#
#   item_hunt_plus50      = awards still owed = max(0, rankeds/50 - 1) - paid
#   item_hunt_plus50_paid = awards already handed out
#
# First award is at score 100, not 50: at 50 this fired on the very same tick
# as item_hunt:score_50 ("Hunt them all!") and only one of the two toasts was
# usable. Hence the -1 on the tier. From 100 on it is every 50 as asked.
#
# Everything is DERIVED from item_hunt_rankeds instead of being counted up on
# completion, so "scoreboard players set <player> item_hunt_rankeds 50" fires
# the advancement exactly like hunting 50 items does. The advancement's own tick
# trigger grants it while plus50 >= 1; we bank that grant here (paid +1) and
# revoke it, which drops plus50 back to 0 and re-arms it for the next 50.

# Debug log, before the grant is cleared. Toggle: item_hunt:config/debug_adv
execute if score debug item_hunt_config matches 1 if entity @s[advancements={item_hunt:score_plus50=true}] run tellraw @s ["",{"text":"[IH debug] ","color":"dark_gray"},{"text":"+50 items otorgado. score=","color":"gray"},{"score":{"name":"@s","objective":"item_hunt_rankeds"},"color":"yellow"},{"text":" premios pagados=","color":"gray"},{"score":{"name":"@s","objective":"item_hunt_plus50_paid"},"color":"yellow"}]

# Bank a grant from an earlier tick BEFORE recomputing, so the fresh plus50 is
# already stored when vanilla re-checks the trigger later in this same tick.
# Recomputing first left plus50 >= 1 after the revoke, and the advancement was
# immediately granted a second time (double XP for the same 50 items).
execute if entity @s[advancements={item_hunt:score_plus50=true}] run scoreboard players add @s item_hunt_plus50_paid 1
advancement revoke @s[advancements={item_hunt:score_plus50=true}] only item_hunt:score_plus50

# Someone who never had the objective (joined mid-game) owes nothing yet.
execute unless score @s item_hunt_plus50_paid matches -2147483648.. run scoreboard players set @s item_hunt_plus50_paid 0

# tier = awards the score has earned: 0 below 100, then one per 50.
scoreboard players operation @s item_hunt_plus50 = @s item_hunt_rankeds
scoreboard players operation @s item_hunt_plus50 /= $div50 item_hunt_plus50
scoreboard players remove @s item_hunt_plus50 1
# max(0, tier): without this a score under 50 left tier at -1 and the clamp
# below pushed item_hunt_plus50_paid negative, handing out a free award later.
scoreboard players operation @s item_hunt_plus50 > $zero item_hunt_plus50

# pending = tier - paid
scoreboard players operation @s item_hunt_plus50 -= @s item_hunt_plus50_paid

# Score went DOWN (admin edit, debugging, a wipe): drop the awards the score no
# longer backs. Without this the player would owe them back and the advancement
# would stay dead until they re-earned everything they lost.
execute if score @s item_hunt_plus50 matches ..-1 run scoreboard players operation @s item_hunt_plus50_paid += @s item_hunt_plus50
execute if score @s item_hunt_plus50 matches ..-1 run scoreboard players set @s item_hunt_plus50 0
