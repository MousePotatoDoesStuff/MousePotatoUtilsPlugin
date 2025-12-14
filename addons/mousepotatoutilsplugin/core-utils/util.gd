# GDScript script template by Mouse Potato Does Stuff
# @tool
# @icon
# @static_unload
# class_name Util
# extends Object

## Insert doc comment here.

#region SEC (Signals, Enums, and Constants)

# Signals

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

#region Static Methods
# _static_init() first, then others

static func find_children_of_type(parent:Node,type:Variant,
recursion_depth:int,include_internal:bool)->Array:
	var layer:Array[Node]=parent.get_children()
	var res:Array=[]
	while not layer.is_empty():
		for cur in layer:
			if is_instance_of(cur,type):
				res.append(cur)
		var new_layer:Array[Node]=[]
		recursion_depth-=1
		if recursion_depth==0:
			break
		for cur in layer:
			new_layer.append_array(cur.get_children())
		layer=new_layer
	return res

#endregion

#region Overridden Built-in Methods

# _init(), _enter_tree(), _ready(), _process(), _physics_process(), and then the rest

#endregion

#region Overridden custom methods

# Overridden custom methods here

#endregion

#region New Methods

# New methods here

#endregion

#endregion

#region Subclasses

# Subclasses here

#endregion
