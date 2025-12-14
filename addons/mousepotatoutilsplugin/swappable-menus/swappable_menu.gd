# GDScript script template by Mouse Potato Does Stuff
# @tool
# @icon
# @static_unload
class_name SwappableMenu
extends Control

## Insert doc comment here.

#region SEC (Signals, Enums, and Constants)

# Signals
signal sig_swap(new_menu:SwappableMenu,stack_up:bool)
signal sig_open_raw(new_menu:String,stack_up:bool)
signal sig_close

signal sig_setup
signal sig_play
signal sig_endgame

# Enums

# Constants

#endregion

#region Variables

# Static variables

# @export variables
@export var scene_parent:Node

# Other variables
var exported_data:Dictionary

# @onready class variables

#endregion

#region Methods

#region Overridden Built-in Methods

# _init(), _enter_tree(), _ready(), _process(), _physics_process(), and then the rest

#endregion

#region Overridden custom methods

# Overridden custom methods here

#endregion

#region New Methods

func enter(data:Dictionary)->void:
	self.exported_data.merge(data,true)
	self.show()

func exit()->void:
	self.hide()

func open_raw(new_menu:String,stack_up:bool=false):
	sig_open_raw.emit(new_menu,stack_up)

func open(new_menu:SwappableMenu,stack_up:bool=false):
	sig_swap.emit(new_menu,stack_up)

func close()->void:
	sig_close.emit()
	hide()

func exit_game()->void:
	get_tree().quit()

#endregion

#endregion

#region Subclasses

# Subclasses here

#endregion
