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
  erb(:index)
end

#show avail. companies and have method to add/select one (READ)
get('/companies') do
  erb(:companies)
end

#add a new company with POST (CREATE)
post('/companies') do
  Company.create(name: params['name'])
  redirect to('/companies')
end

get('/companies/redirector') do 
  redirect to ("/companies/#{params['company_options']}")
end

#show a specific company and allow them to create a new order or view old orders (READ)
get('/companies/:company_id') do |company_id|
  @company = Company.find(company_id)
end
  
#add an order to a company with POST (CREATE)
post('/companies/:company_id/orders') do |company_id|
  company = Company.find(company_id)
  order = company.orders.create(month: params['month'])
  redirect to("/companies/#{company_id}/orders/#{order.id}")
end

#show a specific order for a company and allow them to add supplies with quantities
get('/companies/:company_id/orders/:order_id') do |company_id, order_id|
  @order = Order.find(order_id)
end

#show a report on all orders by month, with totals
get('/month/:month_id/orders') do |month_id|

end
