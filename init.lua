local wlRules = {
	{x = 0,  y = 0,  z = -1},
	{x = 1,  y = 0,  z = 0},
	{x = -1, y = 0,  z = 0},
	{x = 0,  y = 0,  z = 1},
	{x = 1,  y = 1,  z = 0},
	{x = 1,  y = -1, z = 0},
	{x = -1, y = 1,  z = 0},
	{x = -1, y = -1, z = 0},
	{x = 0,  y = 1,  z = 1},
	{x = 0,  y = -1, z = 1},
	{x = 0,  y = 1,  z = -1},
	{x = 0,  y = -1, z = -1},
	{x = 0,  y = -1, z = 0},
	
	{x = 0,  y = 0,  z = -2},
	{x = 2,  y = 0,  z = 0},
	{x = -2, y = 0,  z = 0},
	{x = 0,  y = 0,  z = 2},
	{x = 2,  y = 2,  z = 0},
	{x = 2,  y = -2, z = 0},
	{x = -2, y = 2,  z = 0},
	{x = -2, y = -2, z = 0},
	{x = 0,  y = 2,  z = 2},
	{x = 0,  y = -2, z = 2},
	{x = 0,  y = 2,  z = -2},
	{x = 0,  y = -2, z = -2},
	{x = 0,  y = -2, z = 0},
}

local tlRules = {
	{x = 0, y = 0, z = -1},
	{x = 0, y = 0, z = 1},
	{x = 1, y = 0, z = 0},
	{x = -1, y = 0, z = 0},
	{x = 0, y = -1, z = 0},
	{x = 0, y = 1, z = 0}
}

minetest.register_node("barriers:motor_de_off", {
	description = "Barrier motor (DE)",
	tiles = {"schlosszu.png"},
	sounds = default_stone_sounds,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.4375},
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	on_punch = function(pos, node, puncher)
		minetest.log("action", "barrier motor punched")
		minetest.set_node(pos, {name = "air"})
	end,
})

minetest.register_node("barriers:warning_light_off", {
	description = "Warning light",
	groups = {cracky = 1, level = 0},
	tiles = {"warning_light_top_off.png", "warning_light_bottom.png", "warning_light_off.png", "warning_light_off.png", "warning_light_off.png", "warning_light_off.png"},
	sounds = default_stone_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.08, -0.45, -0.18, 0.08, -0.175, 0.18},
			{-0.1, -0.5, -0.2, 0.1, -0.45, 0.2},
		},
	},
	mesecons = {
		effector = {
			rules = wlRules,
			action_on = function(pos, node)
				minetest.swap_node(pos, {name = "barriers:warning_light_on", param2 = node.param2})
			end,
		},
	},
})

minetest.register_node("barriers:warning_light_on", {
	description = "Warning light (on)",
	groups = {cracky = 1, level = 0, not_in_creative_inventory = 1},
	tiles = {{name = "warning_light_top_on.png", animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = 0.8}}, "warning_light_bottom.png", {name = "warning_light_on.png", animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = 0.8}}, {name = "warning_light_on.png", animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = 0.8}}, {name = "warning_light_on.png", animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = 0.8}}, {name = "warning_light_on.png", animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = 0.8}}},
	sounds = default_stone_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drop = "barriers:warning_light_off",
	light_source = 4,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.08, -0.45, -0.18, 0.08, -0.175, 0.18},
			{-0.1, -0.5, -0.2, 0.1, -0.45, 0.2},
		},
	},
	mesecons = {
		effector = {
			rules = wlRules,
			action_off = function(pos, node)
				minetest.swap_node(pos, {name = "barriers:warning_light_off", param2 = node.param2})
			end,
		},
	},
})

