require('spec_helper')

describe(Company) do
  it('does not allow saving a company with a duplicate name') do
    Company.create({name: 'Epicodus'})
    Company.create({name: 'Epicodus'})
    expect(Company.all.count).to(eq(1))
  end
end
