extends Node2D
@onready var anim = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
	GestureBridge.gesture_detected.connect(_on_gesture)
	
func _on_gesture(gesture: String):
	print("Got gesture: ", gesture)
	if gesture == "feed":
		anim.play("happy")
	if gesture == "pet":
		sprite_2d.frame = 1
	if gesture == "play":
		sprite_2d.frame = 2
	if gesture == "sleep":
		sprite_2d.frame = 0
		
