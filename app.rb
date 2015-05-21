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
  company = Company.create(name: params['name'])
  redirect to("/companies/#{company.id}")
end

get('/companies/redirector') do
  redirect to ("/companies/#{params['company_options']}")
end

#show a specific company and allow them to create a new order or view old orders (READ)
get('/companies/:company_id') do |company_id|
  @company = Company.find(company_id)
  erb(:company)
end

#add an order to a company with POST (CREATE)
post('/companies/:company_id/orders') do |company_id|
  company = Company.find(company_id)
  order = Order.create(month: params['month'].to_i, company_id: company.id)
  company.orders.push(order)
  redirect to("/companies/#{company_id}/orders/#{order.id}")
end

#fill out an order with PATCH (UPDATE)
patch('/companies/:company_id/orders/:order_id') do |company_id, order_id|
  order = Order.find(order_id)
  order.lines.create({ supply_id: params['supply_id'], quantity: params['quantity'] })

  redirect to("/companies/#{company_id}/orders/#{order.id}")
end

#cancel an order (DELETE)
delete('/companies/:company_id/orders/:order_id') do |company_id, order_id|
  order = Order.find(order_id).destroy
  redirect to("/companies/#{company_id}")
end
#cancel order - alternate GET method
get('/companies/:company_id/orders/:order_id/delete') do |company_id, order_id|
  order = Order.find(order_id).destroy
  redirect to("/companies/#{company_id}")
end

#show a specific order for a company and allow them to add supplies with quantities
get('/companies/:company_id/orders/:order_id') do |company_id, order_id|
  @order = Order.find(order_id)
  erb(:order)
end

####
#REPORTS
#show a report on all orders by month, with totals
get('/month/:month_id/orders') do |month_id|
  @orders = Order.where("month_id = ?", month_id)
  erb(:orders_by_month)
end

####
#SUPPLIES

#list/add supplies (READ)
get('/supplies') do
  erb(:supplies)
end

#add supply item (CREATE)
post('/supplies') do
  Supply.create({ name: params['name'], unit_price: params['unit_price']})
  redirect to('/supplies')
end

####
#SUPPLY

#view/edit an individual supply item (READ)
get('/supplies/:supply_id') do |supply_id|
  @supply = Supply.find(supply_id)
  erb(:supply)
end

#modify a supply item (UPDATE)
patch('/supplies/:supply_id') do |supply_id|
  updates = Hash.new
  supply = Supply.find(supply_id)
  updates[:name] = params['name'] if params.has_key?('name')
  updates[:unit_price] = params['unit_price'] if params.has_key?('unit_price')
  supply.update(updates) if updates.count > 0
  redirect to("/supplies")
end

#delete (DELETE)
delete('/supplies/:supply_id') do |supply_id|
  Supply.find(supply_id).destroy
  redirect to('/supplies')
end
