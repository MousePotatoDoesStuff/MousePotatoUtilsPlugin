# GDScript script template by Mouse Potato Does Stuff
# @tool
# @icon
# @static_unload
class_name MultipleInputKeybind
extends MpupUiObjectListItem

## Insert doc comment here.

#region SEC (Signals, Enums, and Constants)

# Signals
signal sig_remove_button(name:String)

# Enums

# Constants

#endregion

#region Variables

# Static variables

# @export variables
@export var name_t: RichTextLabel
@export var existing: MpupUiButtonList
@export var new_role: Button

# Other variables

# @onready class variables

#endregion

#region Methods

#region Overridden Built-in Methods

# _init(), _enter_tree(), _ready(), _process(), _physics_process(), and then the rest

#endregion

#region Overridden custom methods

func setup(values: Dictionary):
	self.name_t.name=values.get("action","ERROR")
	self.name_t.text=self.name_t.name
	var existing_bindings:Dictionary[String,String]=values.get("buttons",{})
	self.existing.set_elements(existing_bindings)
	toggle_adding(false)
	return

#endregion

#region New Methods

func toggle_adding(is_adding:bool):
	new_role.text="Press key" if is_adding else "Add new key"

func remove_button(name:String):
	self.existing.remove_element(name)
	sig_remove_button.emit(name)

func add_button(name:String,display_name:String)->bool:
	return self.existing.add_element(name,display_name)

#endregion

#endregion

#region Subclasses

# Subclasses here

#endregion
