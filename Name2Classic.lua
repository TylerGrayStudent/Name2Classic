Name2Classic  = LibStub("AceAddon-3.0"):NewAddon(	"Name2Classic",
												"AceConsole-3.0",
												"AceEvent-3.0",
												"AceHook-3.0");

function Name2Classic:OnInitialize()
	-- Load our database.
	-- self.db = LibStub("AceDB-3.0"):New("Name2ChatDB", Defaults, "Default")

	-- Set up our config options.
	-- local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)

	-- local config = LibStub("AceConfig-3.0")
	-- config:RegisterOptionsTable("Name2Chat", SlashOptions, SlashCmds)

	-- local registry = LibStub("AceConfigRegistry-3.0")
	-- registry:RegisterOptionsTable("Name2Chat Options", Options)
	-- registry:RegisterOptionsTable("Name2Chat Profiles", profiles);

	--  local dialog = LibStub("AceConfigDialog-3.0");
	--  self.optionFrames = {
	--  	main = dialog:AddToBlizOptions(	"Name2Chat Options", "Name2Chat"),
	--  	profiles = dialog:AddToBlizOptions(	"Name2Chat Profiles", "Profiles", "Name2Chat");
	--  }

	-- Hook SendChatMessage function
	self:RawHook("SendChatMessage", true)

	-- get current character name
	-- character_name, _ = UnitName("player")

	-- self:Safe_Print(L["Loaded"])
end

function Name2Classic:SendChatMessage(msg, chatType, language, channel)
    -- if  (chatType == "GUILD")
    -- then
        msg = "(" .. "Jewels" .. "): " .. msg 
	-- Call original function
	self.hooks.SendChatMessage(msg, chatType, language, channel)
end