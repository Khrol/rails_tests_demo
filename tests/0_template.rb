require 'minitest/autorun'

ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class FirstSimple < MiniTest::Unit::TestCase

  def create_developer(driver, name, rate, country)
    driver.get('http://localhost:3000/developers/new')
    driver.find_element(id: 'developer_name').send_keys(name)
    driver.find_element(id: 'developer_rate').send_keys(rate)
    driver.find_element(id: 'developer_country').send_keys(country)
    driver.find_element(name: 'commit').click
  end

  5.times do |i|
    define_method "test_average_#{i}" do
      driver = Selenium::WebDriver.for :chrome

      driver.get('http://localhost:3000/average/rate')
      driver.find_element(id: 'average_country').send_keys('Belarus')
      driver.find_element(name: 'commit').click

      assert_equal('7.5',
                   driver.find_element(xpath: '//body').text.split(":\n")[1])

      driver.quit
    end
  end
end
