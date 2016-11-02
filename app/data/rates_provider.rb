class RatesProvider
  def self.rates
    Developer.all.pluck(:country, :rate)
  end
end
