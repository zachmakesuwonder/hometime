##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Use [RVM](https://rvm.io/rvm/install) or [RBENV](https://github.com/rbenv/rbenv) to install multiple ruby versions
- Ruby [2.7.7p221]
- Rails [7.0.7]

##### 1. Check out the repository

```bash
git clone git@github.com:zachmakesuwonder/hometime.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000/api/v1/reservations

##### 4. Running the test

To run all test

```ruby
rspec
```