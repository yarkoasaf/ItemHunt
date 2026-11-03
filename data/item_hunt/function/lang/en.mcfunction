# ===== ALL ENGLISH TEXT FOR ITEM HUNT =====
#
# This file and lang/es.mcfunction are the ONLY places that hold visible text.
# The rest of the datapack just references these keys with an nbt component:
#   {"nbt":"<key>","storage":"item_hunt:lang","interpret":true}
# "interpret" parses the string as a text component, so colors, bold and even
# {"selector":...} / {"score":...} live in here. That is what lets each
# language order its words freely -- see win/win_first below, which drop the
# leading "¡" the Spanish lines need.
#
# Rules when editing:
#   1. Both files must hold THE SAME KEYS, in the same order. To check:
#      grep -oE 'lang [a-z0-9_]+' lang/*.mcfunction | sort
#   2. The value is SINGLE-quoted and must be valid JSON. Broken JSON makes
#      "interpret" fail and spam the log.
#   3. A missing key does NOT error: it renders empty. Watch for typos.
#   4. Avoid apostrophes -- they would need escaping inside the single quotes.
#
# Deliberately NOT here, because it is identical in both languages:
#   [ON]/[OFF], [Global]/[Silent], [Overworld]/[Nether]/[End], [Español]/
#   [English], the tick preset hovers ("72000 ticks (1h)"), the HH:MM clock
#   and the 1218 item names (see setup_items).


# --- Load and notices ---
data modify storage item_hunt:lang loaded set value '{"text":"Item Hunt datapack loaded!","color":"gold","bold":true}'
data modify storage item_hunt:lang loaded_hint set value '["",{"text":"To config use ","color":"gold"},{"text":"/function itemhunt:config","color":"gold","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/function itemhunt:config"},"hoverEvent":{"action":"show_text","contents":"Click to open config"}}]'
data modify storage item_hunt:lang addon_portals set value '{"text":"[Item Hunt addon Portals detected]","color":"light_purple"}'
data modify storage item_hunt:lang reset_now set value '["",{"text":"[Item Hunt] ","color":"aqua"},{"text":"Rolling the daily items...","color":"yellow"}]'
data modify storage item_hunt:lang cfg_applied set value '["",{"text":"[Item Hunt] ","color":"aqua"},{"text":"Config applied and day reset.","color":"green"}]'

# --- Win messages. The {"selector":"@s"} resolves against the player running
#     the tellraw, exactly as it did when the text was inline. ---
data modify storage item_hunt:lang win_first set value '["",{"text":"[Item Hunt] ","color":"aqua"},{"selector":"@s","color":"gold"},{"text":" found all ","color":"gold"},{"score":{"name":"active","objective":"item_hunt_config"},"color":"yellow","bold":true},{"text":" items before anyone else!","color":"gold"},{"text":" (+","color":"green"},{"score":{"name":"reward","objective":"item_hunt_config"},"color":"green","bold":true},{"text":" points)","color":"green"}]'
data modify storage item_hunt:lang win set value '["",{"text":"[Item Hunt] ","color":"aqua"},{"selector":"@s","color":"gold"},{"text":" found all ","color":"gold"},{"score":{"name":"active","objective":"item_hunt_config"},"color":"yellow","bold":true},{"text":" items today!","color":"gold"},{"text":" (+","color":"green"},{"score":{"name":"reward","objective":"item_hunt_config"},"color":"green","bold":true},{"text":" points)","color":"green"}]'
data modify storage item_hunt:lang tie set value '["",{"text":"[Item Hunt] ","color":"aqua"},{"text":"Tie! ","color":"light_purple","bold":true},{"selector":"@a[tag=won_this_tick]","color":"gold"},{"text":" got the items on the same tick!","color":"light_purple"}]'

