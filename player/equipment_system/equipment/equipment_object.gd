extends Area3D
class_name EquipmentObject

## Dumb Area3D nodes that holding equipment stats, they do little more than a
## normal area3d would do. Designed to be used with an EquipmentSystem node, 
## which sets equipomentobjects equipped var, and reports to the a player_node if 
## the EquipmentObejct hit something.  
@export var wall_decor = false
@export var equipment_info : EquipmentResource = EquipmentResource.new()
@onready var equipped = false : set = update_equipped

signal equipped_changed
	
#func _ready():
	#if wall_decor:
		#update_equipped(true)
	
func update_equipped(_new_value):
	equipped = _new_value
	equipped_changed.emit(_new_value)
