# Description:
#  Generates a GitHub comparison URL
#
# Configuration:
#   HUBOT_GITHUB_USER - GitHub org/user to use if none explicitly given
#   HUBOT_GITHUB_API  - (optional) Override for github enterprise. Ex: https://github.myshiz.biz
#   
# Commands:
#   hubot compare me <repo> <treeish> <treeish> - Reply with url to github compare page
#
# Notes:
#   None
#
# Author:
#  markhuge


module.exports = (robot) ->
  robot.respond /compare (?:me )?([\w-.\/]+) ([\w-.\/]+) (?:to )?([\w-.\/]+)/i, (msg) ->
    [_, repo, from, to] = msg.match
    user = process.env.HUBOT_GITHUB_USER
    host = process.env.HUBOT_GITHUB_API || 'https://github.com'

    if '/' not in repo
      if user
        repo = "#{user}/#{repo}"
      else
        return # not a valid repo, so stay silent

    msg.send "#{host}/#{repo}/compare/#{from}...#{to}"
