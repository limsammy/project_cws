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
      flash[:error] = "Error in creating company"
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.all
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def company_params
      params.require(:company).permit(:id, :client_id,:name, :phone_number, :department, :fax, :_destroy,
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
