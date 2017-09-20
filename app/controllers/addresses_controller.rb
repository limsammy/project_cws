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
end
