desc 'n attributes rake task'
task :add_n_attributes do
  puts "Generating migration"
  `rails generate migration "add_#{ENV['field']}_to_#{ENV['model']}s" "#{ENV['field']}:text"`
  puts "Running migration"
  `rake db:migrate`
  puts "Migration created"
end
