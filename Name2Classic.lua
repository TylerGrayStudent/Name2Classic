Name2Classic = LibStub("AceAddon-3.0"):NewAddon("Name2Classic", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0");

local Options = {
    type = "group",
    get = function(item)
        return Name2Classic.db.profile[item[#item]]
    end,
    set = function(item, value)
        Name2Classic.db.profile[item[#item]] = value
    end,
    args = {
        name = {
            order = 1,
            type = "input",
            name = "Name",
            desc = "Name to be used"
        },
        enable = {
            order = 2,
            type = "toggle",
            name = "Enable",
            desc = "Enables the addon's functionallity."
        }
    }
}

local Defaults = {
    profile = {
        enable = true
    }
}

local SlashOptions = {
    type = "group",
    handler = Name2Classic,
    get = function(item)
        return Name2Classic.db.profile[item[#item]]
    end,
    set = function(item, value)
        Name2Classic.db.profile[item[#item]] = value
    end,
    args = {
        name = {
            type = "input",
            name = "Name",
            desc = "Name to be used"
        },
        enable = {
            type = "toggle",
            name = "Enable",
            desc = "Enables the addon's functionallity."
        },
        config = {
            type = "execute",
            name = "config",
            desc = "config_desc",
            func = function()
                InterfaceOptionsFrame_OpenToCategory(Name2Classic.optionFrames.main)
            end
        }
    }
}

local SlashCmds = {};

local character_name

function Name2Classic:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("Name2ClassicDB", Defaults, "Default")

    local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)

    local config = LibStub("AceConfig-3.0")
    config:RegisterOptionsTable("Name2Classic", SlashOptions, SlashCmds)

    local registry = LibStub("AceConfigRegistry-3.0")
    registry:RegisterOptionsTable("Name2Classic Options", Options)

    local dialog = LibStub("AceConfigDialog-3.0");
    self.optionFrames = {
        main = dialog:AddToBlizOptions("Name2Classic Options", "Name2Classic")
    }

    self:RawHook("SendChatMessage", true)

    character_name, _ = UnitName("player")

    self:Safe_Print("Loaded.")
end
function Name2Classic:SendChatMessage(msg, chatType, language, channel)
    if (self.db.profile.enable) then
        if (self.db.profile.name ~= nil) then
            msg = "(" .. self.db.profile.name .. ") " .. msg
        end
    end
    self.hooks.SendChatMessage(msg, chatType, language, channel)
end

function Name2Chat:Safe_Print(msg)
    if self.db.profile.debug then
        self:Print(msg)
    end
end
