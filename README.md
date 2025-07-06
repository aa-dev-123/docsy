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
rails generate devise User
```
- The above command will generate the user migration which has all the settings for devsie availablle module.