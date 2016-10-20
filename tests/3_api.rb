require 'minitest/autorun'

ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class FirstSimple < MiniTest::Test

  def create_developer(name, rate, country)
    Developer.new(name: name, rate: rate, country: country)
  end

  100.times do |i|
    define_method "test_average_#{i}" do
      create_developer('Kolya', '5', 'Belarus')
      create_developer('Vasya', '10', 'Belarus')
      create_developer('Petya', '100', 'Lithuania')

      url = 'http://localhost:3000/average/calculate_api?country=Belarus'
      uri = URI(url)
      response = Net::HTTP.get(uri)

      assert_equal(7.5, JSON.parse(response)['rate'])
    end
  end
end
