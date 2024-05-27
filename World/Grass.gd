extends Node2D


func _on_hurtbox_area_entered(area):
	var GrassEffect = load("res://Effects/GrassEffect.tscn")
	var grassEffect = GrassEffect.instantiate()
	var world = get_tree().current_scene
	world.add_child(grassEffect)
	grassEffect.global_position = global_position
	queue_free()