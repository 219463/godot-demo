extends CharacterBody2D

@export var ACCELERATION : int = 300
@export var MAX_SPEED : int = 100
@export var FRNCTION : int = 200
@export var can_ai : bool = true

var BatEffect = preload("res://Effects/BatEffect.tscn")
@onready var stats = $Stats	
@onready var PlayerDetectionZone = $PlayerDetectionZone
@onready var sprite = $Sprite2D
var state = IDLE
enum {
	IDLE,
	WANDER,
	CHASE
}

func  _physics_process(delta):
	see_player()
	match state :
		IDLE:
			idle(delta)
		WANDER:
			pass
		CHASE:
			if can_ai:
				chase(delta)
			sprite.flip_h = velocity.x < 0
	
func _on_hurtbox_area_entered(area):
	var vector = (global_position - area.global_position).normalized()
	velocity = vector * 100
	stats.health-=area.damage

func _on_stats_dead():
	var batEffect = BatEffect.instantiate()
	get_parent().add_child(batEffect)
	batEffect.global_position = global_position
	queue_free()

func see_player():
	if PlayerDetectionZone.can_see():
		state = CHASE
	else:
		state = IDLE

func idle(delta):
	velocity = velocity.move_toward(Vector2.ZERO , FRNCTION*delta)
	move_and_slide()
	
func chase(delta):
	var player = PlayerDetectionZone.player
	var vector = (player.global_position - global_position).normalized()
	velocity = velocity.move_toward(vector * MAX_SPEED , ACCELERATION*delta)
	move_and_slide()
	
