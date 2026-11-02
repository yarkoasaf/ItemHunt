# One-time language prompt, broadcast from item_hunt:load while langset is 0.
# It keeps appearing on every reload until a language is picked (from here or
# from the config menu), which is what guarantees the admin sees it: the #load
# tag runs before any player is in the world, so on a fresh world the broadcast
# below reaches nobody and the next reload has to ask again.
#
# Deliberately bilingual and hardcoded: it is the one message that cannot read
# storage item_hunt:lang, because its whole job is choosing what goes in there.

tellraw @a [""]
tellraw @a ["",{"text":"[Item Hunt] ","color":"aqua"},{"text":"Choose language / Elige idioma:","color":"gold","bold":true}]
tellraw @a ["",{"text":"  "},{"text":"[English]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_lang {val:1}"},"hoverEvent":{"action":"show_text","contents":"Set the interface language to English"}},{"text":"   "},{"text":"[Español]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/set_lang {val:0}"},"hoverEvent":{"action":"show_text","contents":"Poner la interfaz en Español"}}]
tellraw @a [{"text":"  (Español by default -- you can change it any time in the config menu)","color":"gray","italic":true}]
