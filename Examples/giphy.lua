local coro = require("coro-http")

local discordia = require("discordia")
local client = discordia.Client()

local json = require("json")

discordia.extensions()

function auditLog()
	local open = io.open("loggedServers.json", "r")
	local parse = json.parse(open:read())
	open:close()

	local res, data = coro.request("GET", "https://api.giphy.com/v1/gifs/random?api_key= api_key_here ")
	local data = string.split((tostring(data)),'"')

	print("GIPHY URL :: 'https://giphy.com/media/"..data[10].."/giphy.gif'")
	message:reply {
		embed = {
			image = { 
				url  = "https://media4.giphy.com/media/"..tostring(data[10]).."/200.gif" 
			},

			author = {
				name = "Powered by Giphy",
				icon_url = "https://cdn.discordapp.com/attachments/741617853505077320/761713715518767125/ezgif-3-9e0f1be09387.gif"
			},

			timestamp = discordia.Date():toISO("T","Z"),
			color = 0x000000
		}
	}
end

client:run("Bot "..io.open("./token.txt"):read())