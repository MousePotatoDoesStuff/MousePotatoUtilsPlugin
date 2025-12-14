# GDScript script template by Mouse Potato Does Stuff
@tool
# @icon
# @static_unload
class_name MpupUiDictElement
extends HBoxContainer

## Insert doc comment here.

#region SEC (Signals, Enums, and Constants)

# Signals
signal sig_updated(key:String, value:String)

# Enums

# Constants

#endregion

#region Variables

# Static variables

# @export variables
@export var name_node: TextEdit
@export var value_node: TextEdit
@export_category("Parameters")
@export var name_width:float=200
@export var data_width:float=200
@export var height:float=50

# Other variables

# @onready class variables

#endregion

#region Methods

#region Overridden Built-in Methods
# _init(), _enter_tree(), _ready(), _process(), _physics_process(), and then the rest

func _process(_delta: float) -> void:
	pass

#endregion

#region Overridden custom methods

# Overridden custom methods here

#endregion

#region New Methods

func onresize():
	if name_node==null or value_node==null:
		return
	name_node.custom_minimum_size.x=name_width
	name_node.custom_minimum_size.y=height
	value_node.custom_minimum_size.x=data_width
	

func setup(key:String, value:String):
	name_node.text=key
	value_node.text=value
	self.show()
	return

#endregion

#endregion

#region Subclasses

# Subclasses here

#endregion
