-- name: Star Jump
-- description: Star Number = Jump Height, by Niv\\#0069ff\\44!

local function is_jump(action)
    if action == ACT_JUMP
    or action == ACT_DOUBLE_JUMP
    or action == ACT_TRIPLE_JUMP
    or action == ACT_FLYING_TRIPLE_JUMP
    or action == ACT_SPECIAL_TRIPLE_JUMP
    or action == ACT_WATER_JUMP
    or action == ACT_METAL_WATER_JUMP
    or action == ACT_HOLD_JUMP
    or action == ACT_BBH_ENTER_JUMP
    or action == ACT_BURNING_JUMP
    or action == ACT_QUICKSAND_JUMP_LAND
    or action == WIGGLER_ACT_JUMPED_ON
    or action == ACT_BACKFLIP
    or action == ACT_LONG_JUMP
    or action == ACT_SIDE_FLIP
    or action == ACT_JUMP_KICK
    or action == ACT_WALL_KICK_AIR
    or action == ACT_RIDING_SHELL_JUMP
    or action == ACT_LAVA_BOOST
    or action == ACT_TOP_OF_POLE_JUMP
    or action == ACT_STEEP_JUMP then

        return true
    end

    if _G.OmmApi then
        if action == _G.OmmApi.ACT_OMM_GROUND_POUND_JUMP
        or action == _G.OmmApi.ACT_OMM_SPIN_JUMP
        or action == _G.OmmApi.ACT_OMM_CAPPY_BOUNCE
        or action == _G.OmmApi.ACT_OMM_CAPPY_VAULT
        or action == _G.OmmApi.ACT_OMM_CAPPY_THROW_AIRBORNE
        or action == _G.OmmApi.ACT_OMM_MIDAIR_SPIN
        or action == _G.OmmApi.ACT_OMM_ROLL_AIR
        or action == _G.OmmApi.ACT_OMM_SPIN_AIR
        or action == _G.OmmApi.ACT_OMM_RAINBOW_SPIN
        or action == _G.OmmApi.ACT_OMM_METAL_WATER_JUMP
        or action == _G.OmmApi.ACT_OMM_METAL_WATER_DOUBLE_JUMP
        or action == _G.OmmApi.ACT_OMM_METAL_WATER_TRIPLE_JUMP
        or action == _G.OmmApi.ACT_OMM_METAL_WATER_BACKFLIP
        or action == _G.OmmApi.ACT_OMM_METAL_WATER_SIDE_FLIP
        or action == _G.OmmApi.ACT_OMM_METAL_WATER_LONG_JUMP
        or action == _G.OmmApi.ACT_OMM_METAL_WATER_WALL_KICK_AIR then
            return true
        end
    end

    return false
end


local function jump_height(m)
    if is_jump(m.action) then
        m.vel.y = m.vel.y * (m.numStars * 0.05) -- normal jump to 20
        --m.vel.y = m.vel.y * (m.numStars / 120)    -- normal jump to 120
    end
end

hook_event(HOOK_ON_SET_MARIO_ACTION, jump_height)