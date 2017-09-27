class ClientsController < ApplicationController
  def new
    @client= Client.new
    @client.build_address
  end

  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end
  def update
    @client = Client.find(params[:id])
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def index
    @clients = Client.all
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


  private
  def client_params
    params.require(:client).permit(
      :id,
      :company_id,
      :name,
      :email,
      :mob_number,
      :_destroy,
      address_attributes: [
        :id,
        :line_1,
        :line_2,
        :country,
        :state,
        :zip,
        :city
        ])
  end
end

