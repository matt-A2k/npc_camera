# NPC Camera 2D
A node for Godot which can check if the player is in the field of view of a NPC

## Demo
In the demo below, when the NPC sees the player, its field of view area changes color to indicate this.
### [Click here](https://matt-a2k.itch.io/npc-camera-2d-demo) for online demo on itch.io

### How to play
  1) Arrow keys move the player and the ```,``` and ```.``` keys rotate the player.
  2) WASD move the NPC and ```Q``` and ```E``` rotate the NPC.

## How to use
### Installing the plugin in Godot
1) In the FileSystem dock in the lower left corner, right click on the ```res://``` folder, click on 'Create New' then click 'Folder'.
2) When prompted for a name, type 'addons' and click OK.
3) Download the addon from github, extract it on your computer then rename it from 'npc_camera-main' to 'npc_camera'.
4) Move the npc_camera folder into the 'addons' folder in your Godot project folder from within your computer's file explorer.
5) Click on ```Project```>```Project Settings...``` at the top left of the Godot window.
6) When the window appears, click on the Plugins tab and check the box under Enabled for the 'NPC Camera 2D' plugin then click close.
### Setting up NPC Camera 2D for the NPC
1) In the Scene tree, select your NPC and add a new NPCCamera2D node to it as a child.
2) Click on the NPCCamer2D node that was just added and adjust the values to whatever you want in the inspector on the right.
3) Add a CollisionPolygon2D node as a child of the player.
4) With the CollisionPolygon2D node selected in the scene tree, click around the player to place points and press enter when done.
5) Click on the NPCCamera2D node that you added and in the inspector, set the target to the CollisionPolygon2D child node of the player.
### gdscript
1) The NPC can check if it is seeing the player using ```$NPCCamera2D.is_viewing()``` which returs a boolean
2) The near and far colors of the view area can be changed using ```$NPCCamera2D.near_color``` and ```$NPCCamera2D.far_color```.
   For example, the code below sets both the near and far colors to red with an opacity of 1.0 for the near color and 0.2 for the far color.
  ```$NPCCamera2D.near_color = Color(1.0, 0.0, 0.0, 1.0)```
	```$NPCCamera2D.far_color = Color(1.0, 0.0, 0.0, 0.2)```
## Limitiaions
This addon only detects the verticies of the CollisionPolygon2D not the edges. To work around this problem you can just add verticies to the center of the edges if they are too long.
