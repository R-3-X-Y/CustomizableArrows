# This is the "main" function. This will play EVERY frame of the game!
# You can have more than 1 of these type of files, and you can change naming and such.
# To do so go to this data > minecraft > tags > functions > tick
# that file says what functions get repeated each tick/frame.

#make arrows do stuff
#lightning arrow
execute at @e[type=minecraft:arrow, nbt={Color: 11264493, inGround: 1b}] run summon minecraft:lightning_bolt
execute as @e[type=minecraft:arrow, nbt={Color: 11264493, inGround: 1b}] run kill @s


#tnt arrow
execute at @e[type=minecraft:arrow, nbt={Color: 12189696, inGround: 1b}] run summon tnt
execute as @e[type=minecraft:arrow, nbt={Color: 12189696, inGround: 1b}] run kill @s

#evoker arrow
execute at @e[type=minecraft:arrow, nbt={Color: 2920704, inGround: 1b}] run summon minecraft:evoker_fangs
execute at @e[type=minecraft:arrow, nbt={Color: 2920704, inGround: 1b}] run summon minecraft:evoker_fangs ~1 ~ ~
execute at @e[type=minecraft:arrow, nbt={Color: 2920704, inGround: 1b}] run summon minecraft:evoker_fangs ~-1 ~ ~
execute at @e[type=minecraft:arrow, nbt={Color: 2920704, inGround: 1b}] run summon minecraft:evoker_fangs ~ ~ ~1
execute at @e[type=minecraft:arrow, nbt={Color: 2920704, inGround: 1b}] run summon minecraft:evoker_fangs ~ ~ ~-1
execute as @e[type=minecraft:arrow, nbt={Color: 2920704, inGround: 1b}] run kill @s


#crafting
#craft lightning arrows
execute as @e[sort=nearest, limit=1, nbt={Item:{id:"minecraft:arrow", Count: 8b}}] at @s as @e[sort=nearest, limit=1, nbt={Item:{id:"minecraft:enchanted_book", Count: 1b, tag: {StoredEnchantments: [{lvl: 1s, id: "minecraft:channeling"}]}}}, distance=0..1] at @s run summon minecraft:item ~ ~0.1 ~ {Tags: ["lightning_craft"], Item:{id:"minecraft:tipped_arrow", Count: 8b, tag:{CustomPotionColor: 11264493, display:{Lore: ['{"text":"Lightning","color":"red","italic":false}'], Name: '{"text":"Arrow of Lightning","italic":false}'}}}}
execute at @e[tag=lightning_craft] run kill @e[sort=nearest, limit=1, nbt={Item:{id:"minecraft:arrow", Count: 8b}}]
execute at @e[tag=lightning_craft] run kill @e[sort=nearest, limit=1, nbt={Item:{id:"minecraft:enchanted_book", Count: 1b, tag: {StoredEnchantments: [{lvl: 1s, id: "minecraft:channeling"}]}}}]
execute at @e[tag=lightning_craft] run playsound minecraft:entity.lightning_bolt.thunder player @p
execute at @e[tag=lightning_craft] run particle minecraft:explosion_emitter ~ ~ ~
execute as @e[tag=lightning_craft] run tag @s remove lightning_craft

#craft tnt arrows
execute as @e[sort=nearest, limit=1, nbt={Item:{id:"minecraft:arrow", Count: 8b}}] at @s as @e[sort=nearest, limit=1, nbt={Item:{id:"minecraft:tnt", Count: 1b}}, distance=0..1] at @s run summon minecraft:item ~ ~0.1 ~ {Tags: ["tnt_craft"], Item:{id:"minecraft:tipped_arrow", Count: 8b, tag:{CustomPotionColor: 12189696, display:{Lore: ['{"text":"Explosion","color":"red","italic":false}'], Name: '{"text":"Exploding Arrow","italic":false}'}}}}
execute at @e[tag=tnt_craft] run kill @e[sort=nearest, limit=1, nbt={Item:{id:"minecraft:arrow", Count: 8b}}]
execute at @e[tag=tnt_craft] run kill @e[sort=nearest, limit=1, nbt={Item:{id:"minecraft:tnt", Count: 1b}}]
execute at @e[tag=tnt_craft] run playsound minecraft:entity.generic.explode player @p
execute at @e[tag=tnt_craft] run particle minecraft:explosion_emitter ~ ~ ~
execute as @e[tag=tnt_craft] run tag @s remove tnt_craft

#craft evoker arrows
execute as @e[sort=nearest, limit=1, nbt={Item:{id:"minecraft:arrow", Count: 64b}}] at @s as @e[sort=nearest, limit=1, nbt={Item:{id:"minecraft:totem_of_undying", Count: 1b}}, distance=0..1] at @s run summon minecraft:item ~ ~0.1 ~ {Tags: ["evo_craft"], Item:{id:"minecraft:tipped_arrow", Count: 64b, tag:{CustomPotionColor: 2920704, display:{Lore: ['{"text":"Evoker Fangs","color":"red","italic":false}'], Name: '{"text":"Evoker Arrow","italic":false}'}}}}
execute at @e[tag=evo_craft] run kill @e[sort=nearest, limit=1, nbt={Item:{id:"minecraft:arrow", Count: 64b}}]
execute at @e[tag=evo_craft] run kill @e[sort=nearest, limit=1, nbt={Item:{id:"minecraft:totem_of_undying", Count: 1b}}]
execute at @e[tag=evo_craft] run playsound minecraft:entity.evoker.cast_spell player @p
execute at @e[tag=evo_craft] run particle minecraft:explosion_emitter ~ ~ ~
execute as @e[tag=evo_craft] run tag @s remove evo_craft

#information
scoreboard players enable @a C_A_Info
tellraw @a[scores={C_A_Info=1..}] ["",{"text":"Custom Arrows Information","bold":true,"underlined":true,"color":"dark_green"},"\n",{"text":"Custom Arrows is a datapack that adds 3 new arrow types into the game by default.","color":"green"},"\n",{"text":"More arrows can be added if you edit the main function in the data pack.","color":"dark_green"},"\n",{"text":"The three default arrow types are Lightning Arrows, Exploding Arrows, and Evoker Arrows","color":"green"},"\n",{"text":"Click here to learn how to craft the default arrow types","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger C_A_Crafting"}},"\n",{"text":"If new custom arrows are added, you will need to ask the manager for the recipe","color":"green"}]
scoreboard players set @a[scores={C_A_Info=1..}] C_A_Info 0
scoreboard players enable @a C_A_Crafting
tellraw @a[scores={C_A_Crafting=1..}] ["",{"text":"Crafting Custom Arrows","bold":true,"underlined":true,"color":"dark_green"},"\n",{"text":"The custom arrows are crafted by dropping certain items close together","color":"green"},"\n",{"text":"Lightning arrows are crafted by dropping 8 arrows and a channeling enchantment book together","color":"dark_green"},"\n",{"text":"Exploding arrows are crafted by dropping 8 arrows and a TNT together","color":"green"},"\n",{"text":"Evoker arrows are crafted by dropping 64 arrows and a totem of undying together","color":"dark_green"}]
scoreboard players set @a[scores={C_A_Crafting=1..}] C_A_Crafting 0



