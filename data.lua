utility = require("utility")

extra_slots = settings.startup[utility.settings_extra_inventory_slots].value
if extra_slots then
	character = data.raw["character"]["character"]
	character.inventory_size = character.inventory_size + extra_slots
end
