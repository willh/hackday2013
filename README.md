#NHS Hackday 2013

## Introduction

BEST - Bedside Event Reporting Tool

A mobile friendly web site for patients and families to report safety
concerns.

Doctors, nurses and hospital staff often don't notice or have time to
fix problems that patients and families see in wards and medical
facilities everyday. This web site gives them an quick and easy way to
report these issues and have them recorded as structured data which can
be analysed and used to improve conditiions. 

By identifying commonly reported issues hospitals can target areas for 
improvement, helping patient care and saving time and money from 
being wasted on reoccuring incidents.

## Deploying to Heroku

Download and install the Heroku toolkit and run the following commands.

Login and create the app:
> heroku login
> heroku create
Add the postgres addon and set the DB URL as DATABASE_URL environment
variable
> heroku addons:add heroku-postgresql
> heroku pg:promote HEROKU_POSTGRESQL_MYDBFROMPREVCOMMAND_URL
Deploy the app to heroku
> git push heroku master
