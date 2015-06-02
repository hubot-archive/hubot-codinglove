# Description:
#   Display meme from "The coding love <http://thecodinglove.com>"
#   or "les joies du code <http://lesjoiesducode.tumblr.com>".
#
# Dependencies:
#   "cheerio": "0.7.0"
#   "he": "0.4.1"
#
# Configuration:
#   None
#
# Commands:
#   hubot [give me some] joy [asshole] - Return a random meme (coding love)
#   hubot last joy - Returns last meme (coding love)
#   hubot [spread some] love - Return a random meme (coding love)
#   hubot last love - Returns last meme (coding love)
#   hubot [donne moi de la] joie [bordel] - Returns a random meme (text and image)
#   hubot {dernière|derniere} joie - Returns last meme (text and image).
#
# Author:
#   Eunomie
#   Based 9gag.coffee by EnriqueVidal

cheerio = require('cheerio')
he = require('he')

module.exports = (robot)->
  robot.respond /(donne moi de la )?joie( bordel)?/i, (message)->
    send_new_meme message, 'http://lesjoiesducode.fr/random', (text)->
      message.send text
  robot.respond /derni[èe]re joie/i, (message)->
    send_new_meme message, 'http://lesjoiesducode.fr', (text)->
      message.send text
  robot.respond /((give me|spread) some )?(joy|love)( asshole)?/i, (message)->
    send_meme message, 'http://thecodinglove.com/random', (text)->
      message.send text
  robot.respond /last (joy|love)/i, (message)->
    send_meme message, 'http://thecodinglove.com', (text)->
      message.send text

send_new_meme = (message, location, response_handler)->
  url = location

  message.http(url).get() (error, response, body)->
    return response_handler "Sorry, something went wrong" if error

    if response.statusCode == 302 || response.statusCode == 301
      location = response.headers['location']
      return send_new_meme(message, location, response_handler)

    img_src = get_meme_image(body, ".ljdc-posts .blog-post .blog-post-content img")

    txt = get_meme_txt(body, ".ljdc-posts .blog-post h1.blog-post-title a")
    if txt == ''
      txt = get_meme_txt(body, ".ljdc-posts .blog-post h1.blog-post-title")

    txt = txt.replace(/[\n\r]/g, '')

    response_handler "#{txt}"
    response_handler "#{img_src}"

send_meme = (message, location, response_handler)->
  url = location

  message.http(url).get() (error, response, body)->
    return response_handler "Sorry, something went wrong" if error

    if response.statusCode == 302 || response.statusCode == 301
      location = response.headers['location']
      return send_meme(message, location, response_handler)

    img_src = get_meme_image(body, ".post img")

    txt = get_meme_txt(body, ".post h3")

    response_handler "#{txt}"
    response_handler "#{img_src}"

get_meme_image = (body, selector)->
  $ = cheerio.load(body)
  $(selector).first().attr('src').replace(/\.jpe?g/i, '.gif')

get_meme_txt = (body, selector)->
  $ = cheerio.load(body)
  he.decode $(selector).first().text()
