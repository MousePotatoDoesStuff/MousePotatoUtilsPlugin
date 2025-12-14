extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_mpup_ui_dict_element_updated() -> void:
	print_debug(self.orig_dict)
