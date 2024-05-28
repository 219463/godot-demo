extends Node

@export var max_health:int = 1
@onready var health = max_health : set = set_health

signal dead
#每次health被改变时调用
func set_health(value):
	health = value
	if health <= 0:
		#发出dead信号，被生物接收
		emit_signal("dead")
