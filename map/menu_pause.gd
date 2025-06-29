extends CanvasLayer


func _ready():
	$VBoxContainer/PlayBtn.grab_focus()
	get_tree().paused = true


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		$VBoxContainer/PlayBtn.grab_focus()

func _on_play_btn_pressed() -> void:
	visible = false

func _on_options_btn_pressed() -> void:
	$OptionsUI.visible = true
	$OptionsUI/OptionsBackBtn.grab_focus()

func _on_help_btn_pressed() -> void:
	$HelpUI.visible = true
	$HelpUI/HelpBackBtn.grab_focus()
	
	
func _on_help_link_button_pressed() -> void:
	OS.shell_open("https://google.com/")


func _on_credits_btn_pressed() -> void:
	$CreditsUI.visible = true
	$CreditsUI/CreditsBackBtn.grab_focus()


func _on_quit_btn_pressed() -> void:
	get_tree().quit()


func _on_help_back_btn_pressed() -> void:
	$HelpUI.visible = false
	$VBoxContainer/PlayBtn.grab_focus()


func _on_credits_back_btn_pressed() -> void:
	$CreditsUI.visible = false
	$VBoxContainer/PlayBtn.grab_focus()


func _on_options_back_btn_pressed() -> void:
	$OptionsUI.visible = false
	$VBoxContainer/PlayBtn.grab_focus()

## CHANGE VALUE OF OPTIONS 
func _on_slider_1_value_changed(value: float) -> void:
	$OptionsUI/Control/value1.text = str(value)
	check_if_code_is_correct()

func _on_slider_2_value_changed(value: float) -> void:
	$OptionsUI/Control/value2.text = str(value)
	check_if_code_is_correct()

func _on_slider_3_value_changed(value: float) -> void:
	$OptionsUI/Control/value3.text = str(value)
	check_if_code_is_correct()
	
func check_if_code_is_correct():
	if $OptionsUI/Control/value1.text == "1.0" and $OptionsUI/Control/value2.text == "3.0"  and $OptionsUI/Control/value3.text == "1.0":
		$"../Levels/Level2/arrow".visible = true

func _on_visibility_changed() -> void:
	get_tree().paused = visible
