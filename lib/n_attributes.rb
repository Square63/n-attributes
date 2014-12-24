# encoding: utf-8
require "n_attributes/version"

class Object
  def n_attribute_keys(field, *names)
    names.delete(names[0])
    names.each do |key|
      define_method("#{key}=") do |value|
        self.send(field)["#{key}"] = value
        self.save
      end

      define_method("#{key}") do
        self.send(field)["#{key}"]
      end
    end
  end
end

module NAttributes
  require 'n_attributes/railtie' if defined?(Rails)

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def n_attribute_keys(*names)
      serialize names[0], Hash
      Object.n_attribute_keys(names[0], *names)
    end
  end
end

if defined?(ActiveRecord)
  ActiveRecord::Base.send(:include, NAttributes)
end
