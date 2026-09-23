extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_redridinghood_pressed() -> void:
	storymanager.current_story_path = "res://stories/littleredridinghood.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_2brothers_pressed() -> void:
	storymanager.current_story_path = "res://stories/twobrothers.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_princessfrog_pressed() -> void:
	storymanager.current_story_path = "res://stories/princessandfrog.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)
		
func _on_tomthumb_pressed() -> void:
	storymanager.current_story_path = "res://stories/tomthumb.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)
		
func _on_tortoisehare_pressed() -> void:
	storymanager.current_story_path = "res://stories/tortoiseandhare.json"
	
	get_tree().change_scene_to_file(
		"res://scenes/storyengine.tscn"
		)

func _on_mainmenubutton_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
	
func _on_topg2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/storyselection2.tscn")
