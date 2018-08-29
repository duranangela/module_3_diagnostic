class SearchController < ApplicationController

  def index
    zip = params[:zipcode]
    @conn = Faraday.new(https://developer.nrel.gov/api/alt-fuel-stations/v1) do |faraday|
      faraday.headers["api-key"] = "FVyyBmXK03QnpuDtmgiIlcDQ2r6USMXO1dcvYyVE"
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/nearest.json?location=#{zip}&fuel_type=LPG,ELEC&radius=6.0&limit=10")

  end

end
