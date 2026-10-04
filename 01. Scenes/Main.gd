extends Node3D
## ON READY
@onready var npc_1_speech_bubble: SpeechBubble3D = $SubViewport/NPC_1/NPC1_SpeechBubble

##INFO Interaction Booleans
var NPC_1_Listen: bool 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	NPC_1_Listen = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass

func NPC1_Area_Entered_(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("Player"):
		NPC_1_Listen = true
	
	if NPC_1_Listen == true:
		npc_1_speech_bubble.say_text("HELLO I AM A PERSON!")

	
	
	#pass # Replace with function body.
