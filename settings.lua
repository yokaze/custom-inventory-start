utility = require("utility")

orders = {
	["steel-chest"] = "a[items]-c[steel-chest]",
	["iron-plate"] = "a[smelting]-a[iron-plate]",
	["copper-plate"] = "a[smelting]-b[copper-plate]",
}

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
			order = orders[item],
		},
	})
end
