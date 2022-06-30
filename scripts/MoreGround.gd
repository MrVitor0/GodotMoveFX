extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


#avisa quando algum objeto entrar em contato com este rigid body
func on_collision_enter(other):
	print('bb')


# Called when the node enters the scene tree for the first time.
func _ready():
	print("oi")	
	pass # Replace with function body.

