local mp = minetest.get_modpath(minetest.get_current_modname())

dofile(mp .. "/nodes.lua")
dofile(mp .. "/crafts.lua")

minetest.log("info", "[barriers] Mod loaded successfully!")
