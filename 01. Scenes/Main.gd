extends Node3D
## ON READY
@onready var cat_1_anim: AnimatedSprite3D = $SubViewport/Cat_1/AnimatedSprite3D



@onready var npc_1_speech_bubble: SpeechBubble3D = $SubViewport/NPC_1/NPC1_SpeechBubble
@onready var player_speech_bubble_1: SpeechBubble3D = $SubViewport/Player/Player_SpeechBubble_1
@onready var cat_speech_bubble_3d: SpeechBubble3D = $SubViewport/Cat_1/Cat_SpeechBubble3D

@onready var cat_exclamation_point: RichText3D = $SubViewport/Cat_1/Cat_ExclamationPoint
@onready var cat_press_e_to_interact: RichText3D = $"SubViewport/Cat_1/Cat_Press E to Interact"

##INFO Interaction Booleans
@export var NPC_1_Listen: bool = false
@export var Cat_Listen_1: bool = false

##Dialogue etc
var catline: int = 1
var playerline: int = 1
var npc1_line: int = 1
var npc2_line: int = 1
var npc3_line: int = 1 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cat_press_e_to_interact.visible = false
	NPC_1_Listen = false
	Cat_Listen_1 = false
	#pass
##Dialogue

	
## Idle animations:
	cat_1_anim.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var interact = Input.is_action_just_pressed("Interact")
	#### CAT DIALGUE
	if Cat_Listen_1 == true and interact == true:
		cat_press_e_to_interact.visible = false
		

		match  playerline:
			1:
			#print("CaT intereacted with")
			
				player_speech_bubble_1.say_text("I don’t feel myself today.")
				playerline += 1
				print(playerline)
				#await get_tree().create_timer(2.0).timeout
				
			2:
				player_speech_bubble_1.say_text("And why is everybody else acting so strangely?")
				#await get_tree().create_timer(4.0).timeout
				playerline += 1
				print(catline)
			3:
				player_speech_bubble_1.say_text("I can’t help feeling something’s going on. ",1)
				#await get_tree().create_timer(3.0).timeout
				playerline += 1
				print(catline)
			4:
				player_speech_bubble_1.say_text("Something beyond our comprehension.",1)
				#await get_tree().create_timer(4.0).timeout
				playerline += 1
			5:
				cat_speech_bubble_3d.say_text("mreep",2)
				catline += 1
				playerline += 1
			6:
				player_speech_bubble_1.say_text("You're Right.",1)
				playerline += 1
			
### SOLDIER DIALOGUE
	if NPC_1_Listen == true and interact == true:
		match npc3_line:
			1:
				npc_1_speech_bubble.say_text("going down this afternoon…")
				npc3_line += 1
				playerline += 1
			_:
				player_speech_bubble_1.say_text("It’s all happening this afternoon!")
				playerline += 1
				catline += 1


func NPC1_Area_Entered_(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("Player"):
		NPC_1_Listen = true

	#pass # Replace with function body.


func _Cat_On_Area_Entered(body: Node3D) -> void:
	
	#var cat_tween = create_tween()
	if body.is_in_group("Player"):
		cat_exclamation_point.visible = false
		cat_press_e_to_interact.visible = true
		Cat_Listen_1 = true
		
	
		
	#pass # Replace with function body.
