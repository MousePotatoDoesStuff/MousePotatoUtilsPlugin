class_name QuickMenu extends SwappableMenu

func exit_to_menu()->void:
	sig_endgame.emit()
