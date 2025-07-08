# 🚀 Docsy App
This is an application that has the users and users can create 

## Authentication
- This application is using devise for the authentication.
- It has User model that implement devise.
- Project has used the following commnads to integrate the devsie gem.
```ruby
# adds "devise" gem to the Gemfile
bundle add devise
# This adds setting in config/initializers/devise.rb
rails generate devise:install
# Add following line in config/environments/development.rb
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
# This adds the functionality of devise to the User model
# The below command will generate the user migration which has all the settings for devsie availablle module.
rails generate devise User
# generates the views of the devise model i.e User
rails generate devise:views

```

## ActiveStorage

- TO create three tables run ```bin/rails active_storage:install``` and ```bin/rails db:migrate```.
- Using ActiveStorage on local level
- Service for local and test env are present in config/storage.yml, further these services can be picked in respective environmental files config/environment/development.rb