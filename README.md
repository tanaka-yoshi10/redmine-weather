= redmine-weather

This is a Redmine plugin to show weather informations.

== How to use

Only tested on Redmine 3.0.1 and Ruby 2.2.0. 

  $ cd /path/to/redmine/plugins
  $ git clone https://github.com/tanaka-yoshi10/redmine_weather.git redmine_weather
  $ rake redmine:plugins:migrate RAILS_ENV=production 

Then restart redmine.
