local createMonster = TalkAction("/mp")

function createMonster.onSay(player, words, param)

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local position = player:getPosition()
	local monster = Game.createMonster(param, position)
	if monster then
		monster:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
	else
		player:sendCancelMessage("There is not enough room.")
		position:sendMagicEffect(CONST_ME_POFF)
	end
	return false
end

createMonster:separator(" ")
createMonster:register()
