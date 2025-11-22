extends Node

var _screens: Dictionary[String, Screen]
var _current_screen: Screen


func register_screen(screen: Screen) -> void:
	_screens[screen.name] = screen


## Call to open a new screen.
func open_screen(screen: Screen) -> void:
	if _current_screen:
		_current_screen.hide()
	_current_screen = screen
	_current_screen.show()


## Call to open a new screen by the screen's name.
func open_screen_by_name(screen_name: String) -> void:
	if _current_screen:
		_current_screen.hide()
	_current_screen = _screens[screen_name]
	_current_screen.show()
