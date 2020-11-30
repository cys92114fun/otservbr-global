local premiumscroll = Action()
local addpoints = 200000 -- amount of points to add
function premiumscroll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
if isPlayer(player) and item:remove() then
db.query("UPDATE `accounts` SET `coins` = `coins` + "..addpoints.." WHERE `id` = '" ..getAccountNumberByPlayerName(player:getName()).. "';")
doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_ORANGE, ""..addpoints.." Tibia Coins have been added to your account.")
player:say('200000 Tibia Coins added to your account!', TALKTYPE_MONSTER_SAY)
return true
end
end

premiumscroll:id(16101)
premiumscroll:register()