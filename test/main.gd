extends Node

@export var main_screen: Screen
@export var main_background: Control
## All the splash screens to show, and the order to show them in. Add any 
## [SplashScreen] nodes you want shown at the beginning of the game. Leaving
## this blank will cause the splash screen state to be skipped.
@export var active_splash_screens: Array[SplashScreen]

var _current_splash_screen: int = 0


func _ready() -> void:
	for splash_screen in active_splash_screens:
		splash_screen.splash_complete.connect(_on_splash_complete)
	ready.connect(_on_ready)


func _on_ready() -> void:
	if active_splash_screens.size() == 0:
		_on_all_splash_screens_complete()
		return
	active_splash_screens[_current_splash_screen].show()


func _on_splash_complete() -> void:
	print(_current_splash_screen)
	active_splash_screens[_current_splash_screen].hide()
	_current_splash_screen += 1
	if _current_splash_screen < active_splash_screens.size():
		active_splash_screens[_current_splash_screen].show()
	else:
		print("Splash Screens Complete")
		_on_all_splash_screens_complete()


func _on_all_splash_screens_complete() -> void:
	UI.open_screen(main_screen)
	main_background.show()
