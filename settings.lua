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
