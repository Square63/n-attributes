# NAttributes

A gem that allows you to create a field inside a model that allows you to store arbitrary n number of attributes against a specified field

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'n_attributes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install n_attributes

## Usage

###rake command:

    $ rake add_n_attributes model=Model field=field_name

  e.g.

    $ rake add_n_attributes model=User field=name

###Model

Include these lines in your model.rb:

    include NAttributes
    n_attributes :field_name

e.g.

your model is user.rb:

    include NAttributes
    n_attributes :name

###Setter

set key value pair:

    Model.field_key = value
    #=> field = {"key" => "value", ....}

###Getter

get value of key:

    Model.field_key
    #=> value

## Contributing

1. Fork it ( https://github.com/[my-github-username]/n_attributes/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
