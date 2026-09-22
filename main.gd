extends Node3D

# Everything here is stock Godot: StaticBody3D, RigidBody3D, BoxShape3D. The
# physics comes from the native MuJoCo PhysicsServer3DExtension, selected in
# project.godot as the "MuJoCo" 3D physics engine.

func _ready() -> void:
	_build_scene()
	_make_floor()
	for i in range(4):
		_drop_box(Vector3(i * 0.35 - 0.5, 2.0 + i * 0.7, (i % 2) * 0.2))

func _make_floor() -> void:
	var body := StaticBody3D.new()
	var box := BoxShape3D.new()
	box.size = Vector3(6.0, 0.4, 6.0)
	var col := CollisionShape3D.new()
	col.shape = box
	body.add_child(col)
	var mesh := MeshInstance3D.new()
	var bm := BoxMesh.new()
	bm.size = box.size
	mesh.mesh = bm
	mesh.material_override = _mat(Color(0.3, 0.32, 0.36))
	body.add_child(mesh)
	body.position = Vector3(0.0, -0.2, 0.0)
	add_child(body)

func _drop_box(pos: Vector3) -> void:
	var body := RigidBody3D.new()
	var box := BoxShape3D.new()
	box.size = Vector3(0.5, 0.5, 0.5)
	var col := CollisionShape3D.new()
	col.shape = box
	body.add_child(col)
	var mesh := MeshInstance3D.new()
	var bm := BoxMesh.new()
	bm.size = box.size
	mesh.mesh = bm
	mesh.material_override = _mat(Color(0.85, 0.5, 0.35))
	body.add_child(mesh)
	body.position = pos
	add_child(body)

func _mat(c: Color) -> StandardMaterial3D:
	var m := StandardMaterial3D.new()
	m.albedo_color = c
	m.roughness = 0.7
	return m

func _build_scene() -> void:
	var we := WorldEnvironment.new()
	var env := Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color(0.09, 0.1, 0.13)
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color(0.5, 0.55, 0.65)
	env.ambient_light_energy = 0.7
	we.environment = env
	add_child(we)
	var light := DirectionalLight3D.new()
	light.rotation = Vector3(-1.0, 0.6, 0.0)
	add_child(light)
	var cam := Camera3D.new()
	cam.position = Vector3(4.5, 3.0, 5.0)
	cam.fov = 55.0
	add_child(cam)
	cam.look_at(Vector3(0.0, 0.5, 0.0), Vector3.UP)
