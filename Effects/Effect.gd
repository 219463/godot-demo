extends AnimatedSprite2D

func _ready():
	#connect("animation_finished",Callable(self,"finished"))一样的写法
	animation_finished.connect(Callable(self,"finished"))
	play("Animation")

func finished():
	queue_free()
