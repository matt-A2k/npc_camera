@tool
extends Node2D

@export var target:CollisionPolygon2D
@export_range(0, 90) var angle:int = 45:
	set(a):
		angle = a
		left_bound = Vector2(cos(deg_to_rad(angle)), -sin(deg_to_rad(angle)))
		right_bound = Vector2(cos(deg_to_rad(-angle)), -sin(deg_to_rad(-angle)))
		if(get_child_count()):
			var view_area = get_child(0).get_child(0)
			view_area.material.set('shader_param/angle', angle)
		
@export var distance:float = 500.0:
	set(r):
		distance = r
		if(get_child_count()):
			var view_area = get_child(0).get_child(0)
			view_area.size = Vector2(distance, distance*2)
			view_area.position.y = -distance

@export var near_color:Color = Color(0.0, 0.4, 0.8, 1.0):
	set(color):
		near_color = color
		if(get_child_count()):
			var view_area = get_child(0).get_child(0)
			view_area.material.set('shader_param/near_color', color)

@export var far_color:Color = Color(0.0, 0.4, 0.8, 0.125):
	set(color):
		far_color = color
		if(get_child_count()):
			var view_area = get_child(0).get_child(0)
			view_area.material.set('shader_param/far_color', color)

var left_bound:Vector2
var right_bound:Vector2

func check_vertex(target_pos:Vector2):
	return ( sqrt(pow(target_pos.x, 2) + pow(target_pos.y, 2)) < distance
		and  (right_bound.y*target_pos.x) - (right_bound.x*target_pos.y) > 0
		and  (left_bound.x*target_pos.y) - (left_bound.y*target_pos.x) > 0 )

func is_viewing() -> bool:
	var target_pos:Vector2 = to_local(target.global_position)
	var angle:float = global_rotation-target.global_rotation
	
	for v in target.polygon:
		if(check_vertex(Vector2(
			v.x*cos(angle) + v.y*sin(angle),
			v.x*-sin(angle)+ v.y*cos(angle)) + target_pos)):
			return true
	return false

func _enter_tree() -> void:
	var view_area = preload('ViewArea.tscn').instantiate()
	add_child(view_area)
	view_area.get_child(0).size = Vector2(distance, distance*2)
	view_area.get_child(0).position.y -= distance

#func _exit_tree() -> void:get_child(0).queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var view_area = get_child(0).get_child(0)
	view_area.material.set('shader_param/angle', angle)
	view_area.material.set('shader_param/near_color', near_color)
	view_area.material.set('shader_param/far_color', far_color)
	view_area.size = Vector2(distance, distance*2)
	view_area.position.y = -distance
	left_bound = Vector2(cos(deg_to_rad(angle)), -sin(deg_to_rad(angle)))
	right_bound = Vector2(cos(deg_to_rad(-angle)), -sin(deg_to_rad(-angle)))
