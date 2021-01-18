local coro = require("coro-http")

local discordia = require("discordia")
local client = discordia.Client()

local json = require("json")

discordia.extensions()

client:on("messageCreate", function(message)
	local content = message.content
	if content == "!giphy" then
		local res, data = coro.request("GET", "https://api.giphy.com/v1/gifs/random?api_key=6EHiVUUwueOxkhBRmg5FGDzuAUSNbSiH")
		local key,value = unpack(res)
		local datvar = string.split((tostring(data)),'"')

		print("GIPHY URL :: 'https://giphy.com/media/"..datvar[10].."/giphy.gif'")
		message:reply {
			embed = {
				image = { 
					url  = "https://media4.giphy.com/media/"..tostring(datvar[10]).."/200.gif" 
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
end)

client:run("Bot "..io.open("./mtoken.txt"):read())
