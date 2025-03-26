/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0A64EB24
/// @DnDDisabled : 1
/// @DnDArgument : "expr" "keyboard_check(vk_right) - keyboard_check(vk_left)"
/// @DnDArgument : "var" "move_x"


/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7B90AD5D
/// @DnDArgument : "expr" "keyboard_check(vk_left)||gamepad_button_check(0,gp_padl)||(gamepad_axis_value(0,gp_axislh) < -0.2)"
/// @DnDArgument : "var" "controls_input_left"
controls_input_left = keyboard_check(vk_left)||gamepad_button_check(0,gp_padl)||(gamepad_axis_value(0,gp_axislh) < -0.2);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6FD14D1D
/// @DnDArgument : "expr" "keyboard_check(vk_right)||gamepad_button_check(0,gp_padr)||(gamepad_axis_value(0,gp_axislh) > 0.2)"
/// @DnDArgument : "var" "controls_input_right"
controls_input_right = keyboard_check(vk_right)||gamepad_button_check(0,gp_padr)||(gamepad_axis_value(0,gp_axislh) > 0.2);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5022BAFC
/// @DnDArgument : "expr" "controls_input_right - controls_input_left"
/// @DnDArgument : "var" "move_x"
move_x = controls_input_right - controls_input_left;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1B94D4C3
/// @DnDArgument : "expr" "move_x * walk_speed "
/// @DnDArgument : "var" "move_x"
move_x = move_x * walk_speed ;

/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
/// @DnDVersion : 1
/// @DnDHash : 01758B57
/// @DnDArgument : "msg" "move_x"
show_debug_message(string(move_x));

/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 6EB179FC
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "2"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "collision_tilemap"
var l6EB179FC_0 = instance_place(x + 0, y + 2, [collision_tilemap]);if ((l6EB179FC_0 > 0)){	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 68FE3A6F
	/// @DnDParent : 6EB179FC
	/// @DnDArgument : "var" "move_y"
	move_y = 0;

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
	/// @DnDVersion : 1
	/// @DnDHash : 19B901A5
	/// @DnDParent : 6EB179FC
	var l19B901A5_0;l19B901A5_0 = keyboard_check_pressed(vk_space);if (l19B901A5_0){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 74495B31
		/// @DnDParent : 19B901A5
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 14313985
		/// @DnDParent : 19B901A5
		/// @DnDArgument : "soundid" "Jump"
		/// @DnDSaveInfo : "soundid" "Jump"
		audio_play_sound(Jump, 0, 0, 1.0, undefined, 1.0);}

	/// @DnDAction : YoYo Games.Gamepad.If_Gamepad_Button_Pressed
	/// @DnDVersion : 1.1
	/// @DnDHash : 40389F66
	/// @DnDParent : 6EB179FC
	/// @DnDArgument : "btn" "gp_face1"
	var l40389F66_0 = 0;var l40389F66_1 = gp_face1;if(gamepad_is_connected(l40389F66_0) && gamepad_button_check_pressed(l40389F66_0, l40389F66_1)){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 25655EA3
		/// @DnDParent : 40389F66
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 19D9D7BC
		/// @DnDParent : 40389F66
		/// @DnDArgument : "soundid" "Jump"
		/// @DnDSaveInfo : "soundid" "Jump"
		audio_play_sound(Jump, 0, 0, 1.0, undefined, 1.0);}}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 177771E4
else{	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 32BF91A5
	/// @DnDParent : 177771E4
	/// @DnDArgument : "var" "move_y"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "10"
	if(move_y < 10){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2EE67E01
		/// @DnDParent : 32BF91A5
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "move_y"
		move_y += 1;}}

/// @DnDAction : YoYo Games.Movement.move_and_collide
/// @DnDVersion : 1
/// @DnDHash : 6FE2602D
/// @DnDApplyTo : {obj_player}
/// @DnDArgument : "xvel" "move_x"
/// @DnDArgument : "yvel" "move_y"
/// @DnDArgument : "maxxmove" "walk_speed"
/// @DnDArgument : "maxymove" "jump_speed"
/// @DnDArgument : "object" "collision_tilemap"
move_and_collide(move_x, move_y, collision_tilemap,4,0,0,walk_speed,jump_speed);

/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 58B804E1
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "2"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "collision_tilemap_death_zone"
var l58B804E1_0 = instance_place(x + 0, y + 2, [collision_tilemap_death_zone]);if ((l58B804E1_0 > 0)){	/// @DnDAction : YoYo Games.Rooms.Restart_Room
	/// @DnDVersion : 1
	/// @DnDHash : 622F4173
	/// @DnDParent : 58B804E1
	room_restart();}