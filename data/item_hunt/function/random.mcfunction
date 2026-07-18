#tellraw @a [{"text":"[Item Hunt] ","color":"gold"},{"text":"Generando nuevos items del día...","color":"yellow"}]
#genera random value entre min and max y guarda en score item de scoreboard item_hunt_item(1,2,3,4,5)
$execute store result score item item_hunt_item1 run random value $(min)..$(max)
$execute store result score item item_hunt_item2 unless score item item_hunt_item2 = item item_hunt_item1 run random value $(min)..$(max)
$execute store result score item item_hunt_item3 unless score item item_hunt_item3 = item item_hunt_item1 unless score item item_hunt_item3 = item item_hunt_item2 run random value $(min)..$(max)
$execute store result score item item_hunt_item4 unless score item item_hunt_item4 = item item_hunt_item1 unless score item item_hunt_item4 = item item_hunt_item2 unless score item item_hunt_item4 = item item_hunt_item3 run random value $(min)..$(max)
$execute store result score item item_hunt_item5 unless score item item_hunt_item5 = item item_hunt_item1 unless score item item_hunt_item5 = item item_hunt_item2 unless score item item_hunt_item5 = item item_hunt_item3 unless score item item_hunt_item5 = item item_hunt_item4 run random value $(min)..$(max)
$execute store result score item item_hunt_item6 unless score item item_hunt_item6 = item item_hunt_item1 unless score item item_hunt_item6 = item item_hunt_item2 unless score item item_hunt_item6 = item item_hunt_item3 unless score item item_hunt_item6 = item item_hunt_item4 unless score item item_hunt_item6 = item item_hunt_item5 run random value $(min)..$(max)
$execute store result score item item_hunt_item7 unless score item item_hunt_item7 = item item_hunt_item1 unless score item item_hunt_item7 = item item_hunt_item2 unless score item item_hunt_item7 = item item_hunt_item3 unless score item item_hunt_item7 = item item_hunt_item4 unless score item item_hunt_item7 = item item_hunt_item5 unless score item item_hunt_item7 = item item_hunt_item6 run random value $(min)..$(max)


#(debug) desactivado - spameaba los valores random en el chat en cada reset
#tellraw @s [{"text":"Random value: "},{"score":{"name":"item","objective":"item_hunt_item1"}}]
#tellraw @s [{"text":"Random value: "},{"score":{"name":"item","objective":"item_hunt_item2"}}]
#tellraw @s [{"text":"Random value: "},{"score":{"name":"item","objective":"item_hunt_item3"}}]
#tellraw @s [{"text":"Random value: "},{"score":{"name":"item","objective":"item_hunt_item4"}}]
#tellraw @s [{"text":"Random value: "},{"score":{"name":"item","objective":"item_hunt_item5"}}]