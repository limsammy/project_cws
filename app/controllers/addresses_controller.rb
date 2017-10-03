class AddressesController < ApplicationController

  def find_states
    @states = CS.states(params[:country_value])
    @cities = @states.present? ? CS.get(params[:country_value], @states.first[0]) : ''
    render json: {states: @states, cities: @cities}
  end

  def find_cities
    @cities = CS.get(params[:country_value], params[:state_value])
    render json: @cities
  end


  def get_zip_data
    zip_data = Zipcode.find_by_code params[:id]
    if zip_data.present?
      city = zip_data.city
      state = zip_data.state.name
      coordinates = "#{zip_data.lat},#{zip_data.lon}"
      coordinates_info= Geocoder.search(coordinates)
      country = coordinates_info.first.data["formatted_address"].split(',').last.strip
      render json: {city: city, state: state, country: country }
    else
      render json: {value: 0}
    end
  end



end
