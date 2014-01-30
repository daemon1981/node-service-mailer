# node-service-mailer [![Build Status](https://secure.travis-ci.org/daemon1981/node-service-mailer.png)](https://travis-ci.org/daemon1981/node-service-mailer)

## Description

Add common user fonctionnality to document

## Installation

```
$ npm install node-service-mailer
```

## Overview

### Add plugin to a schema

```
var mailer = new Mailer("Sendmail", '/path/to/template');
mailer.sendMail(req.locale, "signup", "Please validate your account", 'email@from.com', 'email@from.com', callback);
```

### Specifications

Please see the [specifications here](https://github.com/daemon1981/node-service-mailer/blob/master/test-unit.md)

### Projects using node-service-mailer

 - [Workbook](https://github.com/eleven-labs/Workbook)
 - [Express Application Seed](https://github.com/daemon1981/express-application-seed)
