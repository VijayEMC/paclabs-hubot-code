# Description:
#    A central location to place all random responses that make life entertaining.
#
# Dependencies:
#    NONE
#
# Configuration:
#    NONE
#
# Commands:
#     good robot - Accepts the compliment
#
# Notes:
#    NONE
#
# Author:
#    quickjp2


module.exports = (robot) ->
  robot.hear /good robot/i, (msg) ->
    msg.send "Why thank you, I aim to please my SE Team. Also let my creator JP know that I am doing well!"
  robot.hear /sandwich/i, (msg) ->
    msg.send "Did someone say sandwich?"
  robot.hear /hi (\w+)/i, (msg) ->
    name = msg.match[1]
    if name is "commander"
      msg.send "Well hello there @#{msg.message.user.name}"

  # Send periodic message to slack to keep self alive
  cronJob = require('cron').CronJob
  tz = 'America/Los_Angeles'
  new cronJob('0 0 6 * * 1-7', stayingAlive, null, true, tz)

  stayingAlive = ->
    robot.send {room: "commander-chat"}, "STAYING ALIVE!!"
