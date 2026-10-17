-- name: Star Cap Dives
-- description: Your number of Stars determines how many Cap Dives you can use.                                                                                     Requires OMM                                          by Niv\\#0069ff\\44!
-- incompatible: Infinite Cappy bounces

local checkedOmm = false

local playerBouncesCount = {}
local wasInBounceAction = {}

local function check_omm()
    if checkedOmm == true then return end
        if _G.OmmEnabled == nil then
            djui_popup_create("Star Cap Dives requiert OMM Rebirth", 3)
        end
    checkedOmm = true
end
hook_event(HOOK_UPDATE, check_omm)



local function star_cap_dives()

    if not _G.OmmEnabled then return end

    local m = gMarioStates[0]
    local index = m.playerIndex

    if playerBouncesCount[index] == nil then
        playerBouncesCount[index] = 0
    end

    if wasInBounceAction[index] == nil then
        wasInBounceAction[index] = false
    end

    if (m.action & ACT_FLAG_AIR) == 0 then
        playerBouncesCount[index] = 0
    end

    local isBounce =
        m.action == _G.OmmApi.ACT_OMM_CAPPY_BOUNCE or
        m.action == _G.OmmApi.ACT_OMM_CAPPY_VAULT

    if isBounce and not wasInBounceAction[index] then
        playerBouncesCount[index] = playerBouncesCount[index] + 1
        wasInBounceAction[index] = true
    end

    if not isBounce then
        wasInBounceAction[index] = false
    end

    local maxBounces = m.numStars

    local obj = obj_get_first_with_behavior_id(bhvOmmCappy)

    while obj ~= nil do

        if playerBouncesCount[index] >= maxBounces then
            obj.oCapUnkF4 = 99
        else
            obj.oCapUnkF4 = 0
        end

        obj = obj_get_next_with_same_behavior_id(obj)
    end
end

hook_event(HOOK_UPDATE, star_cap_dives)