extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_chickenlittle_pressed() -> void:
	storymanager.current_story_path = "res://stories/chickenlittle.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_peterrabbit_pressed() -> void:
	storymanager.current_story_path = "res://stories/peterrabbit.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)
		
func _on_shoemaker_pressed() -> void:
	storymanager.current_story_path = "res://stories/elvesandtheshoemaker.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_goldilocks_pressed() -> void:
	storymanager.current_story_path = "res://stories/goldilocksandthethreebears.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_cinderella_pressed() -> void:
	storymanager.current_story_path = "res://stories/cinderella.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)
		
func _on_threelittlepigs_pressed() -> void:
	storymanager.current_story_path = "res://stories/threelittlepigs.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_mainmenubutton_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
