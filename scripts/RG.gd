extends RigidBody

func _on_Caixa_body_entered(body:Node):
	if body.is_in_group("player"):
	   print('finished')
