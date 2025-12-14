# GDScript script template by Mouse Potato Does Stuff
# @tool
# @icon
# @static_unload
class_name GameManager
extends MenuManager

## Insert doc comment here.

#region SEC (Signals, Enums, and Constants)

# Signals

# Enums

# Constants

#endregion

#region Variables

# Static variables

# @export variables
@export var minigame_test:MenuManager

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

func open_minigame_menu():
	assert(minigame_test)
	self.open(minigame_test,true)

#endregion

#endregion

#region Subclasses

# Subclasses here

#endregion
