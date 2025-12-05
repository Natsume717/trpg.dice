#sound
execute if data storage lzaq:dice output{boolen:"1"} run playsound lzaq:dice.01 master @s ~ ~ ~ 0.25 1 0.2
execute if data storage lzaq:dice output{boolen:"0"} at @s run playsound lzaq:dice.01 master @a ~ ~ ~ 0.25 1 0.2
#
$execute if score @s .lzaq.roll_count matches -1 if data storage lzaq:dice output{boolen:"1"} run tellraw @s ["",{text:"--《ロール結果》-"},{text:"$(count)d$(faces)",color:light_purple},{text:"-["},{text:"秘匿",color:dark_aqua},{text:"]--"}]
$execute if score @s .lzaq.roll_count matches -1 if data storage lzaq:dice output{boolen:"0"} run tellraw @a ["",{text:"--《"},{selector:"@s"},{text:"のロール結果》-"},{text:"$(count)d$(faces)",color:light_purple},{text:"-["},{text:"全体",color:dark_aqua},{text:"]--"}]
$execute if score @s .lzaq.roll_count matches -1 run scoreboard players set @s .lzaq.roll_count $(count)

#roll
$execute store result score @s .lzaq.roll_result run random value 1..$(faces) 

scoreboard players add @s .lzaq.roll_count.inverse 1

#message
execute if data storage lzaq:dice output{boolen:"1"} run tellraw @s ["",{score:{name:"@s",objective:".lzaq.roll_count.inverse"}},{text:"回目: "},{score:{name:"@s",objective:".lzaq.roll_result"}}]
execute if data storage lzaq:dice output{boolen:"0"} run tellraw @a ["",{score:{name:"@s",objective:".lzaq.roll_count.inverse"}},{text:"回目: "},{score:{name:"@s",objective:".lzaq.roll_result"}}]


execute if score @s .lzaq.roll_count matches 1.. run scoreboard players remove @s .lzaq.roll_count 1

execute if score @s .lzaq.roll_count matches 0 if data storage lzaq:dice output{boolen:"1"} run tellraw @s ["",{text:"-------------------------"}]
execute if score @s .lzaq.roll_count matches 0 if data storage lzaq:dice output{boolen:"0"} run tellraw @a ["",{text:"------------------------------------"}]

execute if score @s .lzaq.roll_count matches 1.. run function lzaq.dice:display/roll with storage lzaq:dice output

