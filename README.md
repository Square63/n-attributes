# NAttributes (0.2.9)

A gem that allows you to create a field inside a model that allows you to store arbitrary n number of attributes against a specified field

## Installation

Add this line to your application's Gemfile:

    gem 'n_attributes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install n_attributes

## Usage

###rake command:

    $ rake add_n_attributes model=Model field=field_name

  e.g.

    $ rake add_n_attributes model=User field=address

###Model

Include these lines in your model.rb:

    n_attribute_keys :field_name, key1, key2, .....

e.g.

Your model is user.rb:

    n_attribute_keys :address, :country, :city, ....

###Setter

Set key value pair:

    model.key1 = value1
    model.key2 = value2
    #=> field = {"key1" => "value1", ....}

e.g.

    u = User.new
    u.country = "Pakistan"
    u.city = "Lahore"
No need to save, gem will do it for you.

###Getter

Get value of key:

    model.key1
    #=> value1

    model.key2
    #=> value2

For all

    model.field_name
    {"key1" => "value1", ....}

e.g.

    u = User.last
    u.country
    #=>Pakistan
    u.city
    #=>Lahore

###Note

    This gem only works on a single field in a Model.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/n_attributes/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
