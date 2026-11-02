#init message
tellraw @a {"nbt":"loaded","storage":"item_hunt:lang","interpret":true}
tellraw @a {"nbt":"loaded_hint","storage":"item_hunt:lang","interpret":true}

# First run only: ask for a language until one is picked (config/set_lang
# raises langset). Runs after init, which is why storage item_hunt:lang is
# already filled by the time the two lines above are sent.
execute if score langset item_hunt_config matches 0 run function item_hunt:config/lang_prompt
