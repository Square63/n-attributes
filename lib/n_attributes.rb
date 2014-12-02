require "n_attributes/version"

module NAttributes
  require 'n_attributes/railtie' if defined?(Rails)
  def self.ipsum
    "Lorem ipsum dolor sit amet, consectetur adipisicing ...."
  end
end
