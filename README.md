# ZQuickblox

This gem is a Quickblox API client in Ruby. Normally, we will use Javascript or mobile SDK, but in some cases where server needs to control things, this gem will play its role.

Currently this gem ONLY supports creating users on Quickblox (used for signing up user).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zquickblox'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zquickblox

## Usage

You need to generate an initializer for ZQuickblox in order to config your Quickblox app:

```ruby
rails generate zquickblox
```

To create a new user, just call:

```ruby
ZQuickblox::User.create({email: "abc@email.com", password: "a_password"})
```

There are more params for you to set:

```ruby
login, password, email, blob_id, external_user_id, facebook_id, twitter_id, full_name, phone, website
```

## Error handling

During the API processing, errors may occur. In such cases, `ZQuickblox::Error` (subclass of StandardError) will be thrown with `messages` as an array of string error messages.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zelic91/zquickblox. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
