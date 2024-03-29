extends Control

signal start_button_pressed
signal reset_high_score_pressed

func _ready():
	find_child("FocusControl").grab_focus()
	$Title.play()
	$PlayerSprite.play()

func _on_start_button_pressed():
	$FocusControl.grab_focus()
	start_button_pressed.emit()

func set_high_score(value):
	find_child("HighScoreValue").text = str(value)

func _on_reset_high_score_button_pressed():
	reset_high_score_pressed.emit()

func _on_animation_toggled(toggled_on):
	if toggled_on:
		$Title.play()
		$PlayerSprite.play()
	else:
		$Title.stop()
		$PlayerSprite.stop()

func _on_exit_button_pressed():
	get_tree().quit()
