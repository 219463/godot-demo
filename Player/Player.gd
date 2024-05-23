extends CharacterBody2D

#4.0后，velocity在2D中被定义，无需重复定义
const MAX_SPEED = 150
#加速度 时间单位是 秒
const ACCELEARTION = 1500
#摩擦力
const FRNCTION = 5000

@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")

#delta是上一帧的运行时间
func _physics_process(delta):
	#vector 方向向量 包含了x,y的单位量
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	#方向向量单位化
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		#相当于设定动画树的方向，只有在有方向时加载，能避免无方向时在（0，0）默认方向
		animationTree.set("parameters/Idle/blend_position",input_vector)
		animationTree.set("parameters/Run/blend_position",input_vector)
		#执行Run动画
		animationState.travel("Run")
		#move_toward : 目标速度向量，每秒变化，摩擦力的加速度
		velocity = velocity.move_toward(input_vector*MAX_SPEED , ACCELEARTION*delta)
	else:
		#执行Idle动画
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO , FRNCTION*delta)
		
	#传递速度
	move_and_slide()
	
	
