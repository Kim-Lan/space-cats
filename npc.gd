extends Area2D

var velocity: Vector2

func _ready():
	pass

func _physics_process(delta):
	position += velocity * delta

# delete itself once offscreen
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
