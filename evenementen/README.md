# Internet Technologie: Practicum web-API's

Authors: **Jasper D'haene**, **Florian Dejonckheere**

## Installation

### Local

Run the following commands:
```
$ export RAILS_ENV=development
$ bundle install [ --path vendor/bundle ]
$ rake db:create
$ rake db:schema:load
$ rake db:seed
$ rails server [ -p 3000 ]
```

### Docker

If you use Docker, first build the image:
```
$ docker -t floriand/eventman .
```

Then run it:
```
$ docker run -d --name eventman -p 127.0.0.1:3000:3000 floriand/eventman
```

The Rails server is now running on http://localhost:3000/.
