extends Control

@export var heart_scene: PackedScene

var current_health: int

var health_bar

func _ready():
	health_bar = find_child("HealthBar")

func update_score(value):
	find_child("ScoreLabel").text = str(value)

func update_health(value):
	for i in health_bar.get_child_count():
		health_bar.get_child(i).visible = value > i
	#$HealthLabel.text = HEALTH_LABEL + str(value)

func draw_health(value):
	get_tree().call_group("hearts", "queue_free")
	current_health = value
	for i in value:
		var heart = heart_scene.instantiate()
		health_bar.add_child(heart)

func minus_health():
	current_health -= 1
	var last_heart = health_bar.get_child(current_health)
	last_heart.flash()