minetest.register_node("barriers:tl_cr_yr_off", {
	description = "Railroad crossing light (yellow + red)",
	groups = {cracky = 1, level = 0},
	tiles = {"tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_face_off.png"},
	sounds = default_stone_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.3, 0.7, 0.2, 0.3, 0.5},
			{-0.1, -0.1, 0.9, 0.1, 0.1, 0.7},
			{-0.125, 0.25, 0.5, -0.063, 0.188, 0.35},
			{-0.063, 0.312, 0.5, 0.061, 0.25, 0.35},
			{0.061, 0.25, 0.5, 0.123, 0.188, 0.35},
			{-0.125, -0.0445, 0.5, -0.063, -0.1065, 0.35},
			{-0.063, 0.0175, 0.5, 0.061, -0.0445, 0.35},
			{0.061, -0.0445, 0.5, 0.123, -0.1065, 0.35},
		},
	},
	digiline = {
		receptor = {},
		wire = {rules = tlRules},
		effector = {
			action = function(pos, node, channel, msg)
				if channel == minetest.get_meta(pos):get_string("channel") then
					if msg:upper() == "OFF" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_off", param2 = node.param2})
					elseif msg:upper() == "RED" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_red", param2 = node.param2})
					elseif msg:upper() == "YELLOW" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_yellow", param2 = node.param2})
					elseif msg:upper() == "GREEN" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_green", param2 = node.param2})
					elseif msg:upper() == "REDYELLOW" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_redyellow", param2 = node.param2})
					end
				end
			end,
		},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local name = sender:get_player_name()
		if minetest.is_protected(pos, name) and not minetest.check_player_privs(name, {protection_bypass = true}) then
			minetest.record_protection_violation(pos, name)
			return
		end
		if fields.channel then
			minetest.get_meta(pos):set_string("channel", fields.channel)
			minetest.get_meta(pos):set_string("state", "Off")
		end
	end,
})

minetest.register_node("barriers:tl_cr_yr_green", {
	description = "Railroad crossing light (yellow + red) (green)",
	groups = {cracky = 1, level = 0, not_in_creative_inventory = 1},
	tiles = {"tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_face_green.png"},
	sounds = default_stone_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.3, 0.7, 0.2, 0.3, 0.5},
			{-0.1, -0.1, 0.9, 0.1, 0.1, 0.7},
			{-0.125, 0.25, 0.5, -0.063, 0.188, 0.35},
			{-0.063, 0.312, 0.5, 0.061, 0.25, 0.35},
			{0.061, 0.25, 0.5, 0.123, 0.188, 0.35},
			{-0.125, -0.0445, 0.5, -0.063, -0.1065, 0.35},
			{-0.063, 0.0175, 0.5, 0.061, -0.0445, 0.35},
			{0.061, -0.0445, 0.5, 0.123, -0.1065, 0.35},
		},
	},
	digiline = {
		receptor = {},
		wire = {rules = tlRules},
		effector = {
			action = function(pos, node, channel, msg)
				if channel == minetest.get_meta(pos):get_string("channel") then
					if msg:upper() == "OFF" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_off", param2 = node.param2})
					elseif msg:upper() == "RED" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_red", param2 = node.param2})
					elseif msg:upper() == "YELLOW" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_yellow", param2 = node.param2})
					elseif msg:upper() == "GREEN" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_green", param2 = node.param2})
					elseif msg:upper() == "REDYELLOW" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_redyellow", param2 = node.param2})
					end
				end
			end,
		},
	},
	drop = "barriers:tl_cr_yr_off",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local name = sender:get_player_name()
		if minetest.is_protected(pos, name) and not minetest.check_player_privs(name, {protection_bypass = true}) then
			minetest.record_protection_violation(pos, name)
			return
		end
		if fields.channel then
			minetest.get_meta(pos):set_string("channel", fields.channel)
			minetest.get_meta(pos):set_string("state", "Off")
		end
	end,
})

