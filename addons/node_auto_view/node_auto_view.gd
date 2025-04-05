@tool
extends EditorPlugin

func _enter_tree() -> void:
	EditorInterface.get_selection().selection_changed.connect(_on_selection_changed)

func _exit_tree() -> void:
	EditorInterface.get_selection().selection_changed.disconnect(_on_selection_changed)

func _on_selection_changed() -> void:
	var _nodes := EditorInterface.get_selection().get_selected_nodes()
	var all_2d := true
	var all_3d := true
	for _node in _nodes:
		if (not _node is Node2D) and (not _node is Control):
			all_2d = false
		if not _node is Node3D:
			all_3d = false
	if all_2d: EditorInterface.set_main_screen_editor("2D")
	elif all_3d: EditorInterface.set_main_screen_editor("3D")
