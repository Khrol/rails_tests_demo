require 'minitest/autorun'

ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class FirstSimple < MiniTest::Test

  def driver
    @@driver ||= Selenium::WebDriver.for :chrome
  end

  def create_developer(name, rate, country)
    Developer.new(name: name, rate: rate, country: country)
  end

  5.times do |i|
    define_method "test_average_#{i}" do
      create_developer('Kolya', '5', 'Belarus')
      create_developer('Vasya', '10', 'Belarus')
      create_developer('Petya', '100', 'Lithuania')

      driver.get('http://localhost:3000/average/rate')
      driver.find_element(id: 'average_country').send_keys('Belarus')
      driver.find_element(name: 'commit').click

      assert_equal('7.5',
                   driver.find_element(xpath: '//body').text.split(":\n")[1])
    end
  end
end
