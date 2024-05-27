extends CharacterBody2D

@onready var stats = $Stats

var BatEffect = preload("res://Effects/BatEffect.tscn")

func  _physics_process(delta):
	velocity = velocity.move_toward(Vector2.ZERO,300*delta)
	move_and_slide()

func _on_hurtbox_area_entered(area):
	var vector = (global_position - area.global_position).normalized()
	velocity = vector * 100
	stats.health-=area.damage


func _on_stats_dead():
	var batEffect = BatEffect.instantiate()
	get_parent().add_child(batEffect)
	batEffect.global_position = global_position
	queue_free()
