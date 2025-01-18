settings_clear_inventory = "yokaze-initial-clear-inventory"

items = {
	"steel-chest",
	"transport-belt",
	"underground-belt",
	"splitter",
	"inserter",
	"small-electric-pole",
	"medium-electric-pole",
	"big-electric-pole",
	"substation",
	"pipe",
	"pipe-to-ground",
	"car",
	"logistic-robot",
	"construction-robot",
	"active-provider-chest",
	"passive-provider-chest",
	"storage-chest",
	"buffer-chest",
	"requester-chest",
	"roboport",
	"small-lamp",
	"arithmetic-combinator",
	"decider-combinator",
	"selector-combinator",
	"constant-combinator",
	"cliff-explosives",
	"repair-pack",
	"boiler",
	"steam-engine",
	"solar-panel",
	"accumulator",
	"electric-mining-drill",
	"offshore-pump",
	"electric-furnace",
	"assembling-machine-2",
	"lab",
	"efficiency-module",
}

orders = {}
for k, v in ipairs(items) do
	orders[v] = string.format("b%02d", k)
end

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
	orders = orders,
	settings_clear_inventory = settings_clear_inventory,
}
