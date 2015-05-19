require('spec_helper')

describe(Line) do
  it('sets the default quantity to 1 if none is given') do
    line = Line.create()
    expect(line.quantity).to(eq(1))
  end
end
