extends Node

signal gesture_detected(gesture_name: String)

var udp := PacketPeerUDP.new()
const PORT := 9001

func _ready():
	udp.bind(PORT)
	
func _process(_delta):
	while udp.get_available_packet_count() > 0:
		var packet = udp.get_packet()
		var gesture = packet.get_string_from_utf8().strip_edges()
		gesture_detected.emit(gesture)

func _unhandled_input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		match event.keycode:
			KEY_1: gesture_detected.emit("feed")
			KEY_2: gesture_detected.emit("pet")
			KEY_3: gesture_detected.emit("play")
			KEY_4: gesture_detected.emit("sleep")
