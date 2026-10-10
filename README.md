# entities-godot-mujoco-demo

A Godot scene of rigid boxes dropping onto a floor, simulated by the native MuJoCo physics server extension.

## What it is for

The scene uses only stock rigid and static bodies, with the project's 3D physics engine set to the extension from [entities-godot-mujoco](https://github.com/V-Sekai-fire/entities-godot-mujoco). It shows that extension running ordinary engine physics without custom nodes.

## Run

    godot --path .

The extension binaries in `addons/mujoco` come from the `entities-godot-mujoco` build. The tracked binaries are for Windows x86_64 only, so other platforms need their own build of the extension.

## Licence

MIT. See [LICENSE](LICENSE).
