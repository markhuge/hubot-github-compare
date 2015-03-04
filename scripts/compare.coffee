# Description:
#  Generates a GitHub comparison URL
#
# Configuration:
#   HUBOT_GITHUB_USER - GitHub org/user to use if none explicitly given
#
# Commands:
#   hubot compare me <repo> <treeish> <treeish> - Reply with url to github compare page
#
# Notes:
#   None
#
# Author:
#  markhuge

user = process.env.HUBOT_GITHUB_USER

module.exports = (robot) ->
  robot.respond /compare (?:me )?([\w-.\/]+) ([\w-.\/]+) (?:to )?([\w-.\/]+)/i, (msg) ->
    [_, repo, from, to] = msg.match

    if '/' not in repo
      if user
        repo = "#{user}/#{repo}"
      else
        return # not a valid repo, so stay silent

    msg.send "https://github.com/#{repo}/compare/#{from}...#{to}"
