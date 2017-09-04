class CompaniesController < ApplicationController

  def index

  end

  def new
    @company = Company.new
    @company.build_address
  end

  def create
    @company = Company.new(company_params)
    binding.pry
    if @company.save
      redirect_to company_path(@company)
    end
  end

  def edit
    binding.pry
    @company = Company.find(params[:id])
  end

  def update
    binding.pry
     @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      flash[:success] = "Successfully updated"
      redirect_to company_path(@company)
    else
      render :new
    end
  end
  def show
    @company = Company.find(params[:id])
  end

  def destroy

  end


  private
    def company_params
      binding.pry
      params.require(:company).permit(:id, :name, :department, :phone_number, :fax,
                                      address_attributes: [
                                        :id ,
                                        :line_1 ,
                                        :line_2 ,
                                        :country ,
                                        :state ,
                                        :zip])

    end
end
