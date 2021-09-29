# 4 Player Mod for Pong with GDScript
This is a mod of the Godot GDScript pong demo found [here](https://github.com/godotengine/godot-demo-projects/tree/3.3-f9333dc/2d/pong). It primarily changes it into a 4-player free-for-all.

**PRESS SPACE TO START THE GAME!**

# A note about quality
Yeah code quality is basically non-existent. I was really just messing around here and bodging it all together. And you'll notice the control scheme for controllers is extremely bizzare. That's because at the gamedev meeting where I made this we thought it would be funny if you had to play it like Twister with everyone using one controller. So good luck.

# A note about paddles closing in on the center
I'm actually not sure this feature is any good. So if you want to turn it off just set the `MOVE_TO_CENTER_SPEED` constant in `Paddle/paddle.gd` to `0.0`.

# License
Since this is built on the aforementioned xdemo by the Godot Engine contributors, it's distributed under the same license, just with an extra copyight notice. See LICENSE.md. Please be aware there are fonts in the `Font/` folder that are distributed under a different license. These licenses are not displayed anywhere in-game so if you want to distribute a compiled binary you should probably include a text file with license information alongside it.
