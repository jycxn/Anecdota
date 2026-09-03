extends Control

@export var story_path: String

var current_scene: String = ""
var current_line: int = 0
var story_data: Dictionary = {}
var displayed_text: String = ""
var is_transitioning: bool = false

@onready var scene_image: TextureRect = $sceneimage
@onready var dialogue_label: RichTextLabel = $dialogue_continue/dialoguepanel/dialoguetext
@onready var continue_button: Button = $continuebutton
@onready var choices_container: VBoxContainer = $choices
@onready var prompt_text: RichTextLabel = $prompt/promptpanel/prompttext
@onready var prompt_panel: Panel = $prompt/promptpanel
@onready var dialogue_elem: PanelContainer = $dialogue_continue
@onready var end_elem: PanelContainer = $endscn
@onready var prompt_elem: PanelContainer = $prompt
@onready var end_label: RichTextLabel = $endscn/endpanel/endtext
@onready var return_button: Button = $returnbutton
@onready var fade_overlay: ColorRect = $fadeoverlay
@onready var pause_overlay: Panel = $pauseoverlay
@onready var pause_menu: Panel = $pausemenu
@onready var exit_confirmation: Panel = $exitconfirm
@onready var restart_confirmation: Panel = $restartconfirm
@onready var pause_button: Button = $pausebutton

func _ready():
	fade_overlay.modulate.a = 0.0
	end_elem.visible = false
	return_button.visible = false
	pause_overlay.visible = false
	pause_menu.visible = false
	exit_confirmation.visible = false
	restart_confirmation.visible = false
	
	story_path = storymanager.current_story_path
	load_story()
	
	show_scene("scene1")
	
	
func load_story():
	## Loads the story from the .json file into the engine.
	
	var file = FileAccess.open(story_path, FileAccess.READ)
	
	var json_text = file.get_as_text()
	
	var json = JSON.new()
	var error = json.parse(json_text)
	
	if error != OK:
		push_error(
			"JSON parse error on line %d: %s"
			% [json.get_error_line(), json.get_error_message()]
			)
		return
		
	story_data = json.data
	
	if not story_data.has("scene1"):
		push_error("Story does not contain a starting scene called 'scene1'")
		return

func show_scene(scene_id: String):
	## Shows the scene associated with the corresponding scene name."
	reset_scene_ui()
	
	current_scene = scene_id
	current_line = 0
	
	var scene: Dictionary = story_data[current_scene]
	
	if scene.has("end") and scene["end"]:
		dialogue_label.text = "\n\n".join(scene["text"])
		dialogue_elem.visible = false
		prompt_elem.visible = false
		continue_button.visible = false
		end_elem.visible = true
		return_button.visible = true
		pause_button.visible = false
		
		for line in scene["text"]:
			displayed_text += line + "\n\n"

		end_label.text = displayed_text
		
		return
	
	scene_image.texture = load(scene["image"])
	
	show_current_line()

func show_current_line():
	## Displays the (next) line of text corresponding with the current scene.
	var scene: Dictionary = story_data[current_scene]
	
	displayed_text += scene["text"][current_line] + "\n\n"

	dialogue_label.text = displayed_text
	
func _on_continuebutton_pressed() -> void:
	var scene: Dictionary = story_data[current_scene]
	
	if current_line < scene["text"].size() - 1:
		current_line += 1
		show_current_line()
		return
	
	if scene.has("choices"):
		prompt_panel.visible = true
		prompt_text.visible = true
		prompt_text.text = scene["prompt"]
		
		continue_button.visible = false
		
		create_choice_buttons(scene["choices"])
		return
	
	transition_to_scene(str(scene["next"]))
	
func create_choice_buttons(choices: Array):
	## Creates the buttons for the choices with the text displayed within them.
	for choice in choices:
		var button = Button.new()
		button.text = choice["text"]

		button.add_theme_color_override("font_color", Color("28282b"))
		button.add_theme_font_size_override("font_size", 30)

		button.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

		var style = StyleBoxFlat.new()
		style.bg_color = Color("ffffffd2")
		button.add_theme_stylebox_override("normal", style)
		
		style.corner_radius_top_left = 12
		style.corner_radius_top_right = 12
		style.corner_radius_bottom_left = 12
		style.corner_radius_bottom_right = 12

		choices_container.add_child(button)

		button.pressed.connect(
			_on_choice_pressed.bind(str(choice["next"]))
		)

func _on_choice_pressed(scene_id: String):
	transition_to_scene(scene_id)

func transition_to_scene(scene_id: String) -> void:
	if is_transitioning:
		return

	is_transitioning = true
	continue_button.disabled = true

	var fade_out = create_tween()
	fade_out.tween_property(
		fade_overlay,
		"modulate:a",
		1.0,
		0.3
	)

	await fade_out.finished

	show_scene(scene_id)

	var fade_in = create_tween()
	fade_in.tween_property(
		fade_overlay,
		"modulate:a",
		0.0,
		0.3
	)

	await fade_in.finished

	continue_button.disabled = false
	is_transitioning = false

func reset_scene_ui():
	for child in choices_container.get_children():
		child.queue_free()

	displayed_text = ""
	
	dialogue_label.modulate.a = 1.0
	end_elem.visible = false
	return_button.visible = false
	prompt_panel.visible = false
	prompt_text.visible = false
	pause_overlay.visible = false
	pause_menu.visible = false
	exit_confirmation.visible = false
	restart_confirmation.visible = false

	continue_button.visible = true


func _return_to_mainmenu() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")


func _on_pausebutton_pressed() -> void:
	pause_overlay.visible = true
	pause_menu.visible = true


func _on_resumebutton_pressed() -> void:
	pause_overlay.visible = false
	pause_menu.visible = false
	
func _restart_story() -> void:
	transition_to_scene("scene1")

func _on_noconfirmation_pressed() -> void:
	exit_confirmation.visible = false
	restart_confirmation.visible = false
	pause_overlay.visible = true
	pause_menu.visible = true


func _on_restartbutton_pressed() -> void:
	pause_menu.visible = false
	restart_confirmation.visible = true


func _on_exitbutton_pressed() -> void:
	pause_menu.visible = false
	exit_confirmation.visible = true
