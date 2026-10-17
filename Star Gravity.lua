-- name: Star Gravity
-- description: Star Number = Mario's Gravity, by Niv\\#0069ff\\44!

local function star_gravity(m)
    local gravity = -2 + (m.numStars * 0.03)

    m.vel.y = m.vel.y + gravity
end

hook_event(HOOK_BEFORE_PHYS_STEP, star_gravity)



hook_event(HOOK_MARIO_UPDATE, function(m)
    if m.playerIndex ~= 0 then return end
    m.peakHeight = m.pos.y
end)