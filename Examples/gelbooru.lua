--[[

  DISCLAIMER ::
  CONTAINS NSFW CONTENT
  
  UNDERAGED USERS ARE NOT ADVISED TO USE THIS!

]]--

local coro = require("coro-http")

local discordia = require("discordia")
local client = discordia.Client()

local json = require("json")

discordia.extensions()

client:on("messageCreate", function(message)
	local content = message.content
	if content == "!giphy" then
		local res,data = coro.request("GET", "https://gelbooru.com/index.php?page=dapi&s=post&q=index&id="..id)
		local key,value = unpack(res)_
		local datvar = string.split((tostring(data)),'"')

		print("HENTAI URL :: "..datvar[14])
		message:reply {
			embed = {
				image = { 
					url  = datvar[14] 
				},

				author = {
					name = "Powered by Gelbooru",
					icon_url = "https://buymyshit.moneygrubbingwhore.com/images/products/3.jpg"
				},

				timestamp = discordia.Date():toSO("T","Z"),
				color = 0x000000
			}
		}
	end
end)

client:run("Bot "..io.open("./mtoken.txt"):read())
