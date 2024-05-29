extends Control

var heart = 4 : set = set_heart
@onready var heartUIEmpty = $HeartUIEmpty
@onready var heartUIFull = $HeartUIFull
var max_heart

func _ready():
	self.max_heart = PlayerStats.max_health
	if heartUIEmpty != null:
		heartUIEmpty.size.x = heart * 15
	self.heart = PlayerStats.health
	PlayerStats.health_change.connect(Callable(self,"set_heart"))
	
func set_heart(value):
	heart = clamp(value,0,max_heart)
	if heartUIFull != null:
		heartUIFull.size.x = heart * 15
