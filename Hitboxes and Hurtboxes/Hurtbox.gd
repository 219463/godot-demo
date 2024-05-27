extends Area2D

const HitEffect = preload("res://Effects/HitEffect.tscn")
@export var show_hit : bool = true

func _on_area_entered(area):
	if show_hit:
		var effect = HitEffect.instantiate()
		var main = get_tree().current_scene
		main.add_child(effect)
		effect.global_position = global_position