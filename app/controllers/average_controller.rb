class AverageController < ApplicationController
  def rate
  end

  def calculate
  end

  def calculate_api
    result = RatesBroker.new.average_rate(params[:country])
    render plain: "{\"rate\": #{result}}"
  end
end
