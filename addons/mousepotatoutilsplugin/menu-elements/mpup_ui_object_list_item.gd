# GDScript script template by Mouse Potato Does Stuff
@tool
# @icon
# @static_unload
class_name MpupUiObjectListItem
extends Control

## Insert doc comment here.

#region SEC (Signals, Enums, and Constants)

# Signals
signal sig_updated
signal sig_button_pressed
signal sig_interact(key:String,value:String)

# Enums

# Constants

#endregion

#region Variables

# Static variables

# @export variables

# Other variables

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

func setup(values: Dictionary):
	return

func on_interact(key:String,value:String):
	sig_interact.emit(key,value)

func on_update():
	sig_updated.emit()


func on_button_press() -> void:
	sig_button_pressed.emit()

#endregion

#endregion

#region Subclasses

# Subclasses here

#endregion
