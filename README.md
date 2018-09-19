# PetPicker: Rails API

The application is a RESTful Rails API that stores and serves user and pet information using JSON for a React front-end deployed [here](https://pet-picker.herokuapp.com/). The API endpoints are deployed [here](https://pet-picker-api.herokuapp.com/). 

## Local Set Up

If you'd like to contribute or run our test suite, run through the following commands:

* Clone this application:
```
git clone
cd PetPicker
```
* Run Bundle to install the gemfile:
```ruby
bundle install
bundle update
```
* Create and seed the database:
```ruby
rake db:create
rake db:migrate
rake db:seed
```
* Run the test suite:
```ruby
rspec
```

## Endpoints
If you would like to consume our data these are the following endpoints that are available:

All endpoints begin with: 
```ruby
https://pet-picker-api.herokuapp.com/api/v1/
```
## Built With

* [Ruby](https://www.ruby-lang.org/en/) - Programming language
* [Rails](https://rubyonrails.org/) - Framework

## Authors

* **Tyler Westlie** - *Initial work* - [Github](https://github.com/tywestlie)
* **Steve Schwedt** - *Initial work* - [Github](https://github.com/apoc64)
* **Theresa Marquis** - *Initial work* - [Github](https://github.com/tmcjunkinmarquis)
