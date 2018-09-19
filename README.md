# PetPicker: Rails API

The application is a RESTful Rails API that stores and serves user and pet information using JSON for a React front-end deployed [here](https://pet-picker.herokuapp.com/). The API endpoints are deployed [here](https://pet-picker-api.herokuapp.com/). The app is designed to create connections between pet owners and pet adopters, by allowing adopters to 'like' or 'nope' a series of pets.

## Tools Used

* Ruby 2.4.1
* Rails 5.2.1
* PostgreSQL

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
```
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
```
https://pet-picker-api.herokuapp.com/api/v1/
```
```POST /users```

Creates a user with params:  

```{user: {name: "bob", password: "1234", description: "I like puppies", pic: "http://www.site.com/mypic.png", role:adopter}}```

Role is an enum including owner and adopter. Anything other than owner will create an adopter  

```PATCH /users/:id``` - Updats a user with the same params

```GET /users``` - Logs in a user by checking a password against a secure hashed database with params:

```{name: "bob, password: "1234"}```

```DELETE /users/:id``` - updates the user

```POST /users/:id/pets``` - creates a pet with params:

```{pet: {name: "fido", species:"dog", description: "I'm a puppy", pic: "http://www.site.com/puppypic.png"}}```

```GET /users/:id/pets``` - Gets up to 10 pets that the user has not seen before

```GET /users/:id/matches``` - Gets 'matches' - for an owner, this is the adopters that have likes their pets
for an adopter, this is the pets that they have liked and the owner has matched them for

```POST /users/:user_id/matches/:match_id``` - An adopter changes the connection with an adopter from a 'like' to a 'match'

```POST /users/:id/connections``` - adopter like a pet with params:

```{pet_id: 1}```

```DELETE /users/:id/connections``` - adopter nopes a pet with same params.

## Authors

* **Tyler Westlie** - *Initial work* - [Github](https://github.com/tywestlie)
* **Steve Schwedt** - *Initial work* - [Github](https://github.com/apoc64)
* **Theresa Marquis** - *Initial work* - [Github](https://github.com/tmcjunkinmarquis)
