# GDScript script template by Mouse Potato Does Stuff
# @tool
# @icon
# @static_unload
class_name MpupUiButtonList
extends BoxContainer

## Insert doc comment here.

#region SEC (Signals, Enums, and Constants)

# Signals
signal clicked(name:String)

# Enums

# Constants

#endregion

#region Variables

# Static variables

# @export variables
@export var debug:bool=true

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

func testprint(test: String) -> void:
	print_debug(test)

func onresize():
	for child in self.get_children():
		var node:Control=child
		node.size.x=self.size.x
	pass

func clear_elements():
	for child in self.get_children():
		child.queue_free()

func contains_name(name:String)->bool:
	var child:Button=self.get_node_or_null(name)
	return child!=null

func contains_display_name(name:String)->bool:
	for child in self.get_children():
		if child.text==name:
			return true
	return false

func remove_element(name:String):
	var child:Button=self.get_node_or_null(name)
	if child==null:
		return
	child.queue_free()

func add_element(name:String,display_name:String)->bool:
	var button:Button=self.get_node_or_null(name)
	var is_element_new:=false
	if button==null:
		button=Button.new()
		button.name=name
		button.pressed.connect(clicked.emit.bind(name))
		is_element_new=true
	button.text=display_name
	self.add_child(button)
	button.show()
	return is_element_new

func set_elements(names:Dictionary[String,String],delete_old:bool=true) -> void:
	if delete_old:
		clear_elements()
	for name in names:
		self.add_element(name,names[name])

#endregion

#endregion

#region Subclasses

# Subclasses here

#endregion
