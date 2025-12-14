# GDScript script template by Mouse Potato Does Stuff
# @tool
# @icon
# @static_unload
class_name InputKeybind
extends MpupUiObjectListItem

## Insert doc comment here.

#region SEC (Signals, Enums, and Constants)

# Signals

# Enums

# Constants

#endregion

#region Variables

# Static variables

# @export variables
@export var name_t: RichTextLabel
@export var role: Button

# Other variables

# @onready class variables

#endregion

#region Methods

#region Overridden Built-in Methods

# _init(), _enter_tree(), _ready(), _process(), _physics_process(), and then the rest

#endregion

#region Overridden custom methods

func setup(values: Dictionary):
	if values.is_empty():
		values["ERROR"]="ERROR"
	name_t.text=values.keys()[0]
	role.text=values[name_t.text]
	return

#endregion

#region New Methods

# New methods here

#endregion

#endregion

#region Subclasses

# Subclasses here

#endregion
