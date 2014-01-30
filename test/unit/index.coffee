assert       = require 'assert'
should       = require 'should'
sinon        = require 'sinon'

Mailer       = require "../../src/index"

describe "Mailer", ->
  emailTo = 'toto@toto.com'
  emailFrom = 'no-reply@toto.com'
  locale = 'en'
  mailer = {}

  createMailer = (templateRootDir) ->
    mailer = new Mailer("Sendmail", templateRootDir)
    mailer.doSendMail = sinon.stub(mailer, 'doSendMail', (mailOptions, callback) -> return callback(null, {}))
    return mailer

  checkSendMailArgs = (args, textVariables) ->
    objectData = args[0][0]
    assert.equal emailFrom, objectData.from
    assert.equal emailTo, objectData.to
    for variable in textVariables
      assert new RegExp(variable).test(objectData.text), variable + ' should be in text body'
    for variable in textVariables
      assert new RegExp(variable).test(objectData.html), variable + ' should be in html body'

  describe "getTemplatesDir", ->
    it "should get write path if last slash is not present", () ->
      templateRootDir = require('path').join(__dirname, './templates')
      mailer = createMailer templateRootDir
      assert.equal(mailer.getTemplatesDir(locale), require('path').join(__dirname, './templates') + '/' + locale)
    it "should get write path if last slash is present", () ->
      templateRootDir = require('path').join(__dirname, './templates/')
      mailer = createMailer templateRootDir
      assert.equal(mailer.getTemplatesDir(locale), require('path').join(__dirname, './templates') + '/' + locale)

  describe "sendMail", ->
    it "should send email and insert email body data", (done) ->
      templateRootDir = require('path').join(__dirname, './templates/')
      mailer = createMailer templateRootDir
      bodyData =
        name: 'dummy name'
        url:  'http://dummy-url'
      mailer.sendMail locale, "testTemplateName", 'dummy-subject', emailFrom, emailTo, bodyData, (err, response) ->
        should.not.exists(err)
        assert(mailer.doSendMail.called)
        checkSendMailArgs(mailer.doSendMail.args, bodyData)
        done()
