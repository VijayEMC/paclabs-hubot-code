fs = require 'fs'
http = require 'http'

module.exports = (robot) ->
  robot.respond /token/i, (msg) ->
    data = {"username":"administrator@vshpere.local","password":"Iamadmin!","tenant":"vshpere.local"}
    robot.http("https://vcac.bellevue.lab/api/tokens")
      .header('Content-Type', 'application/json')
      .post(data) (err, res, body) ->
        if err
          robot.logger.info "Encountered an error: #{err}"
          return
        else
          robot.logger.info "We got back: #{body}"
          fs.writeFile "./scripts/authToken.json", JSON.stringify(body), (error) ->
            if error
              robot.logger.info "Encounterd an error: #{error}"
