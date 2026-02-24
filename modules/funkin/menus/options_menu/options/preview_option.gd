class_name PreviewOption extends Option


@export_file('*.tscn') var preview_path: String = ""
@export var current_preview: Node
var packed: PackedScene
var current: Node


func _ready() -> void:
	if not preview_path.is_empty():
		packed = load(preview_path)


func _focus() -> void:
	# if u get this... how????
	if is_instance_valid(current):
		return
	if not is_instance_valid(packed):
		return

	current = packed.instantiate()
	current_preview.add_child(current)


func _unfocus() -> void:
	if is_instance_valid(current):
		current.queue_free()
