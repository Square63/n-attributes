require 'n_attributes'
require 'rails'

module NAttributes
  class Railtie < Rails::Railtie
    railtie_name :n_attributes

    rake_tasks do
      load "tasks/n_attributes.rake"
    end
  end
end
