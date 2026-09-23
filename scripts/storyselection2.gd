extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_boycriedwolf_pressed() -> void:
	storymanager.current_story_path = "res://stories/boywhocriedwolf.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_jackbeanstalk_pressed() -> void:
	storymanager.current_story_path = "res://stories/jackandthebeanstalk.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_alicewonderland_pressed() -> void:
	storymanager.current_story_path = "res://stories/aliceinwonderland.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_magicmirror_pressed() -> void:
	storymanager.current_story_path = "res://stories/magicmirror.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_uglyduckling_pressed() -> void:
	storymanager.current_story_path = "res://stories/uglyduckling.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)
		
func _on_emperorclothes_pressed() -> void:
	storymanager.current_story_path = "res://stories/emperorsnewclothes.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_mainmenubutton_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
	
func _on_topg1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/storyselection1.tscn")

func _on_topg3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/storyselection3.tscn")
