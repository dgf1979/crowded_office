require("bundler/setup")
Bundler.require(:default, :production)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/test') do
  @test_var = 'Sinatra OK'
  @db = "ActiveRecord Using: #{ActiveRecord::Base.connection_config[:database].upcase}"
  erb(:test)
  #redirect to('/')
end

#show a specific company and allow to add orders
get('/') do

end

#show avail. companies and have method to add/select one mock
get('/companies') do

end

#show a specific company and allow them to create a new order or view old orders
get('/companies/:company_id') do |company_id|

end

#show a specific order for a company and allow them to add supplies with quantities
get('/companies/:company_id/orders/:order_id') do |company_id, order_id|

end

#show a report on all orders by month, with totals
get('/month/:month_id/orders') do |month_id|

end
