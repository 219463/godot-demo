extends CharacterBody2D

func  _physics_process(delta):
	velocity = velocity.move_toward(Vector2.ZERO,300*delta)
	move_and_slide()

func _on_hurtbox_area_entered(area):
	var vector = (global_position - area.global_position).normalized()
	velocity = vector * 100
