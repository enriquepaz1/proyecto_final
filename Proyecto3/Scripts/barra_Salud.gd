extends CanvasLayer

export(NodePath) var playaer_node
onready var player = get_node(playaer_node)

func _process(delta):
	$TextureProgress.value = player.life 
	

