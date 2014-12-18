require "n_attributes/version"

module NAttributes
  require 'n_attributes/railtie' if defined?(Rails)

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def n_attributes(*args)
      args.each do |arg|
        serialize %(:#{arg})
      end
    end
  end

  def method_missing(method, *args, &block)
    if method.present?
      run_split(method, *args, &block)
    else
      super
    end
  end

  def run_split(method, *args, &block)
    method = method.to_s
    attribute, key = method.gsub('=', '').split('_')
    if args[0].nil?
      get_value(attribute, key)
    else
      set_key(attribute, key, args[0])
    end
  end

  def set_key(field, key, value)
    if self.send(field).nil?
      self.send(field+ '=', Hash[key, value].to_s)
    else
      self.send(field+ '=', eval(self.send(field)).merge(Hash[key, value]).to_s)
    end
    self.save
  end

  def get_value(field, key)
    if key.present?
      eval(self.send(field))[key]
    end
  end
end

if defined?(ActiveRecord)
  ActiveRecord::Base.send(:include, NAttributes)
end
