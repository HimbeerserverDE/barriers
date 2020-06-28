minetest.register_craft({
	output = "barriers:warning_light_off",
	recipe = {
		{"", "mesecons_lightstone:lightstone_yellow_off", ""},
		{"wool:black", "wool:black", "wool:black"},
	},
})

minetest.register_craft({
	output = "barriers:tl_cr_yr_off",
	recipe = {
		{"wool:black", "dye:red", "wool:black"},
		{"wool:black", "wool:black", "wool:black"},
		{"wool:black", "dye:yellow", "wool:black"},
	},
})

minetest.register_craft({
	output = "barriers:barrier_closed_right",
	recipe = {
		{"default:steel_ingot", "dye:dark_green", "dye:white"},
		{"default:steel_ingot", "mesecons_movestones:movestone_vertical", "default:steel_ingot"},
		{"default:steel_ingot", "dye:dark_green", "dye:red"},
	},
})

minetest.register_craft({
	output = "barriers:barrier_closed_left",
	recipe = {
		{"dye:white", "dye:dark_green", "default:steel_ingot"},
		{"default:steel_ingot", "mesecons_movestones:movestone_vertical", "default:steel_ingot"},
		{"dye:red", "dye:dark_green", "default:steel_ingot"},
	},
})

minetest.register_craft({
	output = "barriers:tl_p_gr_off",
	recipe = {
		{"wool:black", "dye:red", "wool:black"},
		{"wool:black", "wool:black", "wool:black"},
		{"wool:black", "dye:green", "wool:black"},
	},
})
