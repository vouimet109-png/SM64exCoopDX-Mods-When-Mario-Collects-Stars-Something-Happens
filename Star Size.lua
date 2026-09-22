-- name: Star Size
-- description: Star Number = Mario's Size, by Niv\\#0069ff\\44!

local BASE_RADIUS = 37
local BASE_HEIGHT = 160

local cappyBaseRadius = {}
local cappyBaseHeight = {}

local function Bigger(m)

    local scale = math.max(m.numStars * 0.015) + 0.015

    m.marioObj.hitboxRadius = BASE_RADIUS * scale
    m.marioObj.hitboxHeight = BASE_HEIGHT * scale
    m.marioObj.oWallHitboxRadius = BASE_RADIUS * scale

    m.marioObj.header.gfx.scale.x = scale
    m.marioObj.header.gfx.scale.y = scale
    m.marioObj.header.gfx.scale.z = scale


    if bhvOmmCappy == nil then
        return
    end
 
    local index = m.playerIndex
    local globalIndex = network_global_index_from_local(index) + 1
 
    local cappy = obj_get_first_with_behavior_id_and_field_s32(
        bhvOmmCappy,
        0x31,
        globalIndex
    )
 
    if cappy ~= nil then
        if cappyBaseRadius[index] == nil then
            cappyBaseRadius[index] = cappy.hitboxRadius
            cappyBaseHeight[index] = cappy.hitboxHeight
        end
 
        cappy.hitboxRadius = cappyBaseRadius[index] * scale
        cappy.hitboxHeight = cappyBaseHeight[index] * scale
 
        cappy.header.gfx.scale.x = scale
        cappy.header.gfx.scale.y = scale
        cappy.header.gfx.scale.z = scale
    end
end
 
hook_event(HOOK_MARIO_UPDATE, Bigger)