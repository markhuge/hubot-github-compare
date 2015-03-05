chai  = require 'chai'
sinon = require 'sinon'

chai.use require 'sinon-chai'

expect = chai.expect

Robot       = require 'hubot/src/robot'
TextMessage = require('hubot/src/message').TextMessage

describe 'Github Compare', ->
  robot   = {}
  user    = {}
  adapter = {}
  spies   = {}

  beforeEach (done) ->
    robot = new Robot null, 'mock-adapter', false, 'hubot'

    robot.adapter.on 'connected', =>
      spies.respond = sinon.spy(robot, 'respond')
      
      require('../scripts/compare')(robot)

      user = robot.brain.userForId '1', {
        name: 'user'
        room: '#test'
      }

      adapter = robot.adapter

    robot.run()
    done()

  afterEach ->
    robot.shutdown()

  describe 'listeners', ->
    it 'registered listener', ->
      expect(spies.respond).to.have.been.calledWith(/compare (?:me )?([\w-.\/]+) ([\w-.\/]+) (?:to )?([\w-.\/]+)/i)


   describe 'supported match permutations', ->
     it 'compare me org/repo branch1 to branch2', (done) ->
      adapter.on 'send', (obj, msg) ->
        expect(msg[0]).to.equal('https://github.com/org/repo/compare/branch1...branch2')
        done()
      adapter.receive(new TextMessage user, 'hubot compare me org/repo branch1 to branch2')
    
     it 'compare org/repo branch1 to branch2', (done) ->
       adapter.on 'send', (obj, msg) ->
         expect(msg[0]).to.equal('https://github.com/org/repo/compare/branch1...branch2')
         done()
       adapter.receive(new TextMessage user, 'hubot compare org/repo branch1 to branch2')
    
     it 'compare org/repo branch1 branch2', (done) ->
       adapter.on 'send', (obj, msg) ->
         expect(msg[0]).to.equal('https://github.com/org/repo/compare/branch1...branch2')
         done()
       adapter.receive(new TextMessage user, 'hubot compare org/repo branch1 branch2')
     
     it 'compare org/repo 1.2.3 1.2.4', (done) ->
       adapter.on 'send', (obj, msg) ->
         expect(msg[0]).to.equal('https://github.com/org/repo/compare/1.2.3...1.2.4')
         done()
       adapter.receive(new TextMessage user, 'hubot compare org/repo 1.2.3 1.2.4')
     
