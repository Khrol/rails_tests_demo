require 'minitest/autorun'

ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class FirstSimple < MiniTest::Unit::TestCase
  10000.times do |i|
    define_method "test_average_#{i}" do
      data = [
        ['Belarus', 5],
        ['Belarus', 10],
        ['Ukraine', 100]
      ]

      RatesProvider.stub :rates, data do
        assert_equal(7.5, RatesBroker.new.average_rate('Belarus'))
      end
    end
  end
end
