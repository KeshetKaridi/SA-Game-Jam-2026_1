extends Node3D
## ON READY
@onready var npc_1_speech_bubble: SpeechBubble3D = $SubViewport/NPC_1/NPC1_SpeechBubble
@onready var player_speech_bubble_1: SpeechBubble3D = $SubViewport/Player/Player_SpeechBubble_1

##INFO Interaction Booleans
@export var NPC_1_Listen: bool = false
@export var Cat_Listen_1: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	NPC_1_Listen = false
	Cat_Listen_1 = false
	#pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass

func NPC1_Area_Entered_(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("Player"):
		NPC_1_Listen = true
	
	if NPC_1_Listen == true:
		npc_1_speech_bubble.say_text("HELLO I AM A PERSON!")

	
	
	#pass # Replace with function body.


func _Cat_On_Area_Entered(body: Node3D) -> void:
	
	if body.is_in_group("Player"):
		Cat_Listen_1 = true
		
	if Cat_Listen_1 == true:
		#print("CaT intereacted with")

		player_speech_bubble_1.say_text("I don’t feel myself today. And why is everybody else acting so strangely?", 2)
		
		#player_speech_bubble_1.say_text("I don’t feel myself today. And why is everybody else acting so strangely?")
	#pass # Replace with function body.
