local discordia = require("discordia")
local client = discordia.Client()

function suggestions(message, temp)
	local gs = client:getGuild("guildId"):getChannel("channelId") --// change guild and channel id's to match your server

	gs:send {
		embed = {
			--// optional :: title = "New Suggestion", (looks cleaner without)
			description = temp,
			author = {
				name = message.author.username,
				icon_url = message.author.avatarURL
			},

			timestamp = discordia.Date():toISO("T","Z")
		}
	}


	message:delete()
end

client:on("messageCreate", function(message)
	local content = message.content
  local args = content.split(" ")
  if argsc[1] == "~suggest" then
    table.remove(args, 1)
    
    local tempMessage = table.concat(args)
    suggestion(message, tempMessage)
  end
end)

client:run("Bot "..io.open("./mtoken.txt"):read())
