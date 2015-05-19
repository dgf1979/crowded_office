require('spec_helper')

describe(Company) do
  it('does not allow saving a company with a duplicate name') do
    Company.create({name: 'Epicodus'})
    Company.create({name: 'Epicodus'})
    expect(Company.all.count).to(eq(1))
  end

  it('verifies that we can create a company, add an order, add a line to that order and finally have that line contain a supply') do
    epicodus = Company.create({name: 'Epicodus'})
    order = Order.create
    epicodus.orders.push(order)
    supply = Supply.create(name: 'Bic Pens')
    line = order.lines.create(quantity: 20, supply_id: supply.id)
    expect(Company.find(epicodus.id).orders.find(order.id).lines.find(line.id).supply_id).to(eq(supply.id))
  end
end
