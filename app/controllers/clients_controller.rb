class ClientsController < ApplicationController
  def new
    @client= Client.new
    @client.build_address
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:success] = " Client Created"
      redirect_to company_path(@client)
    else
      flash[:error] = "Error while creating new client"
      render 'new'
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
    if @client.update_attributes(client_params)
      flash[:success] = "successfully updated"
    end
  end

  def index
    @clients = Client.paginate(:page => params[:page], :per_page => 5)
  end
  private
  def client_params
    params.require(:client).permit(
      :id,
      :company_id,
      :name,
      :email,
      :mob_number,
      address_attributes: [
        :id,
        :line_1,
        :line_2,
        :country,
        :state,
        :zip,
        ])
  end
end

