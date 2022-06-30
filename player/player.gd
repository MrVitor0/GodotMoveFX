extends KinematicBody

export var max_speed = 12
export var gravity = 70
export var jump_impulse = 25

var velocity = Vector3.ZERO

onready var pivot = $Pivot

#definir uma variável chamada "AnimationPlayer" que recebe o AnimationPlayer do objeto CharacterMesh que fica dentro do objeto Pivot
onready var AnimationPlayer = $Pivot/CharacterMesh/AnimationPlayer


func is_jumping():  
	return velocity.y == 0


func _physics_process(delta):
	var input_vector = get_input_vector()
	apply_movement(input_vector)
	apply_gravity(delta)
	jump()
	velocity = move_and_slide(velocity, Vector3.UP)
	
	
func get_input_vector():
	var input_vector = Vector3.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.z = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")

	#verifica se o persoangem está em movimento
	if input_vector.length_squared() > 0.0 && is_on_floor():
	   AnimationPlayer.play("run")
	#verifica se o jogador está parado e não está pulando
	elif input_vector.length_squared() <= 0.0 && is_jumping():
	   AnimationPlayer.play("idle")


	return input_vector.normalized()
	



func apply_movement(input_vector):
	velocity.x = input_vector.x * max_speed
	velocity.z = input_vector.z * max_speed

	if input_vector != Vector3.ZERO:
		pivot.look_at(translation + input_vector, Vector3.UP)
	
	
func apply_gravity(delta):
	velocity.y -= gravity * delta
	

func jump():
	if is_on_floor() and Input.is_action_pressed("jump"):
		AnimationPlayer.play("jump")
		velocity.y = jump_impulse
