class SearchController < ApplicationController

  def index
    zip = params[:q]
    # conn = Faraday.new(url: 'https://developer.nrel.gov/api/alt-fuel-stations/v1') do |faraday|
    # #   faraday.headers["api_key"] = "FVyyBmXK03QnpuDtmgiIlcDQ2r6USMXO1dcvYyVE"
    #   faraday.adapter Faraday.default_adapter
    # end
    # binding.pry
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&fuel_type=LPG,ELEC&radius=6.0&limit=10&api_key=FVyyBmXK03QnpuDtmgiIlcDQ2r6USMXO1dcvYyVE")

    @stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

end
