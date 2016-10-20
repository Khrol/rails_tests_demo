class RatesBroker
  def average_rate(country)
    data = RatesProvider.rates
    country_data = data.select {|x| x[0] == country}.map {|x| x[1]}
    country_data.inject(0.0) {|sum, r| sum + r} / country_data.size
  end
end
