extends Node3D

@onready var cam = $Camera3D
@onready var  skel = $rigtest/Armature/Skeleton3D


var cam_theta = 0.0
const cam_radius = 10.0

# Called when the node enters the scene tree for the first time.
func _ready():
	#var skel = $rigtest/Armature/Skeleton3D
	#print_debug(skel.get_bone_count())
	for x  in skel.get_bone_count() :
		print_debug(skel.get_bone_name(x))
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cam_theta += delta
	var xi = cam_theta + 0.5 * PI
	cam.position = Vector3(10.0 * cos(cam_theta), 5.0,10.0 * sin(cam_theta))
	cam.quaternion = Quaternion(0.0,cos(xi*0.5),0.0,sin(xi*0.5))
	
	for x  in skel.get_bone_count() :
		if "sphere" == skel.get_bone_name(x) :
			#print_debug("foo")	
			var p = Quaternion(cos(xi),0.0,0.0,sin(xi))
			var q = Quaternion(0.0,cos(xi),0.0,sin(xi))
			var r = Quaternion(0.0,0.0,cos(xi),sin(xi))
			
			skel.set_bone_pose_rotation(x,p * q * r)
			
		if "arm" == skel.get_bone_name(x) :
			var p = Quaternion(cos(sin(xi) + PI * 0.5),0.0,0.0,sin(sin(xi)+ PI * 0.5) ) 
			skel.set_bone_pose_rotation(x,p)
