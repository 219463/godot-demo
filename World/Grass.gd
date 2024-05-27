extends Node2D

var GrassEffect = preload("res://Effects/GrassEffect.tscn")
@export var show_hit_effect:bool = true

func _on_hurtbox_area_entered(area):
	if show_hit_effect:
		var grassEffect = GrassEffect.instantiate()
		get_parent().add_child(grassEffect)
		grassEffect.global_position = global_position
		queue_free()
