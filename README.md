# ExpertFinder

### [Basic info](#basic-info)

- Ruby version: ruby 2.7.2

- Rails version: Rails 6.1.3

- System dependencies: see [Gemfile](./Gemfile)

### [Configuration](#configuration)

1. `bundle install`

2. `rails db:create`

3. `rails db:migrate`

4. `rails db:seed`

### [TO-DO List](#to-do-list)
1. init app, add Gems, setup environment, set up a UI framework
2. be able to create members
3. be able to generate short_url based on website_url members provided
4. be able to pull headings into DB based on website_url members provided
5. be able to make friends, bi-directional friendship
6. be able to search expert from none-friend
7. add login/signup with devise gem(not finished)
8. test out the services(not finished)

### [Testing](#testing)

`rails test`

# a scenario of testing expert search
1. go to Marge's page, scroll to bottom
2. search for "healthcare"
3. you should see "Marge > Homer > Bart" since homer is a mutual friend of both and bart has a "healthcare" topic
4. if you create a new user with no friendship, and search the same "healthcare" under his Profile. you should still see Bart's name, plus "No mutual friends found" sign


# my design of friendship feature
1. under each member's profile, list all other members, can add friendship with none friends, can remove friendship with existing friends
