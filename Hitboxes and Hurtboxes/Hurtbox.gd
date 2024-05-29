extends Area2D

const HitEffect = preload("res://Effects/HitEffect.tscn")
@onready var timer = $Timer

var invincible = false : set = set_invincible
signal invincibility_started
signal invincibility_ended

func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")

#无敌开始，设定时间，时间结束执行_on_timer_timeout()
func start_invincibility(duration):
	self.invincible = true
	timer.wait_time = duration
	timer.start()

func create_hit_effect():
	var effect = HitEffect.instantiate()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position

#设置时间结束执行把状态变为无敌结束
func _on_timer_timeout():
	self.invincible = false


func _on_invincibility_ended():
	set_deferred("monitoring",true)
func _on_invincibility_started():
	set_deferred("monitoring",false)
