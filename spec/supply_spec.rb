require('spec_helper')

describe(Supply) do
  it('does not allow creating without a unique, none-empty name') do
    Supply.create()
    Supply.create(name: '')
    Supply.create(name: 'Red Swingline Stapler')
    Supply.create(name: 'Red Swingline Stapler')
    expect(Supply.all.count).to(eq(1))
  end
end
