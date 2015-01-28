Title:Rails 3 et cucumber
Date:2011-08-30
Tags:  mediawiki

quelques notes sur la création d'un projet rails 3 avec des tests en
cucumber.

L'objectif c'est de transformer ces notes en un magifique Tutorial.

Générer un projet sans tests

` rails new projet -T`

`vi Gemfile`\
`group :development, :test do`\
`  gem 'rspec-rails'`\
`  gem 'cucumber-rails'`\
`  gem 'database_cleaner'`\
`end`\
`bundle install`\
`rails generate cucumber:install --rspec --capybara`

     vi features/browse_users.feature
     Feature: Browse users
      So that I can browse through users
      As an administrator
      I want to be able to see choose a user from a full list of users and update it

      Scenario: Browsing a list of users
        Given a user with the name "Prénom Nom" and email "prenom.nom@gmail.com"
        And a user with the name "Test Cumcuber" and email "test.cucumber@example.com"
        When I am on the users page
        Then I should see "Prénom Nom"
        And I should see "Test Cumcuber"

`vi features/step_definitions/appl.rb`\
`Given /^a user with the name "([^"]*)" and email "([^"]*)"$/ do |name, email|`\
`  User.create!(:name => name, :email => email)`\
`end`

`rake features`

`rails generate scaffold User name:string email:string`\
`rake db:migrate`\
`rake features`

