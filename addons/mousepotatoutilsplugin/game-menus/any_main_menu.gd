# GDScript script template by Mouse Potato Does Stuff
# @tool
# @icon
# @static_unload
class_name AnyMainMenu
extends SwappableMenu

## Insert doc comment here.

#region SEC (Signals, Enums, and Constants)
# Signals
signal sig_minigame

# Enums

# Constants
#endregion

#region Variables
# Static variables

# @export variables
@export var is_minigame:=false
@export var title: String
@export var options_button:Button
@export var options_menu:SwappableMenu

# Other variables

# @onready class variables
@onready var minigame: Button = $VBoxContainer/Minigame

#endregion

#region Methods

#region Overridden Built-in Methods

# _init(), _enter_tree(), _ready(), _process(), _physics_process(), and then the rest

func _ready() -> void:
	if options_menu==null:
		options_button.hide()
	else:
		options_button.show()
	if is_minigame:
		minigame.hide()
	else:
		minigame.show()
	return

#endregion

#region Overridden custom methods
# Overridden custom methods here
#endregion

#region New Methods

func _on_options_pressed() -> void:
	self.sig_swap.emit(options_menu,true)

func _on_exit_pressed() -> void:
	self.sig_close.emit()

func _on_minigame_pressed() -> void:
	sig_minigame.emit()

func _on_play_pressed() -> void:
	sig_play.emit()

#endregion

#endregion

#region Subclasses
# Subclasses here
#endregion
