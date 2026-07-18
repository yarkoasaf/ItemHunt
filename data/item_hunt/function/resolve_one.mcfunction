$data modify storage item_hunt:data $(slot) set from storage item_hunt:items list[$(idx)]
$data modify storage item_hunt:data $(slot).scoreboard set value "$(scoreboard)"
$data modify storage item_hunt:data $(slot).display set value $(display)