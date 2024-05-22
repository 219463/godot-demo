extends CharacterBody2D

#4.0后，velocity在2D中被定义，无需重复定义
const MAX_SPEED = 5
#加速度
const ACCELEARTION = 20
#摩擦力
const FRNCTION = 50

func _ready():
	print("start")
#delta是上一帧的运行时间
func _physics_process(delta):
	#vector 方向向量 包含了x,y的单位量
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	#方向向量单位化
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		#move_toward : 目标速度向量，每秒变化，摩擦力的加速度
		velocity = velocity.move_toward(input_vector*MAX_SPEED , ACCELEARTION*delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO , FRNCTION*delta)
		
	#传递速度
	move_and_collide(velocity)
	print(velocity)
	
	
