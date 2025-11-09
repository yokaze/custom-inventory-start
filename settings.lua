utility = require("utility")

-- https://wiki.factorio.com/Tutorial:Mod_settings
data:extend({
	{
		type = "bool-setting",
		name = utility.settings_clear_inventory,
		setting_type = "startup",
		default_value = false,
		order = "a",
	},
})

data:extend({
	{
		type = "string-setting",
		name = utility.settings_initial_armor,
		setting_type = "startup",
		default_value = utility.settings_initial_armor_none,
		allowed_values = {
			utility.settings_initial_armor_none,
			utility.settings_initial_armor_mk1,
			utility.settings_initial_armor_mk2,
		},
		order = "b",
	},
})

for _, item in ipairs(utility.items) do
	local amount = 0
	if utility.amounts[item] then
		amount = utility.amounts[item]
	end

	data:extend({
		{
			type = "int-setting",
			name = utility.get_setting_name(item),
			setting_type = "startup",
			default_value = amount,
			minimum_value = 0,
			order = utility.orders[item],
		},
	})
end
