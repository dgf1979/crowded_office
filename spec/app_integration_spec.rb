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

end
