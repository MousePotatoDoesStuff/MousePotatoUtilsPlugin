# GDScript script template by Mouse Potato Does Stuff
# @tool
# @icon
# @static_unload
class_name MenuManager
extends SwappableMenu

## Insert doc comment here.

#region SEC (Signals, Enums, and Constants)

# Signals

# Enums

# Constants

#endregion

#region Variables

# Static variables
var menus:Dictionary[String,SwappableMenu]
var menu_stack:Array[SwappableMenu]=[]
var game:Minigame

# @export variables
@export var cur_menu:SwappableMenu=null
@export var quick_menu:SwappableMenu
@export var game_parent_node:Node
@export var game_scene_template:PackedScene
@export var child_game_scene_templates:Dictionary[String,PackedScene]
@export var default_values:Dictionary
@export_category("toggles")
@export var do_discard_stack_on_reopen:=false
@export var do_separate_submenu_data:=false

# Other variables

# @onready class variables

#endregion

#region Methods

#region Overridden Built-in Methods
# _init(), _enter_tree(), _ready(), _process(), _physics_process(), and then the rest

func _ready() -> void:
	var managers:Array[MenuManager]=[]
	if quick_menu!=null:
		quick_menu.sig_close.connect(before_endgame)
	setup_child_swappable_menus()
	if game_parent_node!=null:
		set_game_parent_scene()
	if cur_menu and cur_menu.name in menus:
		cur_menu=menus[cur_menu.name]
		cur_menu.show()
	return

#endregion

#region Overridden custom methods

func enter(data:Dictionary)->void:
	self.exported_data.merge(data,true)
	self.show()
	if do_discard_stack_on_reopen:
		while self.menu_stack:
			self.close()
	self.open(cur_menu)
	self.show()
	return


#endregion

#region New Methods

func setup_one_child_swappable_menu(menu:SwappableMenu):
	menu.hide()
	self.menus[menu.name]=menu
	menu.sig_swap.connect(self.manage_open)
	menu.sig_open_raw.connect(self.manage_open_raw)
	menu.sig_close.connect(self.manage_close)
	menu.sig_play.connect(self.play)
	menu.scene_parent=self.scene_parent
	return

func setup_child_swappable_menus():
	var menus:Array[SwappableMenu]=[]
	for child in self.get_children():
		if not is_instance_of(child,SwappableMenu):
			continue
		menus.append(child)
		setup_one_child_swappable_menu(child)
	setup_child_menu_managers(menus)
	return

func setup_one_child_menu_manager(manager:MenuManager):
	var c_name:String=manager.name
	if c_name in child_game_scene_templates:
		var template:=child_game_scene_templates[c_name]
		if template==null:
			push_error("TEMPLATE CANNOT BE NULL!")
		manager.game_scene_template=template
	return

func setup_child_menu_managers(menus:Array[SwappableMenu]):
	for menu in menus:
		if not is_instance_of(menu,MenuManager):
			continue
		setup_one_child_menu_manager(menu)
	return

func set_game_parent_scene():
	for child in self.get_children():
		if not is_instance_of(child,MenuManager):
			continue
		var manager:MenuManager=child
		manager.game_parent_node=self.game_parent_node
		manager.set_game_parent_scene()

func manage_open_raw(new_menu:String,stack_up:bool=false):
	if new_menu not in self.menus:
		var arr:Array[String]
		arr=[
			new_menu,
			self.get_path()
		]
		push_warning("Menu %s not present in %s!" % arr)
		return
	self.manage_open(self.menus[new_menu],stack_up)

func manage_open(new_menu:SwappableMenu,stack_up:bool=false)->void:
	self.cur_menu.exit()
	if stack_up:
		self.menu_stack.append(self.cur_menu)
	if new_menu==null:
		push_error("Missing menu!")
	else:
		self.cur_menu=new_menu
	self.enter_cur_menu()
	return

func enter_cur_menu():
	var data:Dictionary=self.exported_data
	if self.do_separate_submenu_data:
		var data_group:=self.exported_data.get_or_add("branches",{})
		data=data_group.get_or_add(cur_menu.name,{})
	self.cur_menu.enter(data)

func exit_cur_menu():
	var data:Dictionary=self.exported_data
	if self.do_separate_submenu_data:
		var data_group:=self.exported_data.get_or_add("branches",{})
		data=data_group.get_or_add(cur_menu.name,{})
	data.merge(self.cur_menu.exported_data)
	self.cur_menu.exit()

func manage_close()->void:
	self.exit_cur_menu()
	if self.menu_stack:
		self.cur_menu=self.menu_stack.pop_back()
		self.enter_cur_menu()
		return
	if sig_close.get_connections():
		self.enter_cur_menu()
		self.close()
		return
	get_tree().quit()

func play():
	self.manage_open(quick_menu,true)
	print_debug(self.get_path())
	if self.game_scene_template==null:
		var path:=self.get_path()
		push_error("%s missing game scene template!" % [path])
		return
	assert(self.game_parent_node)
	var test:=self.game_scene_template.instantiate()
	if not is_instance_of(test,Minigame):
		push_error("Minigame node must inherit Minigame class!")
	game=test
	game.setup_game(self.exported_data)
	game.start_game(self.exported_data)
	game.sig_end.connect(end_game)
	self.game_parent_node.add_child(game)

func before_endgame():
	if game!=null:
		game.end_game()
	else:
		end_game()

func end_game(data: Dictionary={}) -> void:
	self.cur_menu.exported_data.merge(data)
	manage_close()
	# var score:int=data["score"]
	# adjust_leaderboard("min_score",false,score)
	# adjust_leaderboard("max_score",true,score)
	# exported_data["random"]+=0
	self.game.queue_free()
	print_debug(self.exported_data)
	# main_menu.display(exported_data)

#endregion

#endregion

#region Subclasses

# Subclasses here

#endregion
