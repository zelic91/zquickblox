# ZQuickblox  [![Gem Version](https://badge.fury.io/rb/zquickblox.svg)](https://badge.fury.io/rb/zquickblox) [![Build Status](https://travis-ci.org/zelic91/zquickblox.svg?branch=master)](https://travis-ci.org/zelic91/zquickblox)

This gem is a Quickblox API client in Ruby. Normally, we will use Javascript or mobile SDK, but in some cases where server needs to control things, this gem will play its role.

Currently this gem ONLY supports creating users on Quickblox (used for signing up user) and creating / updating chat dialog (used for backend's need).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zquickblox'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zquickblox

## Config

### Rails

You need to generate an initializer for ZQuickblox in order to config your Quickblox app:

```ruby
rails generate zquickblox
```

### Others

You need to config your Quickblox as below:

```ruby
ZQuickblox.configure do |config|
  config.app_id      = ENV['QB_APP_ID']
  config.auth_key    = ENV['QB_AUTH_KEY']
  config.auth_secret = ENV['QB_AUTH_SECRET']
end
```

## Usage

To create a new user, just call:

```ruby
ZQuickblox::User.create({email: "abc@email.com", password: "a_password"})
```

There are more params for you to set:

```ruby
login, password, email, blob_id, external_user_id, facebook_id, twitter_id, full_name, phone, website
```

To get a user by his login, just call:
```ruby
ZQuickblox::User.find("abc@email.com")
```

The result will be `nil` if the user doesn't exist.


To delete user, call:

```ruby
ZQuickblox::User.delete("user_login", "user_password", "user_id")
```

The result will be `{}` if the account is deletable.


To create a new dialog, just call:

```ruby
ZQuickblox::Dialog.create("user_login", "user_password", {type: 2, name: "Some dialog", occupants_ids: "ids of occupants separated by ,"})
```

To update a dialog (name, photo, occupants_ids), just call:

```ruby
ZQuickblox::Dialog.update("user_login", "user_password", "dialog id", {name: "Some dialog", occupants_ids: "ids of occupants separated by ,"})
```

## Error handling

During the API processing, errors may occur. In such cases, `ZQuickblox::Error` (subclass of StandardError) will be thrown with `messages` as an array of string error messages.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zelic91/zquickblox. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
