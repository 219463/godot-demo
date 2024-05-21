extends CharacterBody2D

#4.0后，velocity在2D中被定义，无需重复定义
const MAX_SPEED = 200
#加速度
const ACCELEARTION = 25
#摩擦力
const FRNCTION = 25

func _ready():
	print("start")
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	#方向向量单位化
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELEARTION * delta
		velocity = velocity.limit_length(MAX_SPEED * delta)
		print(velocity)
	else:
		#move_toward : 目标速度，每秒变化
		velocity = velocity.move_toward(Vector2.ZERO , FRNCTION*delta)
		
	#传递速度
	move_and_collide(velocity)
	
	
