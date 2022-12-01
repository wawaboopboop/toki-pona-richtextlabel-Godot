tool
extends EditorPlugin


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	# Add the new type with a name, a parent type, a script and an icon.
	add_custom_type("TokiPonaRichTextLabel", "RichTextLabel", preload("toki_pona_richtextlabel.gd"), preload("icon.svg"))



func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	# Always remember to remove it from the engine when deactivated.
	remove_custom_type("TokiPonaRichTextLabel")
