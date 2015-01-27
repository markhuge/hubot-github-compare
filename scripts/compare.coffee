# Description:
#  Returns a github release/branch comparison URL for a
#
# Configuration:
#   HUBOT_GITHUB_USER
#
# Commands:
#   hubot compare me <repo> <release/branch> <release/branch> - Reply with url to github compare ¬
#
# Author:
#  markhuge 

user = process.env.HUBOT_GITHUB_USER
module.exports = (robot) ->
  if user
    robot.respond ///
        compare\ me\ (:?#{user}\/)*([\w-]+)\ ([\w\.\/\\-]+)\s([\w\.\/\\-]+)
      ////i, (msg) ->
      msg.send "https://github.com/#{user}/#{msg.match[2]}/compare/#{msg.match[3]}...#{msg.match[4]}"

    robot.respond ///
        compare\ me\ ([^#{user}][\w-]+\/[\w-]+)\ ([\w\.\/\\-]+)\s([\w\.\/\\-]+)
      ///i, (msg) ->
      msg.send "https://github.com/#{msg.match[1]}/compare/#{msg.match[2]}...#{msg.match[3]}"
  
  else
    robot.respond /compare me ([\w-]+\/[\w-]+) ([\w\.\/\\-]+)\s([\w\.\/\\-]+)/i, (msg) ->
      msg.send "https://github.com/#{msg.match[1]}/compare/#{msg.match[2]}...#{msg.match[3]}"
