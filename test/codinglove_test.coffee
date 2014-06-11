chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'codinglove', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../src/codinglove')(@robot)

  it 'registers respond listeners', ->
    expect(@robot.respond.args[0][0].toString()).to.equal("/(donne moi de la )?joie( bordel)?/i")
    expect(@robot.respond.args[1][0].toString()).to.equal("/derni[èe]re joie/i")
    expect(@robot.respond.args[2][0].toString()).to.equal("/(give me some )?joy( asshole)?/i")
    expect(@robot.respond.args[3][0].toString()).to.equal("/last joy/i")
