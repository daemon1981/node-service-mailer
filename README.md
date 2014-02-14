# node-service-mailer [![Build Status](https://secure.travis-ci.org/daemon1981/node-service-mailer.png)](https://travis-ci.org/daemon1981/node-service-mailer)

## Description

Making simple mailer service for node

Using great libraries:
 - [nodemailer](https://github.com/andris9/Nodemailer)
 - [node-email-templates](https://github.com/niftylettuce/node-email-templates)

## Installation

```
$ npm install node-service-mailer
```

## Overview

### Add plugin to a schema

```
var mailer = new Mailer("Sendmail", '/path/to/template');
mailer.sendMail('meLOCALE', "templateName", "Email Subject", 'email@from.com', 'email@to.com'[, {}], callback);
```

### Set your templates

```
path/
  to/
    template/
      meLOCALE/
        templateName/
          html.ejs
          text.ejs
```

### Specifications

Please see the [specifications here](https://github.com/daemon1981/node-service-mailer/blob/master/test-unit.md)

### Projects using node-service-mailer

 - [Workbook](https://github.com/eleven-labs/Workbook)
 - [Express Application Seed](https://github.com/daemon1981/express-application-seed)
