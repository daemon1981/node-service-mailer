# TOC
   - [Mailer](#mailer)
     - [getTemplatesDir](#mailer-gettemplatesdir)
     - [sendMail](#mailer-sendmail)
<a name=""></a>

<a name="mailer"></a>
# Mailer
<a name="mailer-gettemplatesdir"></a>
## getTemplatesDir
should get write path if last slash is not present.

```js
var templateRootDir;
templateRootDir = require('path').join(__dirname, './templates');
mailer = createMailer(templateRootDir);
return assert.equal(mailer.getTemplatesDir(locale), require('path').join(__dirname, './templates') + '/' + locale);
```

should get write path if last slash is present.

```js
var templateRootDir;
templateRootDir = require('path').join(__dirname, './templates/');
mailer = createMailer(templateRootDir);
return assert.equal(mailer.getTemplatesDir(locale), require('path').join(__dirname, './templates') + '/' + locale);
```

<a name="mailer-sendmail"></a>
## sendMail
should send email and insert email body data.

```js
var bodyData, templateRootDir;
templateRootDir = require('path').join(__dirname, './templates/');
mailer = createMailer(templateRootDir);
bodyData = {
  name: 'dummy name',
  url: 'http://dummy-url'
};
return mailer.sendMail(locale, "testTemplateName", 'dummy-subject', emailFrom, emailTo, bodyData, function(err, response) {
  should.not.exists(err);
  assert(mailer.doSendMail.called);
  checkSendMailArgs(mailer.doSendMail.args, bodyData);
  return done();
});
```
