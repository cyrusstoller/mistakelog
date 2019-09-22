# Mistake Log

## Goal

Mistake Log is an open source project to help you track and reflect on your mistakes and failures.
To improve, you first need to figure out what needs to be improved.
Mistake Log will help you reflect on your patterns of behavior.

## Dependencies

* Ruby v2.6.2
* Postgresql v11+
* Node 10.12

## Installation

For local development you need to run the following commands:

```bash
bundle install
yarn install
rake db:create # first time only
rake db:migrate
foreman start # option 1
heroku local:start # option 2

rake send_notifications # to send reminder emails
```

To run the test environment locally you can run any of the following commands:

```bash
heroku local:run bundle exec guard
foreman run bundle exec guard # to run tests whenever files are saved
rake test
```

To run a production environment on Heroku be sure to install the following add-ons:

* Sendgrid (https://elements.heroku.com/addons/sendgrid)
* Scheduler (https://elements.heroku.com/addons/scheduler)

Once these have been installed add the following system configuration:

```bash
SENDGRID_USERNAME=XYZ
SENDGRID_PASSWORD=XYZ
DOMAIN=mistakelog.com
GA_ID=XYZ
```

## Contributing

If you find a bug or something that could improve the user experience, please file an issue on this github project,
so our contributors/maintainers can get started fixing them. :-)

Even if you plan on filing a patch for the issue yourself it'd be great if you could still file an issue so that we
don't have people duplicating work unnecessarily.

### Submitting Pull Requests

1. Fork this project
2. Make a feature branch `git checkout -b feature`
3. Make your changes and commit them to your feature branch
4. Submit a pull request
