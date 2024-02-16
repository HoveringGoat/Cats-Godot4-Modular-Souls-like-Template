extends RigidBody3D
class_name ItemObject

@export var target_group :String = "Player"
@export_enum("HURT","HEAL") var effect_type :String = "HEAL"
@export_enum("DRINK","THROWN","OTHER") var object_type : String= "DRINK"
@export var power : int = 1
@export var time_to_live : float = 2
var player_node
var use_item = false

func _ready():
	freeze = true

func activate():
	top_level = true
	freeze = false
	use_item = true
	await get_tree().create_timer(time_to_live).timeout
	queue_free()

func _on_area_3d_body_entered(body):
	if body.is_in_group(target_group):
		if effect_type == "HEAL":
			if body.has_method("heal"):
				body.heal(self)
		elif effect_type == "HURT":
			if body.has_method("hit"):
				body.hit(player_node,self)