minetest.register_node("barriers:tl_cr_yr_yellow", {
	description = "Railroad crossing light (yellow + red) (yellow)",
	groups = {cracky = 1, level = 0, not_in_creative_inventory = 1},
	tiles = {"tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_face_yellow.png"},
	sounds = default_stone_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.3, 0.7, 0.2, 0.3, 0.5},
			{-0.1, -0.1, 0.9, 0.1, 0.1, 0.7},
			{-0.125, 0.25, 0.5, -0.063, 0.188, 0.35},
			{-0.063, 0.312, 0.5, 0.061, 0.25, 0.35},
			{0.061, 0.25, 0.5, 0.123, 0.188, 0.35},
			{-0.125, -0.0445, 0.5, -0.063, -0.1065, 0.35},
			{-0.063, 0.0175, 0.5, 0.061, -0.0445, 0.35},
			{0.061, -0.0445, 0.5, 0.123, -0.1065, 0.35},
		},
	},
	digiline = {
		receptor = {},
		wire = {rules = tlRules},
		effector = {
			action = function(pos, node, channel, msg)
				if channel == minetest.get_meta(pos):get_string("channel") then
					if msg:upper() == "OFF" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_off", param2 = node.param2})
					elseif msg:upper() == "RED" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_red", param2 = node.param2})
					elseif msg:upper() == "YELLOW" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_yellow", param2 = node.param2})
					elseif msg:upper() == "GREEN" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_green", param2 = node.param2})
					elseif msg:upper() == "REDYELLOW" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_redyellow", param2 = node.param2})
					end
				end
			end,
		},
	},
	drop = "barriers:tl_cr_yr_off",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local name = sender:get_player_name()
		if minetest.is_protected(pos, name) and not minetest.check_player_privs(name, {protection_bypass = true}) then
			minetest.record_protection_violation(pos, name)
			return
		end
		if fields.channel then
			minetest.get_meta(pos):set_string("channel", fields.channel)
			minetest.get_meta(pos):set_string("state", "Off")
		end
	end,
})

minetest.register_node("barriers:tl_cr_yr_red", {
	description = "Railroad crossing light (yellow + red) (red)",
	groups = {cracky = 1, level = 0, not_in_creative_inventory = 1},
	tiles = {"tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_face_red.png"},
	sounds = default_stone_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.3, 0.7, 0.2, 0.3, 0.5},
			{-0.1, -0.1, 0.9, 0.1, 0.1, 0.7},
			{-0.125, 0.25, 0.5, -0.063, 0.188, 0.35},
			{-0.063, 0.312, 0.5, 0.061, 0.25, 0.35},
			{0.061, 0.25, 0.5, 0.123, 0.188, 0.35},
			{-0.125, -0.0445, 0.5, -0.063, -0.1065, 0.35},
			{-0.063, 0.0175, 0.5, 0.061, -0.0445, 0.35},
			{0.061, -0.0445, 0.5, 0.123, -0.1065, 0.35},
		},
	},
	digiline = {
		receptor = {},
		wire = {rules = tlRules},
		effector = {
			action = function(pos, node, channel, msg)
				if channel == minetest.get_meta(pos):get_string("channel") then
					if msg:upper() == "OFF" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_off", param2 = node.param2})
					elseif msg:upper() == "RED" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_red", param2 = node.param2})
					elseif msg:upper() == "YELLOW" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_yellow", param2 = node.param2})
					elseif msg:upper() == "GREEN" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_green", param2 = node.param2})
					elseif msg:upper() == "REDYELLOW" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_redyellow", param2 = node.param2})
					end
				end
			end,
		},
	},
	drop = "barriers:tl_cr_yr_off",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local name = sender:get_player_name()
		if minetest.is_protected(pos, name) and not minetest.check_player_privs(name, {protection_bypass = true}) then
			minetest.record_protection_violation(pos, name)
			return
		end
		if fields.channel then
			minetest.get_meta(pos):set_string("channel", fields.channel)
			minetest.get_meta(pos):set_string("state", "Off")
		end
	end,
})

