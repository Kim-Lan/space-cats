extends Control

signal unpause
signal return_title_confirmed
signal restart_confirmed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func show_pause():
	$PauseMenu.show()
	$ConfirmRestart.hide()
	$ConfirmTitleReturn.hide()
	$PauseMenu.find_child("ContinueButton").grab_focus()

func _on_continue_button_pressed():
	unpause.emit()

func _on_restart_button_pressed():
	$PauseMenu.hide()
	$ConfirmRestart.show()
	$ConfirmRestart.find_child("NoButton").grab_focus()

func _on_confirm_restart_yes_button_pressed():
	restart_confirmed.emit()

func _on_confirm_restart_no_button_pressed():
	show_pause()

func _on_return_title_button_pressed():
	$PauseMenu.hide()
	$ConfirmTitleReturn.show()
	$ConfirmTitleReturn.find_child("NoButton").grab_focus()

func _on_confirm_title_yes_button_pressed():
	return_title_confirmed.emit()

func _on_confirm_title_no_button_pressed():
	show_pause()