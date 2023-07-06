---@class Encounter_o : Encounter
---@overload fun(...) : Encounter_o
local Encounter = Class("Encounter", true)

function Encounter:createSoul(x, y, color)
    local player = Game.party[1]
    local player_name = Game.save_name:upper()
    if player:checkArmor("pizza_toque") or player_name == "PEPPINO" then
        return TauntSoul(x, y, color)
    elseif player_name == "BLUE" then
        return BlueSoul(x, y, color)
    else
        return Soul(x, y, color)
    end
end

return Encounter