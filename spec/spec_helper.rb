ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)

#ActiveRecord::Base.establish_connection(:test)
ActiveRecord::Base.logger = Logger.new(STDOUT)

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

puts "*******************"
puts "RACK_ENV: #{ENV['RACK_ENV']} "
puts "ActiveRecord Using: #{ActiveRecord::Base.connection_config[:database].upcase}"
puts "*******************"

RSpec.configure do |config|
  config.before(:each) do
    #optionally do something before each test
  end
  config.after(:each) do
    Company.all.each { |company| company.destroy }
    Order.all.each { |order| order.destroy }
    Line.all.each { |line| line.destroy }
    Supply.all.each { |supply| supply.destroy }
  end
end
