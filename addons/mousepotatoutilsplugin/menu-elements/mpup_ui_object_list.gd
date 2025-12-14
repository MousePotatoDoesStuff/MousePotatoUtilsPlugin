# GDScript script template by Mouse Potato Does Stuff
@tool
# @icon
# @static_unload
class_name MpupUiObjectList
extends BoxContainer

## Insert doc comment here.

#region SEC (Signals, Enums, and Constants)

# Signals
signal clicked(name:bool)
signal instruction_made(data:Dictionary)

# Enums
enum SORTMETHOD {
	NONE,
	NAME
}

enum DIRECTION {
	ASCENDING,
	DESCENDING
}

# Constants

#endregion

#region Variables

# Static variables

# @export variables
@export var element:MpupUiObjectListItem
@export var debug:bool=true
@export_category("Options")
@export var sort_method:SORTMETHOD=SORTMETHOD.NONE
@export var order:DIRECTION=DIRECTION.ASCENDING

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

func clear_elements():
	for child in self.get_children():
		child.queue_free()

func setup_element(_object:MpupUiObjectListItem):
	return

func setup(names:Dictionary[String,Dictionary],delete_old:bool=true) -> void:
	if not self.element:
		push_error("VerticalObjectList missing element!")
		return
	if delete_old:
		clear_elements()
	var name_keys:Array=names.keys()
	if self.sort_method==SORTMETHOD.NAME:
		name_keys.sort()
		if self.order==DIRECTION.DESCENDING:
			name_keys.reverse()
	for name in name_keys:
		var disp_data:Dictionary=names[name]
		var element:MpupUiObjectListItem=self.element.duplicate()
		element.name=name
		element.custom_minimum_size.x=self.size.x
		element.setup(disp_data)
		# TODO add element change/button signal
		self.add_child(element)
		setup_element(element)
		element.show()
		element.sig_button_pressed.connect(on_button_press.bind(name,element))
	return

func on_button_press(key:String, item:MpupUiButtonList):
	return


#endregion

#endregion

#region Subclasses

# Subclasses here

#endregion
