import Danger
import DangerSlack

let danger = Danger()
let service = SlackService()

service.notify(channel: "General", text: "Bot is working")
service.notifyPrivately(email: "silva98.bernardo@gmail.com", text: "We did it!")
