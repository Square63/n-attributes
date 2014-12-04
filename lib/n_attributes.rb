require "n_attributes/version"

module NAttributes
  require 'n_attributes/railtie' if defined?(Rails)
  def self.ipsum
    "Lorem ipsum dolor sit amet, consectetur adipisicing ...."
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def n_attributes(*args)
      args.each do |arg|
        serialize %(:#{arg})
      end
    end

    def inherited(subclass)
      @n_attributes.each do |n_attrib|
        instance_var = "@#{n_attrib}"
        subclass.instance_variable_set(instance_var, instance_variable_get(instance_var))
      end
    end
  end
end
