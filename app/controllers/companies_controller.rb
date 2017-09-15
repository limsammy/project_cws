class CompaniesController < ApplicationController

  def new
    @company = Company.new
    @company.build_address
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      flash[:error] = "Error while creating company"
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end
  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      flash[:success] = "Successfully updated"
      redirect_to company_path(@company)
    else
      flash[:error] = "Error in creating client"
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.paginate(:page => params[:page], :per_page => 10)
  end

  def find_states
    @states = CS.states(params[:country_value])
    render json: @states
  end
  def find_cities
    @cities = CS.cities(params[:state_value], params[:country_value])
    render json: @cities
  end

  private
    def company_params
      params.require(:company).permit(:id, :name, :phone_number, :department, :phone_number, :fax, :city,
                                      address_attributes: [
                                        :id ,
                                        :line_1 ,
                                        :line_2 ,
                                        :country ,
                                        :state ,
                                        :zip,
                                        :city])

    end
end
