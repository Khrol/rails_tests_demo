require 'minitest/autorun'

ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class FirstSimple < MiniTest::Unit::TestCase

  def create_developer(name, rate, country)
    Developer.create(name: name, rate: rate, country: country)
  end

  def driver
    @@driver ||= Selenium::WebDriver.for :chrome
  end

  10.times do |i|
    define_method "test_average_#{i}" do
      create_developer('Vasya', '5', 'Belarus')
      create_developer('Petya', '10', 'Belarus')
      create_developer('Zoya', '100', 'Ukraine')

      driver.get('http://localhost:3000/average/rate')
      driver.find_element(id: 'average_country').send_keys('Belarus')
      driver.find_element(name: 'commit').click

      assert_equal('7.5',
                   driver.find_element(id: 'average_rate').text)
    end
  end
end
