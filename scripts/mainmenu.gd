extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_story_selector_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/storyselection.tscn")


func _on_tutorial_pressed() -> void:
	storymanager.current_story_path = "res://stories/tutorial.json"
	get_tree().change_scene_to_file("res://scenes/storyengine.tscn")
