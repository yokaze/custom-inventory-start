utility = require("utility")

function add_initial_items(event)
	local player = game.players[event.player_index]
	for _, item in ipairs(utility.items) do
		count = settings.startup[utility.get_setting_name(item)].value
		if count > 0 then
			player.insert({ name = item, count = count })
		end
	end
end

script.on_event(defines.events.on_cutscene_cancelled, add_initial_items)
