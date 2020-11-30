local skullremover = Action()
function skullremover.onUse(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    if not isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can only remove red or black skulls!")
        return true
    end

    player:setSkull(0)
    player:setSkullTime(0)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your skull has been removed!")
    Item(item.uid):remove(1)
    return true
end

skullremover:id(7708)
skullremover:register()