# --- Config menu (item_hunt:config/open) ---
data modify storage item_hunt:lang m_header set value '["",{"text":"== ","color":"aqua"},{"text":"Item Hunt Configuration","color":"aqua","bold":true},{"text":" ==","color":"aqua"}]'
data modify storage item_hunt:lang m_count set value '{"text":"Items per day: ","color":"white"}'
data modify storage item_hunt:lang m_count_dec_h set value '{"text":"Remove 1 (min 1)"}'
data modify storage item_hunt:lang m_count_inc_h set value '{"text":"Add 1 (max 7)"}'
data modify storage item_hunt:lang m_pool set value '{"text":"Item pool: ","color":"white"}'
data modify storage item_hunt:lang m_pool_ow_h set value '{"text":"Overworld items only"}'
data modify storage item_hunt:lang m_pool_ne_h set value '{"text":"Overworld + Nether"}'
data modify storage item_hunt:lang m_pool_end_h set value '{"text":"Overworld + Nether + End"}'
data modify storage item_hunt:lang m_topbuff set value '{"text":"Buff for top players: ","color":"white"}'
data modify storage item_hunt:lang m_topbuff_dec_h set value '{"text":"How many top players get the buff (min 0)"}'
data modify storage item_hunt:lang m_topbuff_inc_h set value '{"text":"How many top players get the buff (max 5)"}'
data modify storage item_hunt:lang m_ticks set value '{"text":"Ticks until reset: ","color":"white"}'
data modify storage item_hunt:lang m_teams set value '{"text":"Team colors: ","color":"white"}'
data modify storage item_hunt:lang m_tab set value '{"text":"Points in tab list: ","color":"white"}'
data modify storage item_hunt:lang m_hud set value '{"text":"Display mode: ","color":"white"}'
data modify storage item_hunt:lang m_hud_global_h set value '{"text":"List and clock always visible on the sidebar"}'
data modify storage item_hunt:lang m_hud_silent_h set value '{"text":"No sidebar: crouch to see the list on the actionbar for a few seconds"}'
data modify storage item_hunt:lang m_consume set value '{"text":"Consume items (-1 each): ","color":"white"}'
data modify storage item_hunt:lang m_race set value '{"text":"Race mode: ","color":"white"}'
data modify storage item_hunt:lang m_lang set value '{"text":"Language: ","color":"white"}'
data modify storage item_hunt:lang m_save set value '{"text":"[Save and reset now]","color":"gold","bold":true}'
data modify storage item_hunt:lang m_save_h set value '{"text":"Applies the config and resets the day now"}'
data modify storage item_hunt:lang m_refresh set value '{"text":"[Refresh]","color":"yellow"}'
data modify storage item_hunt:lang m_note set value '{"text":"Note: item/tick changes apply on the next reset.","color":"gray","italic":true}'

