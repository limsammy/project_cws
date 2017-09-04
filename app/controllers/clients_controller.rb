class ClientsController < ApplicationController
  def new
    binding.pry
    @client= Client.new
    @client.build_address
  end

  def create
    binding.pry
    @client = Client.new(client_params)
    if @client.save
      flash[:success] = " Client Created"
      redirect_to company_path(@client)
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
  private
  def client_params
    params.require(:client).permit(:id, :name, :email, :mob_number,
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

