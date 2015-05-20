require('spec_helper')

describe(Order) do
  it('does not allow saving an order without a company id and month id from 1-12') do
    Order.create()
    Order.create(company_id: 4)
    Order.create(month_id: 2)
    Order.create(company_id: 4, month_id: 2)
    expect(Order.all.count).to(eq(1))
  end

  it('returns the month name of the stored month') do
    order = Order.create(company_id: 4, month_id: 8)
    expect(order.month_name).to(eq('August'))
  end
end
