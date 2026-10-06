extends Node3D
## ON READY
@onready var cat_1_anim: AnimatedSprite3D = $SubViewport/Cat_1/AnimatedSprite3D



@onready var soldier_speech_bubble: SpeechBubble3D = $SubViewport/soldier/soldier_SpeechBubble
@onready var player_speech_bubble_1: SpeechBubble3D = $SubViewport/Player/Player_SpeechBubble_1
@onready var cat_speech_bubble_3d: SpeechBubble3D = $SubViewport/Cat_1/Cat_SpeechBubble3D
@onready var doc_speech_bubble: SpeechBubble3D = $SubViewport/Doctor/Doc_SpeechBubble
@onready var pinkhairNPC_speechbubble_3d: SpeechBubble3D = $SubViewport/PinkHairNPC/pinkhairNPC_speechbubble3D

#### Tooltips
@onready var cat_exclamation_point: RichText3D = $SubViewport/Cat_1/Cat_ExclamationPoint
@onready var cat_press_e_to_interact: RichText3D = $"SubViewport/Cat_1/Cat_Press E to Interact"

@onready var doc_eavesdrop_tooltip: RichText3D = $SubViewport/Doctor/doc_Eavesdrop_Tooltip
@onready var doc_alert_mark: RichText3D = $SubViewport/Doctor/doc_Alert_Mark

##INFO Interaction Booleans
@export var soldier_Listen: bool = false
@export var Cat_Listen_1: bool = false
@export var doc_listen_1: bool = false
@export var pinkhairNPC_listen_1: bool = false
##Dialogue etc
var catline: int = 1
var playerline: int = 1
var npc1_line: int = 1
var doc_line: int = 1
var soldier_line: int = 1 
var pinkhairNPC_line: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	doc_eavesdrop_tooltip.visible = false
	cat_press_e_to_interact.visible = false
	soldier_Listen = false
	Cat_Listen_1 = false
	pinkhairNPC_listen_1 = false
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
			
				player_speech_bubble_1.say_text("I don’t feel myself today.",1)
				playerline += 1
				print(playerline)
				#await get_tree().create_timer(2.0).timeout
				
			2:
				player_speech_bubble_1.say_text("And why is everybody else acting so strangely?",1)
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
				Cat_Listen_1 = false
			
### SOLDIER DIALOGUE
	#if soldier_Listen == true and interact == true:
		#match soldier_line:
			#1:
				#soldier_speech_bubble.say_text("going down this afternoon…",1)
				#soldier_line += 1
				#playerline += 1
			#_:
				#player_speech_bubble_1.say_text("It’s all happening this afternoon!",1)
				#playerline += 1
				#catline += 1
				
				
##### DOC DIALOGUE	
	if doc_listen_1 == true and interact == true:
		
		match doc_line:
			1:
				doc_speech_bubble.say_text("…we’re about to reach totality…",1)
				doc_line+=1
			2:
				player_speech_bubble_1.say_text("Totality?")
				doc_line+=1
				playerline+=1
			3:
				player_speech_bubble_1.say_text("This is big, bigger than both of us.",2)
				playerline+=1
				doc_line +=1 
			4:
				soldier_speech_bubble.say_text("going down this afternoon…",1)
				soldier_line += 1
				playerline += 1
				doc_line += 1
				
			_:
				player_speech_bubble_1.say_text("It’s all happening this afternoon!",1)
				playerline += 1
				catline += 1
				doc_line += 1
				doc_listen_1 = false
				doc_eavesdrop_tooltip.visible = false
				doc_alert_mark.visible = false
	#### PINK HAIR NPC!
	if pinkhairNPC_listen_1 == true and interact == true:
		match pinkhairNPC_line:  
			1:
				pinkhairNPC_speechbubble_3d.say_text("This monolith was not here yesterday.",2)
				pinkhairNPC_line +=1 
				
			2:
				pinkhairNPC_speechbubble_3d.say_text("none of this makes sense.",1)
				pinkhairNPC_line +=1
				
			_:
				player_speech_bubble_1.say_text("...",3)
				pinkhairNPC_listen_1 = false
		
	

func NPC1_Area_Entered_(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	#if body.is_in_group("Player"):
		#NPC_1_Listen = true

	pass # Replace with function body.


func _Cat_On_Area_Entered(body: Node3D) -> void:
	
	#var cat_tween = create_tween()
	if body.is_in_group("Player"):
		cat_exclamation_point.visible = false
		cat_press_e_to_interact.visible = true
		Cat_Listen_1 = true
	
func _on_cat_area_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		cat_exclamation_point.visible = true
		cat_press_e_to_interact.visible = false
		Cat_Listen_1 = false

	
		
	#pass # Replace with function body.


func _on_doc_area_entered(body: Node3D) -> void:
	
	if body.is_in_group("Player"):
		doc_eavesdrop_tooltip.visible = true
		doc_alert_mark.visible = false
		doc_listen_1 = true
	
	
	#pass # Replace with function body.


func _on_doc_area_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		doc_eavesdrop_tooltip.visible = false
		doc_alert_mark.visible = true
		doc_listen_1 = false
	#pass # Replace with function body.


func _pinkhairNPC_area_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		pinkhairNPC_listen_1 = true
		
	#pass # Replace with function body.


func pinkhairNPC_area_Exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		pinkhairNPC_listen_1 = false
#	pass # Replace with function body.
