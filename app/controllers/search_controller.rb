class SearchController < ApplicationController

  def index
    zip = params[:q]

    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{zip}&fuel_type=LPG,ELEC&radius=6.0&limit=10&api_key=FVyyBmXK03QnpuDtmgiIlcDQ2r6USMXO1dcvYyVE")

    @stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

end
