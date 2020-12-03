local savingEvent = 0
function saveLoop(delay)
	saveServer()
	SaveHirelings()
	print("> Saved Hirelings")
	if delay > 0 then
		savingEvent = addEvent(saveLoop, delay, delay)
	end
end

local save = TalkAction("/savep")

function save.onSay(player, words, param)
		if isNumber(param) then
			stopEvent(savingEvent)
			saveLoop(tonumber(param) * 60 * 1000)
		else
			saveServer()
			SaveHirelings()
			print("> Saved Hirelings")
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Server is saved ...")
		end
end

save:separator(" ")
save:register()