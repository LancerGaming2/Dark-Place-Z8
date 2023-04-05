function Mod:init()
    -- Accur acy
    MUSIC_PITCHES["deltarune/cybercity_alt"] = 1.2
    MUSIC_PITCHES["deltarune/THE_HOLY"] = 0.9
end

function Mod:postInit(new_file)
    -- FUN Value
    if new_file then
        Game:setFlag("fun", love.math.random(1, 100))
    end

    if new_file and Game:hasPartyMember("YOU") then
        Game.world:startCutscene("room1", "react_to_YOU")
    end
end

-- Warp Bin
-- god I am so sorry for how shitty this code is

-- I'm going to cause pain and suffering with one weird trick:
-- here's the table containing any and all warp codes for the warp bin
-- have fun :]   -Char
-- Also for reference: first in a table is the code, second in a table is the result, and third in a table is the marker you wanna go (optional but defaults to spawn).
-- If the result is a string then it goes to that map, if the last argument is a function it will run the function.
Mod.binCodes = {
    { code = "00000000", result = "warphub" },
    { code = "spamroom", result = "spamroom" },
    { code = "desshere", result = "dessstuff/dessstart" },
    {
        code = "wtf1998s",
        result = function(cutscene)
            cutscene:text("* Wow![wait:10]\n* You found a secret![wait:10]\n* Awesome!")
            Mod:addBinCode("sppispod", function(cutscene)
                cutscene:text({
                    "* Since you found another one...",
                    "* Here's a fun fact:",
                    "* This was made as a way to showcase what the warp bin can do!"
                })
            end)
        end
    },
    { code = "bossrush", result = "thearena" },
    { code = "devdiner", result = "devstart" },
}

-- if you don't want to be cringe there's also this new totally cool helper function wowee
-- also returns success just in-case someone else steals your code before you get to use it.
function Mod:addBinCode(code, result, marker)
    if Mod:getBinCode(code) then
        -- whoops, no success
        return false
    end

    -- lmao
    table.insert(Mod.binCodes, { code = code, result = result, marker = marker or "spawn" })
    return true
end

-- and here's a function to get a Bin Code by its Code like lmao
function Mod:getBinCode(code)
    return Mod:findItemThatContainsValueSatisfyingCond1D(Mod.binCodes, function(v) return v.code:lower() == code:lower() end)
end

-- and here's one to delete Bin Codes
function Mod:deleteBinCode(code)
    local old_size = #Mod.binCodes
    Utils.filterInPlace(Mod.binCodes, function(v) return v.code:lower() ~= code:lower() end)
    return #Mod.binCodes < old_size
end

-- Wavy VFX

Mod.wave_shader = love.graphics.newShader([[
    extern number wave_sine;
    extern number wave_mag;
    extern number wave_height;
    extern vec2 texsize;
    vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
    {
        number i = texture_coords.y * texsize.y;
        vec2 coords = vec2(max(0.0, min(1.0, texture_coords.x + (sin((i / wave_height) + (wave_sine / 30.0)) * wave_mag) / texsize.x)), max(0.0, min(1.0, texture_coords.y + 0.0)));
        return Texel(texture, coords) * color;
    }
]])

-- Other utilties

-- I'm sorry
function Mod:findItemThatContainsValueSatisfyingCond1D(tbl, cond)
    for _, v in ipairs(tbl) do
        if cond(v) then
            return v
        end
    end
    return nil
end

function Mod:findItemThatContainsValueSatisfyingCond2D(tbl, cond)
    for k, v in pairs(tbl) do
        if cond(k, v) then
            return k, v
        end
    end
    return nil, nil
end

function Mod:getKris()
    local YOU = Game:getPartyMember("YOU")
    local kris = Game:getPartyMember("kris")
    return YOU or kris
end

function Mod:getKrisActor(cutscene)
    return cutscene:getCharacter(Mod:getKris().id)
end

function Mod:hasAch(id)
    local ach = Kristal.callEvent("getAchievement", id)
    if not ach then error("No such ach: " .. id) end
    return ach.earned
end

function Mod:isInTheArena()
    return Game.world.map.id == "thearena"
end