minetest.register_node("barriers:tl_cr_yr_redyellow", {
	description = "Railroad crossing light (yellow + red) (redyellow)",
	groups = {cracky = 1, level = 0, not_in_creative_inventory = 1},
	tiles = {"tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_off.png", "tl_cr_yr_face_redyellow.png"},
	sounds = default_stone_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.3, 0.7, 0.2, 0.3, 0.5},
			{-0.1, -0.1, 0.9, 0.1, 0.1, 0.7},
			{-0.125, 0.25, 0.5, -0.063, 0.188, 0.35},
			{-0.063, 0.312, 0.5, 0.061, 0.25, 0.35},
			{0.061, 0.25, 0.5, 0.123, 0.188, 0.35},
			{-0.125, -0.0445, 0.5, -0.063, -0.1065, 0.35},
			{-0.063, 0.0175, 0.5, 0.061, -0.0445, 0.35},
			{0.061, -0.0445, 0.5, 0.123, -0.1065, 0.35},
		},
	},
	digiline = {
		receptor = {},
		wire = {rules = tlRules},
		effector = {
			action = function(pos, node, channel, msg)
				if channel == minetest.get_meta(pos):get_string("channel") then
					if msg:upper() == "OFF" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_off", param2 = node.param2})
					elseif msg:upper() == "RED" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_red", param2 = node.param2})
					elseif msg:upper() == "YELLOW" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_yellow", param2 = node.param2})
					elseif msg:upper() == "GREEN" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_green", param2 = node.param2})
					elseif msg:upper() == "REDYELLOW" then
						minetest.swap_node(pos, {name = "barriers:tl_cr_yr_redyellow", param2 = node.param2})
					end
				end
			end,
		},
	},
	drop = "barriers:tl_cr_yr_off",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local name = sender:get_player_name()
		if minetest.is_protected(pos, name) and not minetest.check_player_privs(name, {protection_bypass = true}) then
			minetest.record_protection_violation(pos, name)
			return
		end
		if fields.channel then
			minetest.get_meta(pos):set_string("channel", fields.channel)
			minetest.get_meta(pos):set_string("state", "Off")
		end
	end,
})

minetest.register_node("barriers:barrier_closed_right", {
	description = "Closed barrier (right)",
	groups = {cracky = 1, level = 2},
	tiles = {"barrier_motor.png"},
	sounds = default_steel_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.3, 0.3, 0.9, 0.3},
			{-0.2, 0.4, -0.5, 0.2, 0.8, -0.3},
			{0.2, 0.5, -0.5, 0.5, 0.7, -0.3},
		},
	},
	digiline = {
		receptor = {},
		wire = {rules = tlRules},
		effector = {
			action = function(pos, node, channel, msg)
				if channel == minetest.get_meta(pos):get_string("channel") then
					minetest.sound_play("barrier", {
						pos = pos,
						max_hear_distance = 10,
						gain = 10.0,
					})
					if msg:upper() == "UP" then
						minetest.swap_node(pos, {name = "barriers:barrier_opened_right", param2 = node.param2})
						if node.param2 == 0 then
							for i = pos.x + 1, pos.x + 3
							do
								minetest.swap_node({x = i, y = pos.y, z = pos.z}, {name = "air"})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "barriers:barrier_part_vertical", param2 = node.param2})
							end
						elseif node.param2 == 1 then
							for i = pos.z - 3, pos.z - 1
							do
								minetest.swap_node({x = pos.x, y = pos.y, z = i}, {name = "air"})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "barriers:barrier_part_vertical", param2 = node.param2})
							end
						elseif node.param2 == 2 then
							for i = pos.x - 3, pos.x - 1
							do
								minetest.swap_node({x = i, y = pos.y, z = pos.z}, {name = "air"})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "barriers:barrier_part_vertical", param2 = node.param2})
							end
						elseif node.param2 == 3 then
							for i = pos.z + 1, pos.z + 3
							do
								minetest.swap_node({x = pos.x, y = pos.y, z = i}, {name = "air"})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "barriers:barrier_part_vertical", param2 = node.param2})
							end
						end
					--[[elseif msg:upper() == "HALF" then
						minetest.swap_node(pos, {name = "barriers:barrier_halfway_right", param2 = node.param2})]]--
					elseif msg:upper() == "DOWN" then
						minetest.swap_node(pos, {name = "barriers:barrier_closed_right", param2 = node.param2})
						if node.param2 == 0 then
							for i = pos.x + 1, pos.x + 3
							do
								minetest.swap_node({x = i, y = pos.y, z = pos.z}, {name = "barriers:barrier_part", param2 = node.param2})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "air"})
							end
						elseif node.param2 == 1 then
							for i = pos.z - 3, pos.z - 1
							do
								minetest.swap_node({x = pos.x, y = pos.y, z = i}, {name = "barriers:barrier_part", param2 = node.param2})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "air"})
							end
						elseif node.param2 == 2 then
							for i = pos.x - 3, pos.x - 1
							do
								minetest.swap_node({x = i, y = pos.y, z = pos.z}, {name = "barriers:barrier_part", param2 = node.param2})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "air"})
							end
						elseif node.param2 == 3 then
							for i = pos.z + 1, pos.z + 3
							do
								minetest.swap_node({x = pos.x, y = pos.y, z = i}, {name = "barriers:barrier_part", param2 = node.param2})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "air"})
							end
						end
					end
				end
			end,
		},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local name = sender:get_player_name()
		if minetest.is_protected(pos, name) and not minetest.check_player_privs(name, {protection_bypass = true}) then
			minetest.record_protection_violation(pos, name)
			return
		end
		if fields.channel then
			minetest.get_meta(pos):set_string("channel", fields.channel)
			minetest.get_meta(pos):set_string("state", "Off")
		end
	end,
})

