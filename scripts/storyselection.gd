extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_chickenlittle_pressed() -> void:
	storymanager.current_story_path = "res://stories/chickenlittle.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_prthumbnail_pressed() -> void:
	storymanager.current_story_path = "res://stories/peterrabbit.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)
