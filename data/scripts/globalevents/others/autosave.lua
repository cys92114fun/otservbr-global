local cleanMapAtSave = true

local function serverSave(interval)
	if cleanMapAtSave then
		cleanMap()
	end

	saveServer()
end

local autosave = GlobalEvent("autosave")

function autosave.onThink(interval)
	addEvent(serverSave, 60000, interval)
	return true
end

autosave:interval(1200000)
autosave:register()