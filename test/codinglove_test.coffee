chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'codinglove', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../src/codinglove')(@robot)

  it 'registers a respond listener to last meme from thecodinglove', ->
    expect(@robot.respond).to.have.been.calledWith(/last joy/)

  it 'registers a respond listener to random meme from thecodinglove', ->
    expect(@robot.respond).to.have.been.calledWith(/(give me some )?joy( asshole)?/)

  it 'registers a respond listener to last meme from lesjoiesducode', ->
    expect(@robot.respond).to.have.been.calledWith(/derni[eè]re joie/)

  it 'registers a respond listener to random meme from lesjoiesducode', ->
    expect(@robot.respond).to.have.been.calledWith(/(donne moi de la )?joie( bordel)?/)