# --- Premios (item_hunt:premios/.premioN) ---
# Pasted into custom_name / lore by a macro at give time, so an item
# already in a chest keeps the language it was handed out in.
# p_daily is shared by all 50 counter lines.
data modify storage item_hunt:lang p_daily set value 'Daily prize.'
data modify storage item_hunt:lang p1_name set value 'Galactic Lil Bread'
data modify storage item_hunt:lang p1_l1 set value 'Flies high, falls slow'
data modify storage item_hunt:lang p2_name set value 'Fast Food'
data modify storage item_hunt:lang p2_l1 set value 'Eats fast'
data modify storage item_hunt:lang p2_l2 set value 'Off you go, fast'
data modify storage item_hunt:lang p3_name set value 'CHEEEESE'
data modify storage item_hunt:lang p3_l1 set value 'You will summon the rats...'
data modify storage item_hunt:lang p3_l2 set value '✔ Night Vision'
data modify storage item_hunt:lang p3_l3 set value '✔ Haste'
data modify storage item_hunt:lang p3_l4 set value '❌ Infested'
data modify storage item_hunt:lang p4_name set value 'Notch Rock Hard'
data modify storage item_hunt:lang p4_l1 set value 'Rock hard, brother'
data modify storage item_hunt:lang p5_name set value 'Today I Fly Into the Sun'
data modify storage item_hunt:lang p5_l1 set value 'Keep away from minors'
data modify storage item_hunt:lang p6_name set value 'Bombastic'
data modify storage item_hunt:lang p6_l1 set value 'Vanishes like a ninja'
data modify storage item_hunt:lang p7_name set value 'One Heck of a Pick'
data modify storage item_hunt:lang p7_l1 set value 'Tasty stuff 🥵'
data modify storage item_hunt:lang p9_name set value 'Dinosaur'
data modify storage item_hunt:lang p9_mob set value 'Dinosaur'
data modify storage item_hunt:lang p11_name set value 'Grandmas Cazuela'
data modify storage item_hunt:lang p11_l1 set value 'Ooohh no more food man'
data modify storage item_hunt:lang p12_name set value 'Flaming'
data modify storage item_hunt:lang p12_l1 set value '🔥🔥🔥  Now it is lit  🔥🔥🔥'
data modify storage item_hunt:lang p13_name set value 'Light Metal'
data modify storage item_hunt:lang p13_l1 set value 'Clavent'
data modify storage item_hunt:lang p14_name set value 'DOOF'
data modify storage item_hunt:lang p14_l1 set value 'Hunger'
data modify storage item_hunt:lang p14_l2 set value 'Toughness'
data modify storage item_hunt:lang p15_name set value 'Decoy'
data modify storage item_hunt:lang p15_l1 set value 'The best Battle Royale mechanic'
data modify storage item_hunt:lang p16_name set value 'Not a Decoy'
data modify storage item_hunt:lang p16_l1 set value 'This is not a decoy, use with care'
data modify storage item_hunt:lang p17_name set value 'Aletazin 8000'
data modify storage item_hunt:lang p17_l1 set value 'Pushes harder than beans'
data modify storage item_hunt:lang p18_l1 set value 'Pushes harder than Aletazin 8000'
data modify storage item_hunt:lang p18_name set value 'Aletatron 80000'
data modify storage item_hunt:lang p19_name set value 'Annoying Bat'
data modify storage item_hunt:lang p19_l1 set value 'Bats, what a marvel'
data modify storage item_hunt:lang p20_name set value 'Annoying Bat'
data modify storage item_hunt:lang p20_l1 set value 'Bats, what a marvel'
data modify storage item_hunt:lang p21_name set value 'Annoying Bat'
data modify storage item_hunt:lang p20_mob set value 'Pedro'
data modify storage item_hunt:lang p21_mob set value 'Why do they call it a cock when it is a cock?'
data modify storage item_hunt:lang p21_l1 set value 'Bats, what a marvel'
data modify storage item_hunt:lang p22_mob set value 'the sack man'
data modify storage item_hunt:lang p22_name set value 'The Sack Man'
data modify storage item_hunt:lang p22_l2 set value 'Kill it and it drops 10 sacks'
data modify storage item_hunt:lang p23_name set value 'Vital Kelp'
data modify storage item_hunt:lang p23_l1 set value 'A good source of life'
data modify storage item_hunt:lang p24_name set value 'Berserkookies'
data modify storage item_hunt:lang p24_l1 set value 'Made with strength flour'
data modify storage item_hunt:lang p25_name set value 'Long Pick'
data modify storage item_hunt:lang p25_l1 set value 'To reach far...'
data modify storage item_hunt:lang p26_name set value 'Magic Cookie'
data modify storage item_hunt:lang p26_l1 set value 'Survive the trip'
data modify storage item_hunt:lang p27_name set value 'Baxter Apple'
data modify storage item_hunt:lang p27_l1 set value 'Feel the horse'
data modify storage item_hunt:lang p27_l2 set value 'Be the horse'
data modify storage item_hunt:lang p28_name set value 'Long Haul Rocket'
data modify storage item_hunt:lang p28_l1 set value 'Ideal for long trips'
data modify storage item_hunt:lang p28_l2 set value 'Mind the landing'
data modify storage item_hunt:lang p29_name set value 'Hydrogen Rocket'
data modify storage item_hunt:lang p29_l1 set value 'Now I am become Death'
data modify storage item_hunt:lang p29_l2 set value 'The destroyer of worlds '
data modify storage item_hunt:lang p30_name set value 'Light Armor'
data modify storage item_hunt:lang p30_l1 set value 'Made from Light Metal'
data modify storage item_hunt:lang p31_name set value 'Albino Dwarf Helmet'
data modify storage item_hunt:lang p31_l1 set value 'Lucky bastards'
data modify storage item_hunt:lang p32_name set value 'Lava Chicken'
data modify storage item_hunt:lang p32_l1 set value 'La la la lava'
data modify storage item_hunt:lang p32_l2 set value 'Chi chi chi chicken'
data modify storage item_hunt:lang p32_l3 set value 'Fire Resistance'
data modify storage item_hunt:lang p33_name set value 'The Box'
data modify storage item_hunt:lang p33_l1 set value 'Keep your things... or your secrets, nobody will know.'
data modify storage item_hunt:lang p34_name set value 'Big Guy Armor'
data modify storage item_hunt:lang p34_l1 set value 'I can see my face from up here'
data modify storage item_hunt:lang p35_name set value '1000% Cotton Boots'
data modify storage item_hunt:lang p35_l1 set value 'Comfy and fashionable'
data modify storage item_hunt:lang p36_name set value 'Diving Chestplate'
data modify storage item_hunt:lang p36_l1 set value 'Diving set'
data modify storage item_hunt:lang p37_name set value 'Diving Helmet'
data modify storage item_hunt:lang p37_l1 set value 'Diving set'
data modify storage item_hunt:lang p38_name set value 'Diving Leggings'
data modify storage item_hunt:lang p38_l1 set value 'Diving set'
data modify storage item_hunt:lang p39_name set value 'Diving Boots'
data modify storage item_hunt:lang p39_l1 set value 'Diving set'
data modify storage item_hunt:lang p40_name set value 'CrossGun'
data modify storage item_hunt:lang p40_l1 set value 'Semi automatic, mechanical technology'
data modify storage item_hunt:lang p41_name set value 'Secret Tome 1'
data modify storage item_hunt:lang p41_l1 set value 'This should not exist...'
data modify storage item_hunt:lang p42_name set value 'Secret Tome 2'
data modify storage item_hunt:lang p42_l1 set value 'This should not exist...'
data modify storage item_hunt:lang p43_name set value 'Secret Tome 3'
data modify storage item_hunt:lang p43_l1 set value 'This should not exist...'
data modify storage item_hunt:lang p44_name set value 'Secret Tome 4'
data modify storage item_hunt:lang p44_l1 set value 'This should not exist...'
data modify storage item_hunt:lang p45_name set value 'Secret Tome 5'
data modify storage item_hunt:lang p45_l1 set value 'This should not exist...'
data modify storage item_hunt:lang p46_name set value 'Secret Tome 6'
data modify storage item_hunt:lang p46_l1 set value 'This should not exist...'
data modify storage item_hunt:lang p47_name set value 'Secret Tome 7'
data modify storage item_hunt:lang p47_l1 set value 'This should not exist...'
data modify storage item_hunt:lang p48_name set value 'Secret Tome 8'
data modify storage item_hunt:lang p48_l1 set value 'This should not exist...'
data modify storage item_hunt:lang p49_name set value 'Secret Tome 9'
data modify storage item_hunt:lang p49_l1 set value 'This should not exist...'
data modify storage item_hunt:lang p50_name set value 'Secret Tome 10'
data modify storage item_hunt:lang p50_l1 set value 'This should not exist...'
