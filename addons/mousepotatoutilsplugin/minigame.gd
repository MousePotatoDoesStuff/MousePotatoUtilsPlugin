# GDScript script template by Mouse Potato Does Stuff
# @tool
# @icon
# @static_unload
class_name Minigame
extends Node

## Insert doc comment here.

# Signals
signal sig_start
signal sig_end(data:Dictionary)

# Enums

# Constants

# ------------------------------------------------------------------------------------------------ #
# Variables
# ------------------------------------------------------------------------------------------------ #
# Static variables

# @export variables

# Other variables

# @onready class variables

# ------------------------------------------------------------------------------------------------ #
# Static methods
# starting with _static_init()
# ------------------------------------------------------------------------------------------------ #

# ------------------------------------------------------------------------------------------------ #
# Overridden built-in methods:
# _init(), _enter_tree(), _ready(), _process(), _physics_process(), and then the rest
# ------------------------------------------------------------------------------------------------ #

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		sig_end.emit({"result":"a winner is you?"})
# ------------------------------------------------------------------------------------------------ #
# Overridden custom methods
# ------------------------------------------------------------------------------------------------ #

# ------------------------------------------------------------------------------------------------ #
# New methods
# ------------------------------------------------------------------------------------------------ #
func setup_game(data:Dictionary={}):
	push_error("Minigame %s setup not implemented!" % [self.name])

func start_game(data:Dictionary={}):
	push_error("Minigame %s start not implemented!" % [self.name])

func end_game()->void:
	push_error("Minigame %s end not implemented!" % [self.name])
	sig_end.emit({"error":"Minigame %s end not implemented!"})
# ------------------------------------------------------------------------------------------------ #
# Subclasses
# ------------------------------------------------------------------------------------------------ #
