local almmounts = TalkAction("/allmounts")
function almmounts.onSay(player, words, param)

	local target
	if param == '' then
		target = player:getTarget()
		if not target then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Unlocks all mounts for certain player. Usage: /mounts <player name>')
			return false
		end
	else
		target = Player(param)
	end

	if not target then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Player ' .. param .. ' is not currently online.')
		return false
	end

	if target:getAccountType() > player:getAccountType() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Cannot perform action.')
		return false
	end

	for i = 1, 174 do
		target:addMount(i)
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'All mounts unlocked for: ' .. target:getName())
	target:sendTextMessage(MESSAGE_EVENT_ADVANCE, '[Server] All mounts unlocked.')
	return false
end

almmounts:separator(" ")
almmounts:register()