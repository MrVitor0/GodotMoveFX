extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Floor = $Floor
onready var Player = $Player
onready var Wall = $Floor/Wall


#on trigger enter
func _on_trigger_enter(other: Node):
	if other is Player:
		Player.die()

