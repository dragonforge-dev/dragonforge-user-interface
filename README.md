[![Static Badge](https://img.shields.io/badge/Godot%20Engine-4.5.stable-blue?style=plastic&logo=godotengine)](https://godotengine.org/)
# Dragonforge User Interface
A user interface autoload singleton to handle UI screens for a game.
# Version 0.1
For use with **Godot 4.5-stable** and later.
## Dependencies
The following dependencies are included in the addons folder and are required for the template to function.
- [Dragonforge Disk (Save/Load) 0.5](https://github.com/dragonforge-dev/dragonforge-disk)
- [Dragonforge Sound 0.14.1](https://github.com/dragonforge-dev/dragonforge-sound)
- [Dragonforge State Machine 0.4](https://github.com/dragonforge-dev/dragonforge-state-machine)
# Installation Instructions
1. Copy all the folders from the `addons` folder into your project's `addons` folder.
2. In your project go to **Project -> Project Settings...**
3. Select the **Plugins** tab.
4. Check the **On checkbox** under **Enabled** for **Dragonforge Disk** (must be enabled **before** the Sound plugin or you will get errors).
5. Check the **On checkbox** under **Enabled** for **Dragonforge Sound**.
6. Check the **On checkbox** under **Enabled** for **Dragonforge User Interface**
7. Press the **Close** button.
8. Save your project.

# Usage Instructions
This is intended to be used with the - [Dragonforge Game Template](https://github.com/dragonforge-dev/dragonforge-game-template)
## Testing
Pressing the Run Project (F5) button will run the test project. All the splash screens will display. You will then get two screens, each with a button that loads the other screen.
## Splash Screens
Three splash screens are included in the `addons` folder under `splash_screens`. Two animated Godot logo video versions, and the Dragonforge Dev splash screen using an **AnimationPlayer**. All the other examples can be found in `res://ui/splash_screens/` under their respectively named folders. All splash screen assets are stored with their splash screen to make copying, adding, or removing screens easy to do from a project.

# Class Descriptions

## Screen
A default screen that is tracked by the UI autoload. All buttons in the screen are automatically hooked up to play the click sound set up in the Sound autoload. It also allows you to set a default control for when the screen loads, and tracks the last button pressed for when a player returns to this screen.
#### Export Variables
- `default_focused_control: Control` The control that receives focus by default when starting.

## Splash Screen
A screen for display upon starting the game. Typically either plays a video or an animation. The sound can optionally be muted if you want to play one contiguous opening theme.
#### Signals
- `signal splash_complete` Indicates that this splash screen is done playing. Tied directly to the display_time export variable.
#### Export Variables
- `mute_sound: bool = false` Check this to turn off splash screen sound to allow the playing of theme music on startup.
- `display_time: float = 1.0` The amount of time the splash screen should be shown.
- `video_player: VideoStreamPlayer` If a **VideoStreamPlayer** is placed here, it will automatically be run. Ignored if left blank.
- `animation_player: AnimationPlayer` If an **AnimationPlayer** is placed here, it will automatically play the "Show" animation. Ignored if left blank.

## UI (Autoload)
The **UI** autoload scene.
#### Public Functions
- `register_screen(screen: Screen) -> void` Registers a new screen to the UI autoload ensuring only one screen at a time is open. (Used by the **Screen** object.)
- `open_screen(screen: Screen) -> void` Opens a new **Screen** and closes the currently open screen.
- `open_screen_by_name(screen_name: String) -> void` Opens a new **Screen** by the screen's name and closes the currently open screen.
- `open_pop_up_by_name(screen_name: String) -> void` Opens a new **Screen** by the screen's name without closing the currently open screen.
- `close_screen_by_name(screen_name: String) -> void` Closes a **Screen** by the screen's name.