--[[
minetest.register_node("barriers:barrier_halfway_right", {
	description = "Halfway opened barrier (right)",
	groups = {cracky = 1, level = 2, not_in_creative_inventory = 1},
	tiles = {"barrier_closed_top.png", "barrier_closed_top.png", "barrier_closed_right.png", "barrier_closed_left.png", "barrier_closed_back.png", "barrier_closed_front.png"},
	sounds = default_steel_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			
		},
	},
	digiline = {
		receptor = {},
		wire = {rules = tlRules},
		effector = {
			action = function(pos, node, channel, msg)
				if channel == minetest.get_meta(pos):get_string("channel") then
					if msg:upper() == "UP" then
						minetest.swap_node(pos, {name = "barriers:barrier_opened_right", param2 = node.param2})
					elseif msg:upper() == "HALF" then
						minetest.swap_node(pos, {name = "barriers:barrier_halfway_right", param2 = node.param2})
					elseif msg:upper() == "DOWN" then
						minetest.swap_node(pos, {name = "barriers:barrier_closed_right", param2 = node.param2})
					end
				end
			end,
		},
	},
	drop = "barriers:barrier_closed_right",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local name = sender:get_player_name()
		if minetest.is_protected(pos, name) and not minetest.check_player_privs(name, {protection_bypass = true}) then
			minetest.record_protection_violation(pos, name)
			return
		end
		if fields.channel then
			minetest.get_meta(pos):set_string("channel", fields.channel)
			minetest.get_meta(pos):set_string("state", "Off")
		end
	end,
})
]]--

