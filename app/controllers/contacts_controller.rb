class ContactsController < ApplicationController
  def new
    @contact= Contact.new
    @contact.build_address
  end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end
  def update
    @contact = Contact.find(params[:id])
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def index
    @contacts = Contact.all
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
  def contact_params
    params.require(:contact).permit(
      :id,
      :customer_id,
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

