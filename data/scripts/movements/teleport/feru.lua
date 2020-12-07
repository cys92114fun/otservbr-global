local config = {
	[24838] = {position = Position(33319, 32317, 13)}
}

local feru = MoveEvent()

function feru.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	for index, value in pairs(config) do
		if item.actionid == index then
			if(item.actionid == 57604)then
				if(player:getStorageValue(Storage.TheSecretLibrary.TheOrderOfTheFalcon.OberonTimer) > os.time())then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have faced this boss in the last 20 hours.")
					player:teleportTo(fromPosition, true)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					return false
				end
			end
			doSendMagicEffect(player:getPosition(), CONST_ME_TELEPORT)
			player:teleportTo(value.position)
			doSendMagicEffect(value.position, CONST_ME_TELEPORT)		
		end
	end
end

feru:type("stepin")

for index, value in pairs(config) do
	feru:aid(index)
end

feru:register()
