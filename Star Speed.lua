-- name: Star Speed
-- description: Star Number = Mario's Speed, by Niv\\#0069ff\\44! (speed of the cheat mod)

local function star_speed(m)
    local speed = (m.numStars * 0.05) + 0.05
        m.vel.x = m.vel.x * speed
        m.vel.z = m.vel.z * speed
end

hook_event(HOOK_BEFORE_PHYS_STEP, star_speed)