minetest.register_node("barriers:barrier_opened_right", {
	description = "Opened barrier (right)",
	groups = {cracky = 1, level = 2, not_in_creative_inventory = 1},
	tiles = {"barrier_motor.png"},
	sounds = default_steel_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.3, 0.3, 0.9, 0.3},
			{-0.2, 0.4, -0.5, 0.2, 0.8, -0.3},
			{-0.1, 0.8, -0.5, 0.1, 1, -0.3},
		},
	},
	digiline = {
		receptor = {},
		wire = {rules = tlRules},
		effector = {
			action = function(pos, node, channel, msg)
				if channel == minetest.get_meta(pos):get_string("channel") then
					minetest.sound_play("barrier", {
						pos = pos,
						max_hear_distance = 10,
						gain = 10.0,
					})
					if msg:upper() == "UP" then
						minetest.swap_node(pos, {name = "barriers:barrier_opened_right", param2 = node.param2})
						if node.param2 == 0 then
							for i = pos.x + 1, pos.x + 3
							do
								minetest.swap_node({x = i, y = pos.y, z = pos.z}, {name = "air"})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "barriers:barrier_part_vertical", param2 = node.param2})
							end
						elseif node.param2 == 1 then
							for i = pos.z - 3, pos.z - 1
							do
								minetest.swap_node({x = pos.x, y = pos.y, z = i}, {name = "air"})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "barriers:barrier_part_vertical", param2 = node.param2})
							end
						elseif node.param2 == 2 then
							for i = pos.x - 3, pos.x - 1
							do
								minetest.swap_node({x = i, y = pos.y, z = pos.z}, {name = "air"})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "barriers:barrier_part_vertical", param2 = node.param2})
							end
						elseif node.param2 == 3 then
							for i = pos.z + 1, pos.z + 3
							do
								minetest.swap_node({x = pos.x, y = pos.y, z = i}, {name = "air"})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "barriers:barrier_part_vertical", param2 = node.param2})
							end
						end
					--[[elseif msg:upper() == "HALF" then
						minetest.swap_node(pos, {name = "barriers:barrier_halfway_right", param2 = node.param2})]]--
					elseif msg:upper() == "DOWN" then
						minetest.swap_node(pos, {name = "barriers:barrier_closed_right", param2 = node.param2})
						if node.param2 == 0 then
							for i = pos.x + 1, pos.x + 3
							do
								minetest.swap_node({x = i, y = pos.y, z = pos.z}, {name = "barriers:barrier_part", param2 = node.param2})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "air"})
							end
						elseif node.param2 == 1 then
							for i = pos.z - 3, pos.z - 1
							do
								minetest.swap_node({x = pos.x, y = pos.y, z = i}, {name = "barriers:barrier_part", param2 = node.param2})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "air"})
							end
						elseif node.param2 == 2 then
							for i = pos.x - 3, pos.x - 1
							do
								minetest.swap_node({x = i, y = pos.y, z = pos.z}, {name = "barriers:barrier_part", param2 = node.param2})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "air"})
							end
						elseif node.param2 == 3 then
							for i = pos.z + 1, pos.z + 3
							do
								minetest.swap_node({x = pos.x, y = pos.y, z = i}, {name = "barriers:barrier_part", param2 = node.param2})
							end
							for i = pos.y + 2, pos.y + 4
							do
								minetest.swap_node({x = pos.x, y = i, z = pos.z}, {name = "air"})
							end
						end
					end
				end
			end,
		},
	},
	drop = "barriers:barrier_closed_right",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local name = sender:get_player_name()
		if minetest.is_protected(pos, name) and not minetest.check_player_privs(name, {protection_bypass = true}) then
			minetest.record_protection_violation(pos, name)
			return
		end
		if fields.channel then
			minetest.get_meta(pos):set_string("channel", fields.channel)
			minetest.get_meta(pos):set_string("state", "Off")
		end
	end,
})

minetest.register_node("barriers:barrier_part", {
	description = "Barrier part",
	groups = {cracky = 1, level = 2, not_in_creative_inventory = 1},
	tiles = {"barrier_part.png", "barrier_part.png", "barrier_part_2.png", "barrier_part_2.png", "barrier_part_2.png", "barrier_part.png"},
	sounds = default_steel_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.5, -0.5, 0.5, 0.7, -0.3},
		},
	},
	drop = "",
})

--[[
minetest.register_node("barriers:barrier_part_diagonal", {
	description = "Diagonal barrier part",
	groups = {cracky = 1, level = 2, not_in_creative_inventory = 1},
	tiles = {"barrier_part_diagonal.png"},
	sounds = default_steel_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			
		},
	},
	drop = "",
})
]]--

minetest.register_node("barriers:barrier_part_vertical", {
	description = "Vertical barrier part",
	groups = {cracky = 1, level = 2, not_in_creative_inventory = 1},
	tiles = {"barrier_part_vertical.png"},
	sounds = default_steel_sounds,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1, -1, -0.5, 0.1, 0, -0.3},
		},
	},
	drop = "",
})
