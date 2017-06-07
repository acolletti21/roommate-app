## RooMe

RooMe is a web app that takes the hard work out of finding new roommates. Chicagoans
can sign up, fill out their profile, and instantly get matched with compatible roommates who
are interested in living in the same neighborhoods. Matches are sorted by percentage
based on their profile survey answers. RooMe utilizes data gathered from Zillow so users
can easily browse apartment listings. An interactive SVG map allows them to narrow down
their search results using AngularJS. The addition of Twilio’s API lets users send a text
message with their contact information to potential matches.


## Setup

```
bundle
```

```
rake:db migrate
```

to populate apartment listings, uncomment the seed file and run

```
rake db:seed
```

If you want to try the sms message feature, you'll need your own twilio credentials. You can run

```
bundle exec figaro install
```

and include you authorization info in the application.yml file

```
TWILIO_ACCOUNT_SID = ''
TWILIO_AUTH_TOKEN = ''
TWILIO_NUMBER= '' 
 ```
you can then send a text by putting your phone number in a user's profile and sending a message using the button on their profile page.
