#init message
tellraw @a {"text":"Item Hunt datapack loaded!","color":"gold","bold":true}
tellraw @a ["",{"text":"To config use ","color":"gold"},{"text":"/function item_hunt:config/open","color":"gold","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/function item_hunt:config/open"},"hoverEvent":{"action":"show_text","contents":"Click to open config"}}]
