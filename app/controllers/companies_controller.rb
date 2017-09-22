class CompaniesController < ApplicationController

  def new
    @company = Company.new
    @company.build_address
  end

  def create
    @company = Company.new(company_params)
     respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @company = Company.find(params[:id])
  end
  def update
    @company = Company.find(params[:id])
    respond_to do |format|
      if @company.update(product_params)
        format.html { redirect_to @company, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
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
