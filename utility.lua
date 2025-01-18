items = {
	"steel-chest",
	"iron-plate",
	"copper-plate",
}

amounts = {
	["steel-chest"] = 50,
}

function get_setting_name(item)
	return string.format("yokaze-initial-%s", item)
end

return {
	amounts = amounts,
	get_setting_name = get_setting_name,
	items = items,
}
