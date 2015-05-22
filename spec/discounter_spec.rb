require('spec_helper')

describe(Discount) do
  it('returns a discounted unit cost for quantities equalling or surpassing a threshold') do
    quantity = 100 #30% off
    price = 2.00
    expect(Discount.calculate(quantity, price)).to(eq(1.40))
    quantity = 1000 #50% off
    expect(Discount.calculate(quantity, price)).to(eq(1.00))
    quantity = 20 #10% off
    expect(Discount.calculate(quantity, price)).to(eq(1.80))
  end
end
