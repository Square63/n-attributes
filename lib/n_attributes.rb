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

  def method_missing(meth, *args, &block)
    if meth.present?
      run_split(meth, *args, &block)
    else
      super
    end
  end

  def run_split(meth, *args, &block)
    meth = meth.to_s
    attribute, key = meth.gsub('=', '').split('_')
    if args[0].nil?
      get_key_value(attribute, key)
    else
      set_key_pair(attribute, key, args[0])
    end
  end

  def set_key_pair(field, key, value)
    if self.send(field).nil?
      self.send(field+ '=', Hash[key, value].to_s)
    else
      self.send(field+ '=', eval(self.send(field)).merge(Hash[key, value]).to_s)
    end
    self.save
  end

  def get_key_value(field, key)
    if key.present?
      eval(self.send(field))[key]
    end
  end
end
