# entities-godot-mujoco-demo

Stock Godot RigidBody3D boxes dropping onto a floor, simulated by the native MuJoCo PhysicsServer3DExtension.

## What this is

A minimal scene -- a static floor and a few `RigidBody3D` boxes -- that uses no
custom nodes. The physics comes from [`entities-godot-mujoco`](https://github.com/V-Sekai-fire/entities-godot-mujoco),
a `PhysicsServer3DExtension` backed by MuJoCo linked natively, selected in
`project.godot` as the `MuJoCo` 3D physics engine. Godot creates the bodies and
shapes; the extension builds them into an `mjSpec`, compiles, and steps
`mj_step`, handing each body's transform back so the node follows.

## Run

    godot --path .

The extension binaries live in `addons/mujoco/bin/` (`libgodot_mujoco...dll` plus
`libmujoco.dll`). Build them from `entities-godot-mujoco` and copy them here, or
take them from that repo's CI.

## Credit

V-Sekai-fire and chibifire.
