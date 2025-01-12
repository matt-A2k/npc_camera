@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type('NPCCamera2D', 'Node2D', preload('res://addons/npc_camera/npc_camera2d_node.gd'), preload('res://addons/npc_camera/npc_camera.svg'))


func _exit_tree() -> void:
	remove_custom_type('NPCCamera2D')
