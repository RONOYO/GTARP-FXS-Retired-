--[[-----------------------------------------------------------------------

	ActionMenu - Version 1.0.1
	Created by WolfKnight
	Additional help from TheStonedTurtle, Briglair, and lowheartrate.

	NOTE: This is an example resource, which you must add to in order for
	it to become useable in your server/gamemode. Each area has been
	commented for your understanding.

-----------------------------------------------------------------------]]--

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "nui/ui.html"

files {
	"nui/ui.html",
	"nui/ui.js",
	"nui/ui.css",
	"nui/Roboto.ttf"
}

client_script 'cl_action.lua'
