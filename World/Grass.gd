extends Node2D

var GrassEffect = preload("res://Effects/GrassEffect.tscn")

func _on_hurtbox_area_entered(area):
	var grassEffect = GrassEffect.instantiate()
	get_parent().add_child(grassEffect)
	grassEffect.global_position = global_position
	queue_free()
