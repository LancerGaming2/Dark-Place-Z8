-- Warp Bin
-- god I am so sorry for how shitty this code is

--- The thing you put in the Warp Bin to warp to places \
--- must be 8 characters long and be in upper case
---@alias WarpBinCode string

--- defines the behavior of a Warp Bin code
---@class WarpBinCodeInfo
--- what to do after the code is entered \
--- if a string, treated as a map's id and the player is teleported there \
--- if the last argument is a function, the function is run
---@field result string|(fun(cutscene: WorldCutscene):string|WarpBinCodeInfoMini|nil) map id or cutscene
---@field marker? string in case result is a string, the name of the marker you want to teleport the player to
---@field cond? fun():boolean|nil if defined, this must return true for the player to be allowed to warp
---@field flagcheck? string the name of a flag that must be true or be equal to flagvalue for the player to be allowed to warp. If this is prefixed with an !, then the condition is inverted
---@field flagvalue? any the value that the flag in flagcheck should be equal to
---@field on_fail? fun(cutscene: WorldCutscene) called when the condition is not satifised
---@field silence_system_messages? boolean

---@class WarpBinCodeInfoMini
---@field result string map id
---@field marker? string in case result is a string, the name of the marker you want to teleport the player to

-- I'm going to cause pain and suffering with one weird trick:
-- here's the table containing any and all warp codes for the 
-- warp bin.
-- have fun :]   -Char                 (well its NOT that bad) \
-- to add new codes you'd add new entries of "type" WarpBinCodeInfo to the table below.
-- If you have sumneko's Lua LS you should be able to get nice annonations
---@type table<WarpBinCode, WarpBinCodeInfo>
Mod.warp_bin_codes = {
    ["00000000"] = { result = "warphub" },
    ["SPAMROOM"] = { result = "spamroom" },
    ["DESSHERE"] = { result = "dessstuff/dessstart" },
    ["BOSSRUSH"] = { result = "thearena" },
    ["DEVDINER"] = { result = "devhotel/devdiner/devstart" },
    ["MAUSHOLE"] = { result = "chevroom" },
    ["WIFIDOWN"] = { result = "googlefield" },
    ["UWFOREST"] = { result = "underworld_forest/uwforest_startbin" },
    ["SEAWORLD"] = { result = "underwater_temple/underwater_startbin" },
	["_CHCKPNT"] = { result = "field" },
	["DARKCADE"] = { result = "darkcade/outside", marker = "warp" },
    ["DUMBIERM"] = { result = "dumbierm" },
	["GARRYMOD"] = { result = "missing" },
	["JOHNWICK"] = { result = "archives/starting_room" },
    ["TOMBSITE"] = { result = "fwood/entry", marker = "warp" },
    ["WILDEAST"] = { result = "dunes/37_saloon" },
    ["WOODROOM"] = { result = "gallery/galleryentrance" },
    ["WTF1998S"] = {
        result = function(cutscene)
            Game:setFlag("wb_wtf1998s", true)
            cutscene:text("* Wow![wait:10]\n* You found a secret![wait:10]\n* Awesome!")
        end
    },
    ["SPPISPOD"] = {
        result = function(cutscene)
            cutscene:text("* Since you found another one...")
            cutscene:text("* Here's a fun fact:")
            cutscene:text("* This was made as a way to showcase what the warp bin can do!")
        end,
        flagcheck = "wb_wtf1998s"
    },
    ["SCRTACHV"] = {
        result = function(cutscene)
            if not Kristal.callEvent("earnedAch", "codebreaker") then
                Kristal.callEvent("completeAchievement", "codebreaker")
                cutscene:text("* Congratulations![wait:10] We're all so proud of you![wait:10] What a crazy achievement!")
            else
                cutscene:text("* Okay,[wait:5] are you fucking done?")
            end
        end
    },
    ["WWC1YEAR"] = { result = "dinder" },
    ["#1YRDXYN"] = { result = "vic" },	-- If you find this before the announcement, please keep quiet about this.
										-- Otherwise, I'll have no choice but to put you in Europa rain.
    ["SLIDER"] = { result = "slider_start" },
    ["PIKNF404"] = {
        result = function(cutscene)
            cutscene:text("* Area not complete yet,[wait:5] check back in a later commit.[wait:10] -BrendaK7200")
        end
    },
    ["CASTLERD"] = {result = "castle_path/start"},
    ["WORKSHOP"] = {
        result = "christmas/outside/outside_1",
        marker = "warp",
        -- Christmas event
        cond = function()
            local date = os.date("*t")
            if (date.month == 12 and date.day >= 1) or (date.month == 1 and date.day <= 6) then
                return true
            end
        end,
        on_fail = function(cutscene)
            cutscene:text("* The warp exists,[wait:5] but is only available on certain days.")
        end
    },
    ["FREEWLLY"] = {
        result = function(cutscene)
            if not Utils.containsValue(Game:getFlag("party"), "whale") then
                Mod:unlockPartyMember("whale")
                cutscene:text("* You unlocked the fucking whale!")
            else
                cutscene:text("* But you already had the whale.")
            end
        end,
    }
}
local gray_area_info = {
    result = function(cutscene)
        Game:setFlag("greyarea_exit_to", {Game.world.map.id, Game.world.player.x, Game.world.player.y})
        cutscene:text("[voice:none][instant]* OPEN[stopinstant] [wait:10]\n[instant]YOUR[stopinstant] [wait:10]\n[instant]EYES[stopinstant] [wait:0.1]\n", nil, nil, {auto = true, skip = false})
        cutscene:after(function()
            Game.world:loadMap("greyarea", "entry")
        end)
    end,
}
Mod.warp_bin_codes["GRAYAREA"] = gray_area_info
Mod.warp_bin_codes["GREYAREA"] = gray_area_info

-- heres some new totally cool helper functions wowee

--- get a Bin Code's info
---@param code WarpBinCode
---@return WarpBinCodeInfo info
function Mod:getBinCode(code)
    code = code:upper()

    return Mod.warp_bin_codes[code]
end

-- if you were looking for addBinCode... just tamper with the table on your own

-- the actual logic is implemented in scripts/world/cutscenes/warp_bin.lua
