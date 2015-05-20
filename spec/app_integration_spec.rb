require('spec_helper')
require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('Sinatra framework check', { :type => :feature }) do
  it('verifies basic routing and view setup') do
    visit('/test')
    expect(page).to have_content('Sinatra OK')
  end
end

describe('Application Integration', { :type => :feature }) do
  describe('Company:') do
    it('lists companies') do
      Company.create(name: 'Epicodus')
      Company.create(name: 'Multnomah County')
      visit('/companies')
      expect(page.html).to include('Epicodus')
      expect(page.html).to include('Multnomah County')
    end
  end

  describe('Orders By Month') do
    it('lists each order line with totals for quantities') do
      pens = Supply.create(name: 'Bic Pens', unit_price: 2.0)
      stapler = Supply.create(name: 'Red Swingline', unit_price: 8.0)

      company = Company.create({name: 'Epicodus'})
      order = company.orders.create(month: 4)
      order.lines.create({ supply_id: pens.id, quantity: 200})
      order.lines.create({ supply_id: stapler.id, quantity: 2})

      company = Company.create({name: 'Multnomah County'})
      order = company.orders.create(month: 4)
      order.lines.create({ supply_id: pens.id, quantity: 200})
      order.lines.create({ supply_id: stapler.id, quantity: 2})

      visit('/month/4/orders')
      #save_and_open_page
      expect(page).to have_content('Epicodus')
      expect(page).to have_content('Multnomah County')
      expect(page).to have_content('Bic Pens')
      expect(page).to have_content('Red Swingline')
      expect(page).to have_content('400')
      expect(page).to have_content('16')
    end
  end
end
